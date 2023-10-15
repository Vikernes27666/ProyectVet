function eliminarMascota(id) {
    if (confirm("¿Estás seguro de que deseas eliminar esta mascota?")) {
        // Realiza una solicitud AJAX para eliminar la mascota con el ID proporcionado
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'EliminarMascotaServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Actualiza la página o realiza alguna acción adicional después de eliminar la mascota
                location.reload(); // Puedes recargar la página como ejemplo
            }
        };
        xhr.send('id=' + id);
    }
}
