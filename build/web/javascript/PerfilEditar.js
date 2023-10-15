function editarPerfil(idPerfil) {
    $.ajax({
        type: "GET",
        url: "EditarPerfilServlet",
        data: {
            idPerfil: idPerfil
        },
        dataType: "json",
        success: function(perfil) {
            $('#nombre').val(perfil.nombre);
            $('#telefono').val(perfil.telefono);
            $('#usuario').val(perfil.usuario);
            $('#contrasena').val(perfil.contrasena);
            $('#cargo').val(perfil.cargo);

            // Muestra el modal
            $('#modalEditarPerfil').modal('show');
        }
    });
}

