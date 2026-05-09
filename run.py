#import flask
from flask import Flask
from app.blueprints.pagina.pagina import pagina_bp
from app.blueprints.auth.routes import auth_bp
from app.config import ConfigDB

#crear objeto de control 
app=Flask(__name__,template_folder='app/templates',static_folder='app/static')   

app.config.from_object(ConfigDB)
#Tomar los url de blueprint 
app.register_blueprint(pagina_bp)
app.register_blueprint(auth_bp)


#identificar como ejecutable
if __name__==("__main__"):
    app.run(debug=True)
