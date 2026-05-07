# 🎨 Kronos – Sistema de Gestión Académica
> **Fundación Vida y Arte** · Aplicación web integral para la digitalización y automatización de procesos académicos, migrando de archivos Excel a una plataforma centralizada, segura y escalable.

![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

---

## 📋 Descripción

**Kronos** es una solución tecnológica diseñada para modernizar la administración de la **Fundación Vida y Arte** (Barrios Unidos, Bogotá), institución que ofrece cursos de música organizados en dos programas:

- 🎓 **Líderes** – Formación teórica e integral del estudiante.
- 🎸 **Instrumentos** – Práctica de violín, guitarra, piano, saxofón, batería y más.

El sistema centraliza la información de estudiantes, profesores, materias e instrumentos, garantizando la integridad de los datos mediante una arquitectura de base de datos normalizada (**3NF**). El aplicativo ofrece interfaces personalizadas según el rol del usuario (RBAC), permitiendo un control total del flujo académico para administradores, mientras que docentes y alumnos acceden a sus horarios en tiempo real.

---

## ✨ Funcionalidades Principales

* 🔐 **Sistema de Roles (RBAC):** Paneles diferenciados para Administrador, Profesor y Estudiante.
* 📅 **Motor de Horarios:** Gestión y asignación de clases vinculadas a salones y docentes para evitar cruces.
* 🎼 **Segmentación por Programas:** Control independiente para **Líderes** (Teórico) e **Instrumentos** (Práctico).
* 👤 **Gestión de Usuarios (CRUD):** Registro, búsqueda, edición y eliminación de perfiles desde panel administrativo.
* 🗂️ **Formulario de Registro Completo:** Captura de rol, tipo de documento, localidad, datos de contacto y credenciales.
* 🌐 **Portal Informativo:** Landing page con carrusel de imágenes y tarjetas de próximos eventos.
* 📱 **Sidebar Colapsable:** Menú lateral con animación suave para una navegación más cómoda.

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Propósito |
| :--- | :--- | :--- |
| **Frontend** | HTML5, CSS3, JavaScript | UI dinámica y lógica del lado del cliente |
| **Backend** | **Flask** (Python) | Lógica de servidor, ruteo y Blueprints |
| **Plantillas** | Jinja2 | Renderizado dinámico y herencia de componentes |
| **Estilos** | Bootstrap 5 | Maquetación visual responsiva |
| **Base de Datos** | **MySQL** | Almacenamiento relacional (Normalización 3NF) |

---

## 📁 Estructura del Proyecto

```text
kronos/
│
├── run.py                        # Punto de entrada — crea y lanza la app Flask
├── rundb.py                      # Script de verificación de conexión a la BD
├── requirements.txt              # Dependencias del proyecto
├── iniciar_kronos.bat            # Script de arranque rápido (Windows)
│
├── database/                     # Scripts SQL de la base de datos
├── docs/                         # Documentación del proyecto
│
└── app/
    ├── config.py                 # Configuración de la BD (puerto, credenciales)
    │
    ├── blueprints/               # Módulos de rutas organizados por Blueprint
    ├── controllers/              # Lógica de control por entidad
    ├── data_structures/          # Estructuras de datos personalizadas
    ├── models/                   # Modelos que representan las tablas de la BD
    ├── repositories/             # Acceso y consultas a la base de datos
    ├── services/                 # Lógica de negocio
    ├── utils/                    # Utilidades generales (ej: ConexionBaseDatos)
    │
    ├── static/
    │   ├── css/
    │   │   └── styles.css        # Estilos globales, sidebar, formularios, tablas
    │   ├── js/
    │   │   └── scripts.js        # Toggle del sidebar colapsable
    │   └── img/                  # Imágenes (carrusel, íconos, foto de perfil, logo)
    │
    └── templates/
        ├── layout.html           # Plantilla base (Bootstrap, CSS, JS)
        ├── aplicacion/           # Vistas del sistema interno
        ├── auth/                 # Vistas de autenticación
        ├── includes/             # Fragmentos reutilizables globales
        └── pagina/
            ├── principal.html    # Landing page con carrusel y tarjetas de eventos
            ├── perfil.html       # Dashboard del usuario con sidebar y foto de perfil
            ├── bus_usu.html      # Tabla de búsqueda y gestión de usuarios
            ├── cre_usu.html      # Formulario de creación de usuarios
            ├── IniSesion.html    # Formulario de inicio de sesión
            ├── novedades.html    # Página de novedades
            ├── info.html         # Página de información de la fundación
            └── plantillas/       # Componentes reutilizables (menu, pie, aside)
```

---

## ⚙️ Instalación y Ejecución Local

### Requisitos previos
- Python 3.x
- XAMPP con MySQL activo
- pip

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/tu-usuario/kronos.git
cd kronos

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
# · Crear la base de datos desde phpMyAdmin
# · Importar el archivo SQL del directorio /database/

# 5. Verificar conexión a la BD
python rundb.py

# 6. Ejecutar la aplicación
python run.py
```

> En Windows también puedes usar el acceso directo **`iniciar_kronos.bat`** para arrancar el proyecto directamente.

Abre tu navegador en: `http://127.0.0.1:5000`

---

## 🗺️ Vistas del Sistema

| Ruta | Vista | Descripción |
| :--- | :--- | :--- |
| `/` | `principal.html` | Landing page con carrusel y eventos |
| `/perfil` | `perfil.html` | Dashboard del usuario autenticado |
| `/buscar` | `bus_usu.html` | Listado y gestión de usuarios |
| `/crear` | `cre_usu.html` | Registro de nuevos usuarios |
| `/login` | `IniSesion.html` | Inicio de sesión |
| `/info` | `info.html` | Información de la fundación |
| `/novedades` | `novedades.html` | Novedades y anuncios |

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
