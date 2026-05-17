from flask import render_template,request,redirect,url_for,flash,session,Blueprint
from app.models.login import login

auth_bp = Blueprint("auth",__name__)

@auth_bp.route('/inicio', methods=['GET','POST'])
def registro():
    if request.method == 'POST':
        email = request.form.get('email','').strip()
        password = request.form.get('password','')

        user = login.credenciales(email,password)

        if user is not None:
            session['user_id'] = user.id
            session['user_name'] = user.nombre
            return redirect(url_for('pagina.perfil'))
    
        flash('Email o contraseña incorrectos')
        return redirect(url_for('auth.registro'))

    return render_template("pagina/IniSesion.html")

