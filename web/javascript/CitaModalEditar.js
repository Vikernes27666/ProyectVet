function editarCita(idCita) {
    // Obtén una referencia al modal de edición y a los campos del formulario
    var modal = document.getElementById("modalEditarCita");
    var editarCitaId = document.getElementById("editarCitaId");
    var editarRazonCita = document.getElementById("editarRazonCita");
    var editarFechaCita = document.getElementById("editarFechaCita");
    var editarDniCliente = document.getElementById("editarDniCliente");
    var editarIdMascota = document.getElementById("editarIdMascota");
    var editarEstado = document.getElementById("editarEstado");

    // Utiliza fetch (u otra biblioteca AJAX) para obtener los detalles de la cita del servidor.
    // Definir los datos que se enviarán en la solicitud POST (en este ejemplo, un objeto JSON).

    // Realiza la solicitud POST al servidor.
    fetch('ObtenerCitaServlet?idCita='+idCita)
            .then(response => response.json())
            .then(data => {
                editarCitaId.value = data.id;
                editarRazonCita.value = data.razonCita;
                editarFechaCita.value = data.fechaCita;
                editarDniCliente.value = data.dniCliente;
                editarIdMascota.value = data.idMascota;
                editarEstado.value = data.estado;
                // Abre el modal de edición.
                modal.style.display = "block";
            })
            .catch(error => console.error('Error:', error));

}

