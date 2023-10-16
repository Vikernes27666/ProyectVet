function editarCliente(DNI, nombre) {
    // Llenar los campos del formulario en el modal
    document.getElementById('editarClienteDNI').value = DNI;
    document.getElementById('editarClienteNombre').value = nombre;
    
    // Mostrar el modal
    document.getElementById('modalEditarCliente').style.display = 'block';
}

