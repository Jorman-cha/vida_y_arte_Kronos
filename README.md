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

El sistema centraliza la información de estudiantes, profesores, materias e instrumentos, garantizando la integridad de los datos mediante una arquitectura de base de datos normalizada (**3NF**). El aplicativo ofrece interfaces personalizadas según el rol del usuario (RBAC), permitiendo un control total del flujo académico (CRUD) para administradores, mientras que docentes y alumnos acceden a sus horarios en tiempo real.

---

## ✨ Funcionalidades Principales

* 🔐 **Sistema de Roles (RBAC):** Paneles diferenciados para Administrador, Profesor y Estudiante.
* 📅 **Motor de Horarios:** Gestión y asignación de clases vinculadas a salones y docentes para evitar cruces.
* 🎼 **Segmentación por Programas:** Control independiente para **Líderes** (Teórico) e **Instrumentos** (Práctico).
* 👤 **Gestión de Usuarios (CRUD):** Interfaz administrativa para crear, buscar, editar y eliminar perfiles.
* 🌐 **Portal Informativo:** Landing page dinámica con carrusel de novedades y eventos.
* 📱 **Diseño Responsivo:** Interfaz adaptativa con **Bootstrap 5** y sidebar colapsable.

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
├── run.py                   # Punto de entrada de la aplicación
├── config.py                # Configuración de DB (Puerto: 3307)
├── rundb.py                 # Script de verificación de conexión
├── app/
│   ├── static/
│   │   ├── css/
│   │   │   └── styles.css   # Estilos globales y formularios
│   │   ├── js/
│   │   │   └── scripts.js
│   │   └── images/          # Recursos gráficos (carrusel, tarjetas)
│   └── templates/
│       ├── layout.html      # Plantilla base
│       ├── perfil.html      # Dashboard con menú lateral
│       ├── bus.html         # Gestión de usuarios (CRUD)
│       └── plantillas/      # Componentes reutilizables (menu, pie)
└── README.md
```

---

## ⚙️ Instalación y Ejecución Local

### Requisitos previos
- Python 3.x
- XAMPP con MySQL activo (puerto **3307**)
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
pip install flask mysql-connector-python

# 4. Configurar la base de datos
# · Iniciar XAMPP y activar MySQL
# · Crear la base de datos desde phpMyAdmin
# · Importar el archivo SQL del directorio /db/

# 5. Verificar conexión
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
| Yudy Jasmin Tovar Fuentes | Desarrolladora |

**Tutor:** José Miguel Santana Cárdenas  
**Asignatura:** Programación Web · NRC 85406  
**Institución:** UNIMINUTO – Corporación Universitaria Minuto de Dios  
**Entrega Fase 1:** 31 de mayo, 2026

---

## 📄 Licencia

Proyecto desarrollado con fines académicos para UNIMINUTO. Su uso o distribución fuera del contexto educativo debe ser acordado con el equipo de desarrollo.
