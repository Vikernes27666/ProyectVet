/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import basededatos.Conexion;
import dao.ClientesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Us
 */
@WebServlet(name = "EliminarClienteServlet", urlPatterns = {"/EliminarClienteServlet"})
public class EliminarClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String DNI = request.getParameter("DNI");

        if (DNI != null && !DNI.isEmpty()) {
            // Crear una conexión a la base de datos
            Conexion conexion = new Conexion();

            // Crear un DAO para manejar la eliminación de clientes
            ClientesDAO clientesDAO = new ClientesDAO(conexion.con);

            // Llamar a la función para eliminar el cliente por DNI
            clientesDAO.eliminarCliente(DNI);

            // Redirigir a la página de clientes después de la eliminación
            response.sendRedirect("Clientes.jsp");
        } else {
            // Manejar el caso en el que el parámetro "DNI" no es válido.
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}