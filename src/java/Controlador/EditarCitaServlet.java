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

@WebServlet(name = "EditarCitaServlet", urlPatterns = {"/EditarCitaServlet"})
public class EditarCitaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            // Obtén los nuevos datos para la cita desde los parámetros de la solicitud
            int id = Integer.parseInt(request.getParameter("editarCitaId"));
            String razonCita = request.getParameter("editarRazonCita");
            Date fechaCita = new Date(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("editarFechaCita")).getTime());
            String dniCliente = request.getParameter("editarDniCliente");
            int idMascota = Integer.parseInt(request.getParameter("editarIdMascota"));
            String estado = request.getParameter("editarEstado");

            // Crea un objeto de Citas con los nuevos datos
            Citas cita = new Citas(id, razonCita, fechaCita, dniCliente, idMascota, estado);

            // Aquí creas un objeto de la clase que maneja la conexión a la base de datos
            Conexion conexion = new Conexion();

            // Creas un DAO para editar citas pasándole a la conexión 
            CitaDAO citaDAO = new CitaDAO(conexion.con);

            // Llamada a la función para editar la cita
            citaDAO.editarCita(cita);

            // Redirige al usuario de nuevo a la página de Citas
            response.sendRedirect("Citas.jsp");
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }      
    }
    


}
