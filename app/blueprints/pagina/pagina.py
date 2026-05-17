from flask import Blueprint,render_template,request,redirect,url_for,flash,session,make_response
from functools import wraps
from app.utils.db import ConexionBaseDatos
from app.models.administrador import Administrador
from werkzeug.security import generate_password_hash

pagina_bp = Blueprint('pagina', __name__)
def login_requerido(f):
    @wraps(f)
    def decorada(*args, **kwargs):
        # Verificamos si la variable vital de tu sesión (ej. 'id_usu') NO existe
        if 'id_usu' not in session:
            flash('Acceso denegado. Por favor, inicia sesión para ingresar al sistema.')
            return redirect(url_for('auth.registro')) # Redirige al login si no está logueado
        return f(*args, **kwargs)
    return decorada
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
@login_requerido
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
@login_requerido
def bus_usu():
    list_usu = Administrador.obtener_todos()
    return render_template("pagina/bus_usu.html",usuarios=list_usu)

@pagina_bp.route('/Crear_Usuario')
@login_requerido
def cre_usu():
    return render_template("pagina/cre_usu.html")
@pagina_bp.route('/guardar', methods=['POST'])
@login_requerido
def guardar():

    password_pla = request.form.get('contrasena')
    password_h = generate_password_hash(password_pla)

    form_data = {
        'rol':request.form.get('cb_rol'),
        'tip_doc':request.form.get('sl_tipo_doc'),
        'nom_usu':request.form.get('nom_usu'),
        'email':request.form.get('correo_usu'),
        'password_h': password_h,
        'local':request.form.get('sl_local'),
        'p_nom':request.form.get('pri_nom'),
        'p_ape':request.form.get('pri_ape'),
        'n_tel':request.form.get('tel'),
        'direc':request.form.get('direc'),
        'n_doc':request.form.get('num_doc')
    }
    
    Logrado= Administrador.crear_sistema_completo(form_data)
    if Logrado:
        flash ('Registro exitoso')
        return redirect(url_for('pagina.bus_usu'))
    else:
        return "Error al insertar en la base de datos. Revisa la consola de VS Code."
    
@pagina_bp.route('/editar/<int:id_usu>', methods=['GET'])
@login_requerido
def editar_usu(id_usu):
    # Buscamos al usuario con todos sus datos relacionados (tablas cruzadas)
    usuario_form = Administrador.obtener_por_id(id_usu)
    
    if not usuario_form:
        flash('El usuario solicitado no existe en el sistema.')
        return redirect(url_for('pagina.bus_usu'))   
        
    return render_template("pagina/edit_usu.html", usuario=usuario_form)


@pagina_bp.route('/actualizar_usuario/<int:id_usu>', methods=['POST'])
@login_requerido
def actualizar_usuario(id_usu):
    password_input = request.form.get('contrasena')
    password_h = generate_password_hash(password_input) if password_input else None

    datos_registro = {
        'id_usu': id_usu,
        'nom_usu': request.form.get('nom_usu'),
        'email': request.form.get('correo_usu'),
        'password_h': password_h,
        'tip_doc': request.form.get('sl_tipo_doc'),
        'local': request.form.get('id_local'),
        'p_nom': request.form.get('primer_nombre'),
        'p_ape': request.form.get('primer_apelli'),
        'n_tel': request.form.get('telefono'),
        'direc': request.form.get('direccion'),
        'n_doc': request.form.get('num_doc'),
        'rol': request.form.get('cb_rol')
    }
    
    print("DATOS ENVIADOS AL MODELO:", datos_registro)
    
    if Administrador.actualizar_completo(datos_registro):
        flash('¡Usuario modificado con éxito!')
    else:
        flash('Error al actualizar la información.')
        
    return redirect(url_for('pagina.bus_usu'))

@pagina_bp.route('/eliminar_usuario/<int:id_usu>', methods=['POST'])
@login_requerido
def eliminar_usu(id_usu):
    # Llama al método que ahora hace el UPDATE de estado
    if Administrador.eliminar_completo(id_usu):
        flash('El usuario ha sido deshabilitado del sistema correctamente.')
    else:
        flash('Error: No se pudo cambiar el estado del usuario.')
        
    return redirect(url_for('pagina.bus_usu'))

@pagina_bp.route('/salir')
@login_requerido
def salir():
    # 1. Eliminamos todos los datos guardados en la sesión (user_id, user_name, etc.)
    session.clear()
    respuesta = make_response(redirect(url_for('pagina.principal')))
    
    # 3. Forzamos al navegador a borrar la caché para que no pueda "recordar" el panel
    respuesta.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate, private'
    respuesta.headers['Pragma'] = 'no-cache'
    respuesta.headers['Expires'] = '0'
    
    flash('Sesión cerrada correctamente.')
    return respuesta