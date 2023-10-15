package Controlador;

import dao.CitaDAO;
import basededatos.*;
import java.io.IOException;
import java.sql.Date;  // Importa la Date de SQL
import java.text.SimpleDateFormat;  // Asegurate de importar SimpleDateFormat para parsear las fechas
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Citas;
import java.io.PrintWriter;

@WebServlet(name = "ObtenerCitaServlet", urlPatterns = {"/ObtenerCitaServlet"})
public class ObtenerCitaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        CitaDAO citaDao = new CitaDAO();
        Citas cita;

        try {
            // Obtiene el parámetro idCita
            int idCita = Integer.parseInt(req.getParameter("idCita"));
            // Obtiene los datos de la cita según el id
            cita = citaDao.obtenerCitasPorId(idCita);
            // Verifica si se encontró la cita
            if (cita != null) {
                // Convierte la cita en JSON
                String citaJson = cita.toJson();
                PrintWriter out = resp.getWriter();
                // Retorna el JSON en la respuesta de la petición
                out.print(citaJson);
            } else {
                // Maneja el caso en que la cita no se encontró
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND); // Establece el código de estado 404
                resp.getWriter().write("Cita no encontrada");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
