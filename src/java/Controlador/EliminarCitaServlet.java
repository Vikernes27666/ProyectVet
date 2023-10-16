package Controlador;

import basededatos.Conexion;
import dao.CitaDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EliminarCitaServlet", urlPatterns = {"/EliminarCitaServlet"})
public class EliminarCitaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String citaIDParam = request.getParameter("citaID");

        if (citaIDParam != null && !citaIDParam.isEmpty()) {
            int citaID = Integer.parseInt(citaIDParam);

            // Crear una conexión a la base de datos
            Conexion conexion = new Conexion();

            // Crear un DAO para manejar la eliminación de citas
            CitaDAO citasDAO = new CitaDAO(conexion.con);

            // Llamar a la función para eliminar la cita por su ID
            citasDAO.eliminarCita(citaID);

            // Enviar una respuesta al cliente (puedes enviar un mensaje de éxito)
            response.getWriter().write("success");
        } else {
            // Manejar el caso en el que el parámetro "citaID" no es válido.
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}

