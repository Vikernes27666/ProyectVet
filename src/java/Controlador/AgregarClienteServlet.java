package Controlador;

import basededatos.*;
import dao.ClientesDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AgregarClienteServlet", urlPatterns = {"/AgregarClienteServlet"})
public class AgregarClienteServlet extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String DNI = request.getParameter("DNI");
        String Nombre = request.getParameter("Nombre");
        // Aquí creas un objeto de la clase que maneja la conexión a la base de datos
        Conexion conexion = new Conexion();

        // Creas un DAO para añadir perfiles pasándole a la conexión 
        ClientesDAO clientesDAO = new ClientesDAO(conexion.con);

        // Llamada a la función para agregar el perfil a la base de datos
        clientesDAO.agregarCliente(DNI, Nombre);

        // Redirige al usuario de nuevo a la página de perfiles
        response.sendRedirect("Clientes.jsp");        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
    

}