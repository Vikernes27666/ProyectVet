    document.addEventListener("DOMContentLoaded", function() {
        const btnAgregarCita = document.getElementById('btnAgregarCita');
        const modalAgendarCita = document.getElementById('modalAgendarCita');
         const modalEditarCita = document.getElementById('modalEditarCita');
        
        // Cuando se haga clic en el botón "Agregar Cita", muestra el modal
        btnAgregarCita.addEventListener('click', function() {
            modalAgendarCita.style.display = 'block';
        });
        
        // Cierra el modal si se hace clic fuera de él
        window.onclick = function(event) {
            if (event.target === modalAgendarCita) {
                modalAgendarCita.style.display = 'none';
            }
            if (event.target === modalEditarCita) {
                modalEditarCita.style.display = 'none';
            }
        };
    });
    
    






