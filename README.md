# 🎨 Kronos - Sistema de Gestión Académica

> **Fundación Vida y Arte**: Aplicación web integral para la digitalización y automatización de procesos académicos, migrando de archivos Excel a una plataforma centralizada, segura y escalable.

![Flask](https://img.shields.io/badge/flask-%23000.svg?style=for-the-badge&logo=flask&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/bootstrap-%23563D7C.svg?style=for-the-badge&logo=bootstrap&logoColor=white)
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

---

## 📋 Descripción

**Kronos** es una solución tecnológica diseñada para modernizar la administración de la **Fundación Vida y Arte**. El sistema centraliza la información de estudiantes, profesores, materias e instrumentos, garantizando la integridad de los datos mediante una arquitectura de base de datos normalizada (**3NF**).

El aplicativo ofrece interfaces personalizadas según el rol del usuario (RBAC), permitiendo un control total del flujo académico (CRUD) para administradores, mientras que docentes y alumnos acceden a sus horarios en tiempo real.

---

## ✨ Funcionalidades Principales

* 🔐 **Sistema de Roles (RBAC)**: Paneles diferenciados para Administrador, Profesor y Estudiante.
* 📅 **Motor de Horarios**: Gestión y asignación de clases vinculadas a salones y docentes para evitar cruces.
* 🎼 **Segmentación por Programas**: Control independiente para **Líderes** (Teórico) e **Instrumentos** (Práctico).
* 👤 **Gestión de Usuarios (CRUD)**: Interfaz administrativa para crear, buscar, editar y eliminar perfiles.
* 🌐 **Portal Informativo**: Landing page dinámica con carrusel de novedades y eventos.
* 📱 **Diseño Responsivo**: Interfaz adaptativa con **Bootstrap 5** y sidebar colapsable.

---

## 🛠️ Stack Tecnológico

| Capa | Tecnología | Propósito |
| :--- | :--- | :--- |
| **Frontend** | HTML5, CSS3, JavaScript | UI dinámica y lógica del lado del cliente. |
| **Backend** | **Flask** (Python) | Lógica de servidor, ruteo y Blueprints. |
| **Plantillas** | Jinja2 | Renderizado dinámico y herencia de componentes. |
| **Estilos** | Bootstrap 5 | Maquetación visual responsiva. |
| **Base de Datos** | **MySQL** | Almacenamiento relacional (Normalización 3NF). |

---

## 📁 Estructura del Proyecto

```text
kronos/
├── run.py                  # Punto de entrada de la aplicación
├── config.py               # Configuración de DB (Puerto: 3307)
├── rundb.py                # Script de verificación de conexión
├── app/
│   ├── static/             # CSS, JS, Imágenes
│   │   ├── css/styles.css  
│   │   └── js/scripts.js   
│   └── templates/          # Vistas (Jinja2)
│       ├── layout.html     # Plantilla base
│       ├── perfil.html     # Dashboard con menú lateral
│       ├── bus.html        # Gestión de usuarios (CRUD)
│       └── plantillas/     # Componentes reutilizables (menu, pie)
