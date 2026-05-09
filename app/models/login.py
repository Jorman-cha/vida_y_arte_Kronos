from werkzeug.security import check_password_hash
from app.utils.db import ConexionBaseDatos

class login:
    # Añadimos rol al constructor
    def __init__(self, id, nombre, correo, password, rol=None):
        self.id = id
        self.nombre = nombre
        self.correo = correo
        self.password = password
        self.rol = rol # Guardamos el nombre del rol

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

            # Ajustamos los nombres de las columnas según tu diagrama (u.contrasena)
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
            print(f"DEBUG: Usuario encontrado: {usu_row}")

            if not usu_row:
                return None
        
            # Buscamos la columna 'contrasena' que es la que está en tu DB
            clave_h_alm = usu_row.get("contrasena")
            print(f"DEBUG: Hash en DB: {clave_h_alm}") # <--- AÑADE ESTO
            print(f"DEBUG: Coincide? {check_password_hash(clave_h_alm, clave_plana)}")
            
            if not clave_h_alm or not check_password_hash(clave_h_alm, clave_plana):
                return None
            if not clave_h_alm:
                print("DEBUG: No se encontró la columna 'contrasena' en el resultado")
                return None

            if not check_password_hash(clave_h_alm, clave_plana):
                print(f"DEBUG: El hash no coincide. Hash en DB: {clave_h_alm}")
                return None
            # Construimos el nombre completo desde la tabla persona
            nombre_completo = f"{usu_row.get('primer_nombre', '')} {usu_row.get('primer_apelli', '')}".strip()
            if not nombre_completo:
                nombre_completo = usu_row.get("nom_usu")

            # Creamos el objeto con los parámetros correctos
            usu_val = login(
                id = usu_row.get("id_usu"),
                nombre = nombre_completo,
                correo = usu_row.get("correo_usu"),
                password = clave_h_alm,
                rol = usu_row.get("nombre_rol")
            )

            return usu_val

        except Exception as e:
            print(f"Error en credenciales: {e}")
            return None
        finally:
            if cursor:
                cursor.close()
            if conexion:
                conexion_db.cerrar_conexion()