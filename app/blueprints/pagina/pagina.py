from flask import Blueprint,render_template,request,redirect,url_for,flash,session
from app.utils.db import ConexionBaseDatos
from app.models.administrador import administrador
from werkzeug.security import generate_password_hash

pagina_bp = Blueprint('pagina', __name__)

#ruta de salida
@pagina_bp.route('/')
#declara - definir funcion 
def principal():
    return render_template("pagina/principal.html")

@pagina_bp.route('/novedades')
def inicio():
    return render_template("pagina/novedades.html")

@pagina_bp.route('/informacion')
def info():
    return render_template("pagina/info.html")


@pagina_bp.route('/perfil')
def perfil():   
    if 'user_id' not in session:
        return redirect(url_for('auth.registro'))
    db = ConexionBaseDatos()
    cursor = None
    try:
        conexion = db.conectar()
        cursor = conexion.cursor(dictionary=True)

        cursor.execute("SELECT *FROM usuarios WHERE id_usu = %s", [session['user_id']] )
        user = cursor.fetchone()
        return render_template("pagina/perfil.html", usuario = user)
    finally:
        if cursor:
            cursor.close()

@pagina_bp.route('/Buscar_Usuario')
def bus_usu():
    list_usu = administrador.obtener_todos()
    return render_template("pagina/bus_usu.html",usuarios=list_usu)

@pagina_bp.route('/Crear_Usuario')
def cre_usu():
    return render_template("pagina/cre_usu.html")
@pagina_bp.route('/guardar', methods=['POST'])
def guardar():
    rol=request.form.get('cb_rol')
    tip_doc=request.form.get('sl_tipo_doc')
    nom_usu=request.form.get('nom_usu')
    email=request.form.get('correo_usu')
    password_plana=request.form.get('contrasena')
    local=request.form.get('sl_local')
    p_nom=request.form.get('pri_nom')
    p_ape=request.form.get('pri_ape')
    n_tel=request.form.get('tel')
    direc=request.form.get('direc')
    n_doc=request.form.get('num_doc')

    password_h = generate_password_hash(password_plana)

    Logrado= administrador.create(rol,tip_doc,nom_usu,email,password_h,local,p_nom,p_ape,n_tel,direc,n_doc)
    if Logrado:
        flash ('Registro exitoso')
        return redirect(url_for('pagina.bus_usu'))
    else:
        return "Error al insertar en la base de datos. Revisa la consola de VS Code."
@pagina_bp.route('/salir')
def salir():
    # 1. Eliminamos todos los datos guardados en la sesión (user_id, user_name, etc.)
    session.clear()
    
    # 2. Mostramos un mensaje informativo al usuario
    flash('Has cerrado sesión correctamente.')
    
    # 3. Redirigimos a la página de inicio o a la principal
    return redirect(url_for('pagina.principal'))