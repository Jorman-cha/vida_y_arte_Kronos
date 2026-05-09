#Importar la lib de mysql
import mysql.connector
from app.config import ConfigDB

#definir una clase para la conexion DB

class ConexionBaseDatos:
    #_instancia
    _instancia=None
    #_conexion
    _conexion=None
    #Metodo implementar singeton
    def __new__(cls,*args,**kwargs):
        #si no existe una instancia se crea
        if cls._instancia is None:
            cls._instancia=super(ConexionBaseDatos,cls).__new__(cls)
            #devolver la imstancia
        return cls._instancia   
    #metodo para conectar la DB   
    def conectar(self):
        #si no existe una conexion activa se crea
        if self._conexion is None or not self._conexion.is_connected():
            try:
                #Utiliza el config Db para los parametros de la conexion
                self._conexion=mysql.connector.connect(
                    host=ConfigDB.HOST,
                    port=ConfigDB.PORT,
                    user=ConfigDB.USER,
                    password=ConfigDB.PASSWORD,
                    database=ConfigDB.NAME
                )
            except mysql.connector.Error as Err:
                #imprima el mensaje y el error
                print(f"Error al conectar la base de datos: {Err} ")
                self._conexion=None
                raise
                #Retornar el erroe
        return self._conexion
    #cerrar la conexion a la base de datos
    def cerrar_conexion(self):
        #verificar que exita conexion primero
        if self._conexion is not None and self._conexion.is_connected():
            #cerrar la conexion
            self._conexion.close()
            #limpiar la conexion
            self._conexion=None
            
    #Metodo verificar conexion DB
    def Check_DB(self):
        """
            Verifica si hay conexiones activas y muestra un mensaje si el true hay conexion, false no hay 
        """
        if self._conexion is not None and self._conexion.is_connected():
            print("Esta vaina si funciona, si hay conexion")
            return True
        else:
            print("Esta vaina no funciona, no hay conexion")
            return False
    
