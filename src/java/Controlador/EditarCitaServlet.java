package Controlador;

import Modelo.Citas;
import basededatos.Conexion;
import dao.CitaDAO;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EditarCitaServlet", urlPatterns = {"/EditarCitaServlet"})
public class EditarCitaServlet extends HttpServlet {

 @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("editarCitaId"));
    String razonCita = request.getParameter("editarRazonCita");
    
    // Validar y obtener la fecha
    Date fechaCita = null;
    String fechaCitaString = request.getParameter("editarFechaCita");
    if (fechaCitaString != null && !fechaCitaString.isEmpty()) {
        try {
            fechaCita = Date.valueOf(fechaCitaString);
        } catch (IllegalArgumentException e) {
            // Manejar el caso en que la fecha no sea válida, por ejemplo, mostrar un mensaje de error.
        }
    }

    String dniCliente = request.getParameter("editarDniCliente");
    int idMascota = Integer.parseInt(request.getParameter("editarIdMascota"));
    String estado = request.getParameter("editarEstado");

    if (fechaCita != null) { // Verificar si la fecha es válida
        Conexion conexion = new Conexion();
        CitaDAO citaDAO = new CitaDAO(conexion.con);

        Citas citaEditada = new Citas(id, razonCita, fechaCita, dniCliente, idMascota, estado);

        citaDAO.editarCita(citaEditada);

        // Redirige al usuario a una página de confirmación o visualización
        response.sendRedirect("Citas.jsp");
    } else {
        // Manejar el caso en que la fecha sea nula o no válida, por ejemplo, mostrar un mensaje de error.
    }
}

}