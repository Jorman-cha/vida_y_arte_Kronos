from flask import Flask
from app.config import ConfigDB

def create_app():
    app = Flask(__name__)

    app.config.from_object(ConfigDB)

    from app.blueprints.pagina.pagina import pagina_bp
    from app.blueprints.auth import auth_bp

    app.register_blueprint(pagina_bp)
    app.register_blueprint(auth_bp)

    return app
