# 🎨 Kronos – Sistema de Gestión Académica
> **Fundación Vida y Arte** · Aplicación web integral para la digitalización y automatización de procesos académicos, migrando de archivos Excel a una plataforma centralizada, segura y escalable.

![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

---

## 📋 Descripción

**Kronos** es una solución tecnológica diseñada para modernizar la administración de la **Fundación Vida y Arte** (Barrios Unidos, Bogotá), institución que ofrece cursos de música organizados en dos programas:

- 🎓 **Líderes** – Formación teórica e integral del estudiante (10 semestres, 65 materias).
- 🎸 **Instrumentos** – Práctica de violín, técnica vocal, guitarra y más.

El sistema centraliza la información de estudiantes, profesores, materias e instrumentos, garantizando la integridad de los datos mediante una arquitectura de base de datos normalizada (**3NF**). El aplicativo ofrece interfaces personalizadas según el rol del usuario (RBAC), permitiendo un control total del flujo académico para administradores, mientras que docentes y alumnos acceden a sus horarios en tiempo real.

---

## ✨ Funcionalidades Principales

* 🔐 **Autenticación segura:** Login con verificación de credenciales y hash de contraseñas (`werkzeug`).
* 👥 **Sistema de Roles (RBAC):** Paneles diferenciados para Administrador, Profesor y Estudiante.
* 📅 **Motor de Horarios:** Gestión de horarios vinculados a usuarios, instrumentos y salones.
* 🎼 **Segmentación por Programas:** Control independiente para **Líderes** (Teórico) e **Instrumentos** (Práctico).
* 👤 **Gestión de Usuarios (CRUD):** Registro completo con rol, tipo de documento, localidad y credenciales.
* 🌐 **Portal Informativo:** Landing page con carrusel de imágenes y tarjetas de próximos eventos.
* 📱 **Sidebar Colapsable:** Menú lateral con animación suave y transición CSS.
* 🔔 **Confirmaciones con SweetAlert2:** Ventanas emergentes antes de registrar o eliminar datos.
* 🚪 **Cierre de sesión:** Limpieza completa de sesión con redirección a la página principal.

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Propósito |
| :--- | :--- | :--- |
| **Frontend** | HTML5, CSS3, JavaScript | UI dinámica y lógica del lado del cliente |
| **Backend** | **Flask** (Python) | Lógica de servidor, ruteo y Blueprints |
| **Plantillas** | Jinja2 | Renderizado dinámico y herencia de componentes |
| **Estilos** | Bootstrap 5 + CSS personalizado | Maquetación visual responsiva |
| **Alertas** | SweetAlert2 | Confirmaciones y notificaciones interactivas |
| **Base de Datos** | **MySQL** (`gestion_horarios`) | Almacenamiento relacional (Normalización 3NF) |
| **Seguridad** | Werkzeug (`generate_password_hash`) | Hash seguro de contraseñas |

---

## 📁 Estructura del Proyecto

```text
VIDA_Y_ARTE_KRONOS-MASTER/
│
├── run.py                        # Punto de entrada — registra blueprints y lanza la app
├── rundb.py                      # Script de verificación de conexión a la BD
├── requirements.txt              # Dependencias del proyecto
├── .gitignore                    # Archivos excluidos del repositorio
│
└── app/
    ├── config.py                 # Configuración de la BD (host, puerto, credenciales)
    │
    ├── blueprints/
    │   ├── auth/
    │   │   └── routes.py         # Blueprint auth_bp — rutas de login
    │   └── pagina/
    │       └── pagina.py         # Blueprint pagina_bp — rutas principales
    │
    ├── models/
    │   ├── administrador.py      # Modelo CRUD de usuarios (obtener, crear)
    │   ├── login.py              # Modelo de autenticación con hash werkzeug
    │   └── profesor.py           # Modelo del perfil profesor
    │
    ├── utils/
    │   ├── db.py                 # Singleton ConexionBaseDatos (mysql-connector)
    │   ├── config.py             # Configuración interna de utils
    │   └── __init__.py
    │
    ├── static/
    │   ├── css/
    │   │   └── styles.css        # Estilos globales, sidebar, formularios, tablas
    │   ├── js/
    │   │   └── scripts.js        # Sidebar toggle + validación de formularios + SweetAlert2
    │   └── img/                  # Imágenes (carrusel, logo, foto de perfil)
    │
    └── templates/
        ├── layout.html           # Plantilla base (Bootstrap 5, CSS, JS, SweetAlert2)
        └── pagina/
            ├── principal.html    # Landing page con carrusel y tarjetas de eventos
            ├── perfil.html       # Dashboard del usuario autenticado con sidebar
            ├── bus_usu.html      # Tabla de búsqueda y gestión de usuarios
            ├── cre_usu.html      # Formulario de creación de usuarios
            ├── IniSesion.html    # Formulario de inicio de sesión
            ├── novedades.html    # Página de novedades
            ├── info.html         # Información de la fundación
            └── plantillas/
                ├── menu.html     # Barra de navegación superior
                ├── aside.html    # Sidebar colapsable
                └── pie.html      # Pie de página
```

---

## 🗄️ Base de Datos

**Nombre:** `gestion_horarios` · **Motor:** MariaDB / MySQL · **Puerto:** 3306

| Tabla | Descripción |
| :--- | :--- |
| `usuarios` | Credenciales de acceso + estado (activo/inactivo/suspendido) |
| `persona` | Datos personales vinculados a cada usuario |
| `rol` | Roles del sistema: Administrador, Estudiante, Profesor |
| `p_rol` | Relación persona–rol (tabla pivote) |
| `estado` | Estados posibles de un usuario |
| `programa` | Programas académicos: Líderes e Instrumentos |
| `materia` | 65 materias distribuidas en 10 semestres (programa Líderes) |
| `semestre` | Semestres I al X |
| `faceta` | Facetas académicas: Artística, Humana, Pedagógica |
| `instrumento` | Instrumentos del programa Instrumentos |
| `horario` | Horarios vinculados a usuario, instrumento y salón |
| `salon` | Salones disponibles |
| `nivel` | Niveles: Básico, Intermedio, Avanzado |
| `localidad` | 20 localidades de Bogotá |
| `tipo_documento` | Tipos de documento (CC, TI, CE, etc.) |
| `profesor_instru` | Relación profesor–instrumento |
| `usuario_progr` | Relación usuario–programa |

---

## 🗺️ Rutas del Sistema

| Ruta | Blueprint | Descripción |
| :--- | :--- | :--- |
| `/` | `pagina_bp` | Landing page principal |
| `/inicio` | `auth_bp` | Login (GET) y autenticación (POST) |
| `/perfil` | `pagina_bp` | Dashboard del usuario autenticado |
| `/Buscar_Usuario` | `pagina_bp` | Listado y gestión de usuarios |
| `/Crear_Usuario` | `pagina_bp` | Formulario de registro |
| `/guardar` | `pagina_bp` | Procesamiento del formulario (POST) |
| `/informacion` | `pagina_bp` | Información de la fundación |
| `/novedades` | `pagina_bp` | Novedades y anuncios |
| `/salir` | `pagina_bp` | Cierre de sesión |

---

## ⚙️ Instalación y Ejecución Local

### Requisitos previos
- Python 3.x
- XAMPP con MySQL activo (puerto **3306**)
- pip

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/tu-usuario/VIDA_Y_ARTE_KRONOS.git
cd VIDA_Y_ARTE_KRONOS

# 2. Crear y activar entorno virtual
python -m venv venv

# Windows
venv\Scripts\activate
# Mac / Linux
source venv/bin/activate

# 3. Instalar dependencias
pip install -r requirements.txt

# 4. Configurar la base de datos
# · Iniciar XAMPP y activar el servicio MySQL
# · Crear la base de datos: gestion_horarios
# · Importar el archivo SQL del directorio /database/

# 5. Verificar conexión a la BD
python rundb.py

# 6. Ejecutar la aplicación
python run.py
```

Abre tu navegador en: `http://127.0.0.1:5000`

---

## 📊 Fases del Proyecto

| Fase | Actividades | Estado |
| :--- | :--- | :---: |
| **Fase 1** | Planteamiento, requerimientos, objetivos, marco teórico y maquetación | ✅ |
| **Fase 2** | Diagramas, base de datos y primer prototipo de interfaz (Bootstrap) | 🔄 |
| **Fase 3** | Pruebas, corrección de errores e implementación en la fundación | ⏳ |

---

## 🌍 Impacto Esperado

| Dimensión | Descripción |
| :--- | :--- |
| 🌱 **Ambiental** | Menor tiempo de uso de dispositivos y reducción del consumo energético |
| 💰 **Económico** | Elimina la dependencia de licencias de Microsoft Office 365 |
| 🤝 **Social** | Evita conflictos de horarios entre profesores y estudiantes |
| 💻 **Tecnológico** | Moderniza la gestión de clases con una plataforma intuitiva y escalable |

---

## 👥 Equipo de Desarrollo

| Nombre | Rol |
| :--- | :--- |
| Brandon Rodriguez Garcia | Desarrollador |
| Jorman Nicolay Chaves Orjuela | Desarrollador |
| Janny Andreina Rodriguez Requena | Desarrolladora |
| Yudy Jasmin Tovar Fuentes | "ayudante" , "barre" |

**Tutor:** José Miguel Santana Cárdenas  
**Asignatura:** Programación Web · NRC 85406  
**Institución:** UNIMINUTO – Corporación Universitaria Minuto de Dios  
**Entrega Fase 1:** 31 de mayo, 2026

---

## 📄 Licencia

Proyecto desarrollado con fines académicos para UNIMINUTO. Su uso o distribución fuera del contexto educativo debe ser acordado con el equipo de desarrollo.
