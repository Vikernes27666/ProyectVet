package Controlador;

import dao.LoginDAO;
import basededatos.Conexion;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ValidarLoginServlet", urlPatterns = {"/ValidarLoginServlet"})
public class ValidarLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        try {
            Conexion conexion = new Conexion(); // Asegúrate de tener tu clase de conexión

            // Crea un DAO para validar las credenciales pasando la conexión
            LoginDAO loginDAO = new LoginDAO(conexion.con); // Asegúrate de tener tu clase LoginDAO

            if (loginDAO.validarCredenciales(usuario, contrasena)) {
                // Credenciales correctas, redirige a la página deseada
                response.sendRedirect("Clientes.jsp"); // Cambia "Citas.jsp" a la página a la que deseas redirigir
            } else {
                // Credenciales incorrectas, establece un mensaje de error en la solicitud
                request.setAttribute("error", "Credenciales incorrectas. Por favor, inténtalo de nuevo.");

                // Vuelve a cargar la página de inicio de sesión
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Manejo de errores (puedes redirigir a una página de error)
            response.sendRedirect("Login.jsp");
        }
    }
}

