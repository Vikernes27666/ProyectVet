package Controlador;

import dao.CitaDAO;
import basededatos.Conexion;
import Modelo.Citas;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AgendarCitaServlet", urlPatterns = {"/AgendarCitaServlet"})
public class AgendarCitaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Recuperar los parámetros del formulario
        String razonCita = request.getParameter("razonCita");
        String fechaCitaStr = request.getParameter("fechaCita");
        String dniCliente = request.getParameter("dniCliente");
        int idMascota = Integer.parseInt(request.getParameter("idMascota"));
        String estado = "Pendiente"; // Puedes establecer un valor predeterminado

        try {
            // Convierte la fecha de cadena a un objeto Date
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaCita = dateFormat.parse(fechaCitaStr);

            // Aquí creas un objeto de la clase que maneja la conexión a la base de datos
            Conexion conexion = new Conexion(); // Asegúrate de tener tu clase de conexión

            // Creas un DAO para agregar citas pasándole la conexión
            CitaDAO citaDAO = new CitaDAO(conexion.con); // Asegúrate de tener tu clase CitaDAO

            // Crea una instancia de Citas con los datos del formulario
            Citas nuevaCita = new Citas();
            nuevaCita.setRazonCita(razonCita);
            nuevaCita.setFechaCita(fechaCita);
            nuevaCita.setDniCliente(dniCliente);
            nuevaCita.setIdMascota(idMascota);
            nuevaCita.setEstado(estado);

            // Llama a la función para agregar la cita a la base de datos
            citaDAO.agregarCita(nuevaCita);

            // Redirige al usuario de nuevo a la página de citas
            response.sendRedirect("Citas.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Manejo de errores (puedes redirigir a una página de error)
            response.sendRedirect("error.jsp");
        }
    }
}
