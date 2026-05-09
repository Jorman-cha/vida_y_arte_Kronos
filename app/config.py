import secrets
import os
class ConfigDB:
    SECRET_KEY = os.environ.get("SECRET_KEY") or secrets.token_hex(32)
    HOST =  "localhost"
    USER = "root"
    PASSWORD = ""
    NAME = "gestion_horarios"
    PORT = 3306
    
   