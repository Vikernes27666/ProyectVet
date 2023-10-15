function eliminarPerfil(id) {
    if (confirm("¿Estás seguro de que deseas eliminar este perfil?")) {
        // Realiza una solicitud AJAX para eliminar el perfil con el ID proporcionado
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'EliminarPerfilServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Actualiza la página o realiza alguna acción adicional después de eliminar el perfil
                location.reload(); // Puedes recargar la página como ejemplo
            }
        };
        xhr.send('id=' + id);
    }
}

