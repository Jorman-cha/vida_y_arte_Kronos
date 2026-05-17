# app/models/administrador.py
from app.models.usuario import Usuario
from app.utils.db import ConexionBaseDatos

class Administrador(Usuario):
    def __init__(self, id_usu=None, nom_usu=None, correo_usu=None, contrasena=None):
        # Heredamos las propiedades de Usuario
        super().__init__(id_usu, nom_usu, correo_usu, contrasena)

    @classmethod
    def obtener_todos(cls):
        sql = """
            SELECT u.id_usu, u.nom_usu, u.correo_usu, p.primer_nombre, p.primer_apelli 
            FROM usuarios u
            LEFT JOIN persona p ON u.id_usu = p.id_usu
            WHERE u.id_estado = 1
        """
        filas = cls._ejecutar_consulta(sql, devolver_datos=True)
        return [cls(id_usu=f["id_usu"], nom_usu=f["nom_usu"], correo_usu=f["correo_usu"]) for f in filas]

    @classmethod
    def obtener_por_correo(cls, correo_usu):
        sql = "SELECT id_usu, nom_usu, correo_usu FROM usuarios WHERE correo_usu = %s"
        fila = cls._ejecutar_consulta(sql, (correo_usu,), devolver_datos=True, es_fetchone=True)
        if fila:
            return cls(id_usu=fila["id_usu"], nom_usu=fila["nom_usu"], correo_usu=fila["correo_usu"])
        return None

    @classmethod
    def crear_sistema_completo(cls, datos_registro):
        """
        Maneja la lógica compleja de insertar en las 3 tablas usando el método centralizado.
        datos_registro: diccionario con todos los campos del formulario.
        """
        # Nota: Para mantener una transacción real estricta de 3 inserciones, 
        # a veces es mejor usar el formato clásico con 'rollback', pero agrupado aquí:
        
        db = ConexionBaseDatos()
        conexion = db.conectar()
        cursor = conexion.cursor()
        try:
            # 1. Usuarios
            cursor.execute(
                "INSERT INTO usuarios (nom_usu, correo_usu, contrasena, id_estado) VALUES (%s, %s, %s, %s)",
                (datos_registro['nom_usu'], datos_registro['email'], datos_registro['password_h'], 1)
            )
            id_usuario = cursor.lastrowid

            # 2. Persona
            sql_persona = """
                INSERT INTO persona (id_tipo_doc, id_usu, id_local, primer_nombre, primer_apelli, telefono, direccion, num_doc)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(sql_persona, (
                datos_registro['tip_doc'], id_usuario, datos_registro['local'], 
                datos_registro['p_nom'], datos_registro['p_ape'], datos_registro['n_tel'], 
                datos_registro['direc'], datos_registro['n_doc']
            ))
            id_persona = cursor.lastrowid

            # 3. Rol
            sql_rol = "INSERT INTO p_rol (id_per, id_rol) VALUES (%s, %s)"
            cursor.execute(sql_rol, (id_persona, datos_registro['rol']))
            
            # Si todo sale bien, se guardan los cambios de manera estricta
            conexion.commit()

            return True
        except Exception as e:
            print(f"Error en transacción de creación: {e}")
            conexion.rollback()
            return False
        finally:
            cursor.close()
            db.cerrar_conexion()
    @staticmethod
    def obtener_por_id(id_usu):
        db = ConexionBaseDatos() #
        conexion = db.conectar()
        cursor = conexion.cursor(dictionary=True)
        usuario_objeto = None
        try:
            # Hacemos un SELECT relacionando las tablas para traer los datos actuales
            sql = """
                SELECT u.id_usu, u.nom_usu, u.correo_usu, u.contrasena, 
                       p.id_tipo_doc, p.id_local, p.primer_nombre, p.primer_apelli, 
                       p.telefono, p.direccion, p.num_doc, r.id_rol
                FROM usuarios u
                LEFT JOIN persona p ON u.id_usu = p.id_usu
                LEFT JOIN p_rol r ON p.id_per = r.id_per
                WHERE u.id_usu = %s
            """
            cursor.execute(sql, (id_usu,))
            res = cursor.fetchone()
                
            if res:
                # Mapeamos TODO el resultado a la instancia de Administrador
                usuario_objeto = Administrador(
                    id_usu=res['id_usu'],
                    nom_usu=res['nom_usu'],
                    correo_usu=res['correo_usu'],
                    contrasena=res['contrasena']
                )
                # Opcional: Si tu constructor de Administrador acepta más campos, 
                # puedes asignárselos aquí como atributos dinámicos:
                usuario_objeto.id_tipo_doc = res['id_tipo_doc']
                usuario_objeto.id_local = res['id_local']
                usuario_objeto.primer_nombre = res['primer_nombre']
                usuario_objeto.primer_apelli = res['primer_apelli']
                usuario_objeto.telefono = res['telefono']
                usuario_objeto.direccion = res['direccion']
                usuario_objeto.num_doc = res['num_doc']
                usuario_objeto.id_rol = res['id_rol']
                
        except Exception as e:
            print(f"Error en el modelo al buscar usuario por ID: {e}")
        finally:
            cursor.close()
            conexion.close()
            
        return usuario_objeto

    @staticmethod
    def actualizar_completo(datos_registro):
        db = ConexionBaseDatos()
        conexion = db.conectar()
        cursor = conexion.cursor()
        try:
            # 1. Bloque condicional de usuarios
            if datos_registro['password_h'] is not None:
                sql_usuarios = """
                    UPDATE usuarios SET nom_usu = %s, correo_usu = %s, contrasena = %s WHERE id_usu = %s
                """
                valores_usuarios = (datos_registro['nom_usu'], datos_registro['email'], datos_registro['password_h'], datos_registro['id_usu'])
            else:
                sql_usuarios = """
                    UPDATE usuarios SET nom_usu = %s, correo_usu = %s WHERE id_usu = %s
                """
                valores_usuarios = (datos_registro['nom_usu'], datos_registro['email'], datos_registro['id_usu'])
                
            cursor.execute(sql_usuarios, valores_usuarios)

            # 2. Bloque de persona
            sql_persona = """
                UPDATE persona 
                SET id_tipo_doc = %s, id_local = %s, primer_nombre = %s, 
                    primer_apelli = %s, telefono = %s, direccion = %s, num_doc = %s
                WHERE id_usu = %s
            """
            cursor.execute(sql_persona, (
                datos_registro['tip_doc'], datos_registro['local'], datos_registro['p_nom'], 
                datos_registro['p_ape'], datos_registro['n_tel'], datos_registro['direc'], 
                datos_registro['n_doc'], datos_registro['id_usu']
            ))

            # 3. Bloque de rol
            sql_rol = """
                UPDATE p_rol SET id_rol = %s WHERE id_per = (SELECT id_per FROM persona WHERE id_usu = %s)
            """
            cursor.execute(sql_rol, (datos_registro['rol'], datos_registro['id_usu']))
            
            # 🚨 ¡ESTA LÍNEA DEBE EJECUTARSE SÍ O SÍ!
            conexion.commit() 
            print("💾 ¡Commit ejecutado con éxito en MySQL!")
            return True
            
        except Exception as e:
            conexion.rollback()
            print(f"❌ Error en el modelo al actualizar usuario: {e}")
            return False
        finally:
            cursor.close()
            conexion.close()
            
    @staticmethod
    def eliminar_completo(id_usu):
        db = ConexionBaseDatos()
        conexion = db.conectar()
        cursor = conexion.cursor()
        try:
            # En lugar de DELETE, hacemos un UPDATE del estado a 0 (Inactivo)
            sql = "UPDATE usuarios SET id_estado = 2 WHERE id_usu = %s"
            cursor.execute(sql, (id_usu,))
            
            # Confirmamos el cambio en MySQL
            conexion.commit()
            return True

        except Exception as e:
            conexion.rollback()
            print(f"Error en el modelo al inactivar usuario: {e}")
            return False
        finally:
            cursor.close()
            conexion.close()