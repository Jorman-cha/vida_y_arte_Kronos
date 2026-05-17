# app/models/usuario.py
from app.utils.db import ConexionBaseDatos

class Usuario:
    def __init__(self, id_usu=None, nom_usu=None, correo_usu=None, contrasena=None, id_estado=1):
        self.id_usu = id_usu
        self.nom_usu = nom_usu
        self.correo_usu = correo_usu
        self.contrasena = contrasena
        self.id_estado = id_estado

    # Centralizamos la conexión para no repetir código
    @staticmethod
    def _ejecutar_consulta(sql, parametros=None, devolver_datos=False, es_fetchone=False):
        conexion_db = ConexionBaseDatos()
        conexion = None
        cursor = None
        try:
            conexion = conexion_db.conectar()
            cursor = conexion.cursor(dictionary=True)
            cursor.execute(sql, parametros or ())
            
            if devolver_datos:
                return cursor.fetchone() if es_fetchone else cursor.fetchall()
            
            conexion.commit()
            return True
        except Exception as e:
            print(f"Error en la base de datos: {e}")
            if conexion and not devolver_datos:
                conexion.rollback()
            return False if not devolver_datos else (None if es_fetchone else [])
        finally:
            if cursor: cursor.close()
            if conexion: conexion_db.cerrar_conexion()

    # Eliminar ahora es un método limpio de instancia
    def eliminar(self):
        sql = "DELETE FROM usuarios WHERE id_usu = %s"
        return self._ejecutar_consulta(sql, (self.id_usu,))

    # Actualizar ahora es un método limpio de instancia
    def actualizar(self, cb_rol, sl_tipo_doc):
        # Aquí puedes meter la lógica de actualizar tanto usuario como su rol/tipo_doc
        sql_user = "UPDATE usuarios SET nom_usu = %s, correo_usu = %s WHERE id_usu = %s"
        return self._ejecutar_consulta(sql_user, (self.nom_usu, self.correo_usu, self.id_usu))