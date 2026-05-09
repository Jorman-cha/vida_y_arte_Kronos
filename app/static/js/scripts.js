//JS emenu lateral
const btnToggle = document.getElementById('btn-toggle');
const sidebar = document.getElementById('navegar');

btnToggle.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
});
//JS formulario de registro
const inputs = document.querySelectorAll('#grid_form input');

inputs.forEach(input => {
    input.addEventListener('input', () => {
        if (input.value.length > 3) {
            input.style.borderColor = "rgb(46,204,133)";
            input.style.boxShadow = "0 0 5px rgba(46,204,133,0.5)";
        }
        else if (input.value.length > 0) {
            input.style.borderColor = "rgb(228, 41, 41)";
            input.style.boxShadow = "0 0 8px rgba(228, 41, 41, 0.3)";
        }
        else {
            input.style.borderColor = "rgb(228, 41, 41)";
        }
    });
});

document.addEventListener('DOMContentLoaded', () => {

    const inputs = document.querySelectorAll('#grid_form input, #grid_form select');

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

    // 2. Animación de entrada en cascada para los campos
    const grupos = document.querySelectorAll('.form_group');
    grupos.forEach((grupo, index) => {
        grupo.style.opacity = "0";
        grupo.style.transform = "translateY(20px)";
        grupo.style.transition = "all 0.4s ease-out";

        setTimeout(() => {
            grupo.style.opacity = "1";
            grupo.style.transform = "translateY(0)";
        }, index * 100); // Cada campo aparece 100ms después del anterior
    });
    const form = document.querySelector('.form_cre');

    form.addEventListener('submit',(e) =>{
        e.preventDefault();//Detiene el envio para mostrar la ventana emergente

        Swal.fire({
            title: '¿Confirmar registro?',
            text: "Asegúrate de que los datos sean correctos",
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#008eb4', // El azul de tu barra lateral
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, registrar',
            cancelButtonText: 'Revisar'
        }).then((result) =>{
            if (result.isConfirmed){
                form.submit();
            }
        });
    });
});