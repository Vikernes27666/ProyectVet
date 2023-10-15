package Controlador;
import dao.PerfilDAO;
import basededatos.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AgregarPerfilServlet", urlPatterns = {"/AgregarPerfilServlet"})
public class AgregarPerfilServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");
        String cargo = request.getParameter("cargo");

        // Aquí creas un objeto de la clase que maneja la conexión a la base de datos
        Conexion conexion = new Conexion();

        // Creas un DAO para añadir perfiles pasándole a la conexión 
        PerfilDAO perfilDAO = new PerfilDAO(conexion.con);

        // Llamada a la función para agregar el perfil a la base de datos
        perfilDAO.agregarPerfil(nombre, telefono, usuario, contrasena, cargo);

        // Redirige al usuario de nuevo a la página de perfiles
        response.sendRedirect("Perfil.jsp");        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    

}
