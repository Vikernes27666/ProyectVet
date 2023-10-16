function eliminarCita(idCita) {
    if (confirm("¿Estás seguro de que deseas eliminar esta cita con ID " + idCita + "?")) {
        $.ajax({
            type: "POST",
            url: "EliminarCitaServlet",
            data: {
                citaID: idCita
            },
            success: function(response) {
                // Puedes realizar alguna acción adicional después de eliminar la cita
                if (response === "success") {
                    // Cita eliminada con éxito, puedes recargar la página o hacer algo más.
                    location.reload();
                } else {
                    // Manejar errores o mostrar un mensaje de error
                    alert("Error al eliminar la cita.");
                }
            }
        });
    }
}



