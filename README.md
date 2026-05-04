# 🎨 Sistema de Gestión Académica - Fundación Vida y Arte

![Status](https://img.shields.io/badge/Status-En%20Desarrollo-green)
![Version](https://img.shields.io/badge/Version-1.0.0-blue)

## 📌 Sobre el Proyecto
Este aplicativo nace de la necesidad de migrar la gestión académica de la **Fundación Vida y Arte**, que anteriormente dependía de archivos de Excel, hacia una plataforma web centralizada. El sistema permite gestionar horarios, docentes y alumnos de forma eficiente, garantizando la integridad de la información mediante una base de datos normalizada (3NF).

## 🚀 Funcionalidades Principales

### 🌐 Portal Informativo
* Página de aterrizaje con información pública sobre la misión, visión y programas de la Fundación.

### 🔐 Sistema de Autenticación por Roles
El acceso a las funcionalidades internas depende del perfil del usuario:

*   **Panel de Administrador (C.R.U.D. Total):** 
    * Gestión completa de la base de datos.
    * Creación y edición de Usuarios (Admin, Profesores, Estudiantes).
    * Configuración de Programas (Líderes e Instrumentos).
    * Asignación de Clases y organización de Horarios/Salones.
*   **Panel de Profesor:**
    * Visualización de agenda personalizada.
    * Consulta de materias e instrumentos asignados.
*   **Panel de Estudiante:**
    * Visualización de horario de clases.
    * Consulta de información personal e instrumentos/materias inscritas.

## 🛠️ Arquitectura de Datos
El sistema utiliza una base de datos relacional diseñada bajo la **Tercera Forma Normal (3NF)** para evitar redundancias.

**Entidades principales:**
* `Persona` / `Usuario`: Gestión de identidad y acceso.
* `Programa`: Diferenciación entre programas teóricos (Líderes) y prácticos (Instrumentos).
* `Clase` / `Horario`: El núcleo del sistema de agendamiento.

## 🏗️ Tecnologías Sugeridas
* **Frontend:** [Ej: React / Vue / Angular]
* **Backend:** [Ej: Node.js / Python / PHP]
* **Base de Datos:** PostgreSQL o MySQL.

## 📝 Instalación (Próximamente)
```bash
git clone [https://github.com/tu-usuario/fundacion-vida-arte.git](https://github.com/tu-usuario/fundacion-vida-arte.git)
cd fundacion-vida-arte
npm install
