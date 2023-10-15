function editarCita(idCita) {
    // Obtén una referencia al modal de edición y a los campos del formulario
    var modal = document.getElementById("modalEditarCita");
    var editarCitaId = document.getElementById("editarCitaId");
    var editarRazonCita = document.getElementById("editarRazonCita");
    var editarFechaCita = document.getElementById("editarFechaCita");
    var editarDniCliente = document.getElementById("editarDniCliente");
    var editarIdMascota = document.getElementById("editarIdMascota");
    var editarEstado = document.getElementById("editarEstado");

    // Aquí debes implementar la lógica para cargar los datos de la cita con el ID proporcionado (idCita).
    // Puedes utilizar AJAX para obtener los detalles de la cita del servidor.
    
    // Ejemplo de cómo llenar los campos en el modal con datos ficticios:
    editarCitaId.value = idCita;
    editarRazonCita.value = "Razón de la cita";
    editarFechaCita.value = "2023-10-15";
    editarDniCliente.value = "12345678";  // DNI del cliente
    editarIdMascota.value = "1";          // ID de la mascota
    editarEstado.value = "Pendiente";     // Estado

    // Abre el modal de edición
    modal.style.display = "block";
}



