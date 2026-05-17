from werkzeug.security import check_password_hash
from app.utils.db import ConexionBaseDatos

class login:
    def __init__(self, id, nombre, correo, password, rol=None):
        self.id = id
        self.nombre = nombre
        self.correo = correo
        self.password = password
        self.rol = rol 

    def a_diccionario(self):
        return {
            "id": self.id,
            "nombre": self.nombre,
            "correo": self.correo,
            "rol": self.rol
        }

    @staticmethod
    def credenciales(correo, clave_plana):
        conexion_db = ConexionBaseDatos()
        conexion = None
        cursor = None

        try:
            conexion = conexion_db.conectar()
            if conexion is None:
                return None
        
            cursor = conexion.cursor(dictionary=True)

            consulta_correo = """
                SELECT 
                    u.id_usu, 
                    u.nom_usu, 
                    u.correo_usu, 
                    u.contrasena,
                    r.nom_rol AS nombre_rol,
                    p.primer_nombre, 
                    p.primer_apelli,
                    e.nom_estado 
                FROM usuarios u
                LEFT JOIN persona p ON u.id_usu = p.id_usu
                LEFT JOIN p_rol pr ON p.id_per = pr.id_per
                LEFT JOIN rol r ON pr.id_rol = r.id_rol
                LEFT JOIN estado e ON u.id_estado = e.id_estado 
                WHERE u.correo_usu = %s 
                LIMIT 1
            """
            cursor.execute(consulta_correo, (correo,))
            usu_row = cursor.fetchone()

            if not usu_row:
                print("DEBUG: Usuario no encontrado en la base de datos.")
                return None
        
            clave_h_alm = usu_row.get("contrasena")
            
            # Validación limpia del hash en una sola condición
            if not clave_h_alm or not check_password_hash(clave_h_alm, clave_plana):
                print("DEBUG: Contraseña incorrecta o hash inexistente.")
                return None

            nombre_completo = f"{usu_row.get('primer_nombre', '')} {usu_row.get('primer_apelli', '')}".strip()
            if not nombre_completo:
                nombre_completo = usu_row.get("nom_usu")

            return login(
                id = usu_row.get("id_usu"),
                nombre = nombre_completo,
                correo = usu_row.get("correo_usu"),
                password = clave_h_alm,
                rol = usu_row.get("nombre_rol")
            )

        except Exception as e:
            print(f"Error en credenciales: {e}")
            return None
        finally:
            if cursor:
                cursor.close()
            if conexion:
                conexion_db.cerrar_conexion()