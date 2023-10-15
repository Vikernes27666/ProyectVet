function eliminarCliente(DNI) {
    if (confirm("¿Estás seguro de que deseas eliminar este cliente?")) {
        // Realiza una solicitud AJAX para eliminar el cliente con el DNI proporcionado
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'EliminarClienteServlet', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // Actualiza la página o realiza alguna acción adicional después de eliminar el cliente
                location.reload(); // Puedes recargar la página como ejemplo
            }
        };
        xhr.send('DNI=' + DNI);
    }
}


