/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;
import basededatos.Conexion;
import dao.PerfilDAO;
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
@WebServlet(name = "EliminarPerfilServlet", urlPatterns = {"/EliminarPerfilServlet"})
public class EliminarPerfilServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null && idParam.matches("\\d+")) {
            int id = Integer.parseInt(idParam);

            // Creas una conexión a la base de datos
            Conexion conexion = new Conexion();

            // Creas un DAO para manejar la eliminación de perfiles
            PerfilDAO perfilDAO = new PerfilDAO(conexion.con);

            // Llamada a la función para eliminar el perfil por ID
            perfilDAO.eliminarPerfil(id);

            // Redirige a la página de perfiles después de la eliminación
            response.sendRedirect("Perfil.jsp");
        } else {
            // Maneja el caso en el que el parámetro "id" no es válido.
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}