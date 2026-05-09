from app.utils.db import ConexionBaseDatos

def main():
    print("Iniciando sistema de gestión de tickets...")

    # Crear instancia de la base de datos
    conexion_bd = ConexionBaseDatos()
    conexion = conexion_bd.conectar()

    # Chequear la conexión
    if conexion_bd.Check_DB():
        print("Conexión a la base de datos verificada correctamente.")
    else:
        print("No se pudo establecer la conexión a la base de datos.")

    # Aquí se puede agregar el código de inicio de la aplicación, por ejemplo un servidor web

    # Cerramos la conexión al finalizar
    conexion_bd.cerrar_conexion()
    print("Sistema finalizado.")

if __name__ == "__main__":
    main()