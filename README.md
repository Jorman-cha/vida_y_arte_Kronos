# 🎨 Kronos - Sistema de Gestión Académica | Fundación Vida y Arte

![Flask](https://img.shields.io/badge/Framework-Flask-black?style=flat-square&logo=flask)
![Bootstrap](https://img.shields.io/badge/Frontend-Bootstrap_5-purple?style=flat-square&logo=bootstrap)
![MySQL](https://img.shields.io/badge/DB-MySQL-blue?style=flat-square&logo=mysql)

## 📌 Descripción del Proyecto
Este aplicativo web surge de la necesidad de modernizar la administración de la **Fundación Vida y Arte**, migrando la gestión de datos de archivos Excel a una plataforma centralizada y robusta. 

**Kronos** permite la organización en tiempo real de estudiantes, profesores y recursos académicos, eliminando la duplicidad de información y garantizando la integridad de los datos mediante una arquitectura de base de datos normalizada (3NF).

## 🚀 Funcionalidades Principales

### 🔐 Control de Acceso por Roles (RBAC)
El sistema personaliza la experiencia según el perfil del usuario:
*   **Administrador:** Posee control total (CRUD) sobre usuarios, programas y horarios. Es el encargado de "armar el rompecabezas" académico sin cruces de horarios.
*   **Profesor:** Visualiza su agenda personalizada, las materias teóricas dictadas y los instrumentos a su cargo.
*   **Estudiante:** Acceso a su horario de clases y consulta de los instrumentos o materias en los que está inscrito.

### 🎼 Gestión Especializada de Programas
El sistema diferencia automáticamente la lógica de enseñanza:
*   **Programa de Líderes:** Gestión orientada a materias teóricas.
*   **Programa de Instrumentos:** Gestión orientada a la práctica instrumental.

## 🛠️ Stack Tecnológico
*   **Backend:** Python con **Flask** (Uso de Blueprints para modularidad).
*   **Frontend:** HTML5, CSS3 (Custom) y **Bootstrap 5** para diseño responsivo.
*   **Base de Datos:** MySQL (Configurada por defecto en el puerto **3307**).
*   **Lógica de Interfaz:** JavaScript para menús laterales colapsables y dinamismo.

## 📁 Estructura del Repositorio
*   `/app`: Carpeta principal de la aplicación.
    *   `/static`: Archivos CSS, JS e imágenes (Logo, fondos, perfiles).
    *   `/templates`: Plantillas HTML con sistema de herencia (`layout.html`).
*   `run.py`: Script principal de ejecución del servidor Flask.
*   `config.py`: Parámetros de conexión a la DB `gestion_horarios`.
*   `rundb.py`: Utilidad para verificar el estado de la conexión a la base de datos.

## ⚙️ Instalación y Ejecución

1. **Clonar el repositorio:**
   ```bash
   git clone [https://github.com/tu-usuario/fundacion-vida-arte.git](https://github.com/tu-usuario/fundacion-vida-arte.git)
   cd fundacion-vida-arte
