<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="basededatos.Conexion" %>
<%@ page import="java.sql.*" %>
<% 
   // Crear una instancia de la clase Conexion
   Conexion c = new Conexion();
   Connection conexion = c.con; // Obtener la conexión a la base de datos desde la instancia de Conexion
   
try {
    // Obtener los parámetros del formulario
    String usuario = request.getParameter("usuario");
    String contrasena = request.getParameter("contrasena");

    // Consulta SQL para verificar las credenciales del usuario
    String consulta = "SELECT ID, nombre, telefono, usuario, cargo FROM usuarios WHERE usuario=? AND contrasena=?";
    
    // Crear una declaración (PreparedStatement) para ejecutar la consulta
    PreparedStatement statement = conexion.prepareStatement(consulta);
    
    // Establecer los valores de los parámetros
    statement.setString(1, usuario);
    statement.setString(2, contrasena);
    
    // Ejecutar la consulta y obtener el conjunto de resultados (ResultSet)
    ResultSet resultado = statement.executeQuery();

    if (resultado.next()) {
        // Si las credenciales son correctas, redirige a la página deseada
        response.sendRedirect("Citas.jsp"); // Cambia "Citas.jsp" a la página a la que deseas redirigir
    } else {
        // Si las credenciales son incorrectas, muestra un mensaje de error
        //out.println("<p style='color:red;'>Credenciales incorrectas. Por favor, inténtalo de nuevo.</p>");
    }

    // Cierra la conexión a la base de datos
    conexion.close();
} catch (SQLException e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="estilosCSS/Login.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
    <div class="container">
        <div class="login-form">
            <div class="logo">
                <img src="Img/Logaso.png" alt="Icono de mascota" width="300">
                <br>
                <span style="font-size: 24px; font-family: 'Tu-Fuente-Aquí', sans-serif;">Veterinaria Amigo</span>
            </div>
            <!-- Resto del formulario de inicio de sesión -->
            <form method="post" action="ValidarLoginServlet">
                <div class="form-group">
                    <label for="usuario">Usuario:</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" required>
                </div>
                <div class="form-group">
                    <label for="contrasena">Contraseña:</label>
                    <input type="password" class="form-control" id="contrasena" name="contrasena" required>
                </div>
                <button type="submit" class="btn btn-primary">Iniciar Sesión</button>
                <div class="login-links">
                    <a href="#">Olvidé mi contraseña</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>