from app.utils.db import ConexionBaseDatos


class administrador:
    def __init__(self, id, nombre, correo):
        self.id = id
        self.nombre = nombre
        self.correo = correo

    def a_diccionario(self):
        return {
            "id":self.id,
            "nombre":self.nombre,
            "correo":self.correo,
            
        }
    @staticmethod
    def obtener_todos(cls=None):
        conexion_db = ConexionBaseDatos()
        conexion = None
        cursor = None
    
        try:
            conexion=conexion_db.conectar()
            if conexion is None:
                return []
            cursor = conexion.cursor(dictionary=True)
        
            cursor.execute("SELECT * FROM usuarios INNER JOIN persona ON usuarios.id_usu = persona.id_usu GROUP BY usuarios.id_usu")
            filas_usuarios = cursor.fetchall()
            print(f"DEBUG: La DB devolvió {len(filas_usuarios)} registros")
            list_usu = []
            for fila in filas_usuarios:
                id_usu = fila.get("id", fila.get("id_usu"))
                nom_usu = fila.get("nombre", fila.get("nom_usu"))
                correo_usu = fila.get("correo", fila.get("correo_usu"))
                
                list_usu.append(
                    administrador(
                        id=id_usu,
                        nombre = nom_usu,
                        correo = correo_usu,
                       
                    )
                )   
            return list_usu
        finally:
            if cursor is not None:
                cursor.close()
            if conexion is not None:
                conexion_db.cerrar_conexion()
    #Buscar usuario
    @staticmethod
    def obtener_por_correo(correo_usu):
        conexion_db = ConexionBaseDatos()
        cursor = None
        try:
            conexion = conexion_db.conectar()
            cursor = conexion.cursor(dictionary=True, buffered=True)
            
            # Buscamos solo uno por su ID
            cursor.execute("SELECT * FROM usuarios WHERE correo_usu = %s", [correo_usu])
            fila = cursor.fetchone()
            while cursor.nextset():
                pass

            if fila:
                # Retornamos el objeto administrador ya armado
                return administrador(
                    id=fila.get("id_usu"),
                    nombre=fila.get("nom_usu"),
                    correo=fila.get("correo_usu"),
                    password=fila.get("contrasena")
                )
            return None # Si no lo encuentra
        except Exception as e:
            print(f"Error en login: {e}")
        finally:
            if cursor:
                cursor.close()
    #insertar datos para crear usuario
    @staticmethod
    def create(rol,tip_doc,nom_usu,email,password,local,p_nom,p_ape,n_tel,direc,n_doc):
        conexion_db = ConexionBaseDatos()
        cursor = None
        try:
            conexion = conexion_db.conectar()
            cursor = conexion.cursor()
            # PASO 1: Insertar en la tabla 'usuarios'
            sql_user = "INSERT INTO usuarios (nom_usu, correo_usu, contrasena, id_estado) VALUES (%s, %s, %s,%s)"
            cursor.execute(sql_user, (nom_usu, email, password,1))
        
            # Obtenemos el ID que se acaba de crear para este usuario
            id_usuario_creado = cursor.lastrowid

            # PASO 2: Insertar en la tabla 'persona' usando el ID anterior
            sql_persona = """
                INSERT INTO persona (id_tipo_doc, id_usu, id_local, primer_nombre, primer_apelli, telefono, direccion, num_doc)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """
            cursor.execute(sql_persona, (tip_doc, id_usuario_creado, local, p_nom, p_ape, n_tel, direc, n_doc))
        
            # Obtenemos el ID de la persona creada
            id_persona_creada = cursor.lastrowid

            # PASO 3: Insertar en la tabla 'p_rol' (Persona_Rol)
            sql_rol = "INSERT INTO p_rol (id_per, id_rol) VALUES (%s, %s)"
            cursor.execute(sql_rol, (id_persona_creada, rol))

            # ¡MUY IMPORTANTE! Guardar todos los cambios
            conexion.commit()
            return True

        except Exception as e:
            print(f"Error al insertar el valor: {e}")
            return False
        
        finally:
            if cursor:
                cursor.close()
            if conexion:
                conexion.close()

