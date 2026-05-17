document.addEventListener('DOMContentLoaded', () => {

    // ==========================================
    // 1. MENÚ LATERAL (Protegido por si no existe)
    // ==========================================
    const btnToggle = document.getElementById('btn-toggle');
    const sidebar = document.getElementById('navegar');

    if (btnToggle && sidebar) {
        btnToggle.addEventListener('click', () => {
            sidebar.classList.toggle('collapsed');
        });
    }

    // ==========================================
    // 2. VALIDACIÓN DINÁMICA DE INPUTS Y SELECTS
    // ==========================================
    const inputs = document.querySelectorAll('#grid_form input, #grid_form select');

    if (inputs.length > 0) {
        inputs.forEach(input => {
            input.addEventListener('input', () => {
                if (input.value.length > 3) {
                    input.style.borderColor = "rgb(46, 204, 133)";
                    input.style.boxShadow = "0 0 8px rgba(46, 204, 133, 0.3)";
                }
                else if (input.value.length > 0) {
                    input.style.borderColor = "rgb(228, 41, 41)";
                    input.style.boxShadow = "0 0 8px rgba(228, 41, 41, 0.3)";
                }
                else {
                    input.style.borderColor = "rgb(138, 138, 138)";
                    input.style.boxShadow = "none";
                }
            });
        });
    }

    // ==========================================
    // 3. ANIMACIÓN EN CASCADA DE LOS CAMPOS
    // ==========================================
    const grupos = document.querySelectorAll('.form_group');
    if (grupos.length > 0) {
        grupos.forEach((grupo, index) => {
            grupo.style.opacity = "0";
            grupo.style.transform = "translateY(20px)";
            grupo.style.transition = "all 0.4s ease-out";

            setTimeout(() => {
                grupo.style.opacity = "1";
                grupo.style.transform = "translateY(0)";
            }, index * 100);
        });
    }

    // ==========================================
    // 4. ENVÍO SEGURO CON SWEETALERT2 (.form_cre)
    // ==========================================
    // Quitamos la dependencia de ".mi_clase_especifica" y escuchamos directamente al formulario
   const formularioCrear = document.querySelector('.form_cre');

    if (formularioCrear) {
        // Cambiamos $(formularioCrear).on por el addEventListener nativo
        formularioCrear.addEventListener('submit', function(e) {
            // 1. Detenemos el envío automático para que actúe SweetAlert2
            e.preventDefault(); 
            
            // 2. Extraemos el formulario nativo puro
            var formularioNativo = e.target; 

            // 3. Lanzamos la alerta de SweetAlert2
            Swal.fire({
                title: '¿Estás seguro?',
                text: "Se guardarán los cambios en el usuario",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, actualizar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                // 4. Si el administrador confirma la acción
                if (result.isConfirmed) {
                    // Forzamos el envío usando el prototipo limpio del navegador
                    HTMLFormElement.prototype.submit.call(formularioNativo);
                }
            });
        });
    }
});