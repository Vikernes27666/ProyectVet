package Controlador;

import dao.MascotasDAO;
import basededatos.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AgregarMascotaServlet", urlPatterns = {"/AgregarMascotaServlet"})
public class AgregarMascotaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombreMascota");
        String sexo = request.getParameter("sexoMascota");
        String raza = request.getParameter("raza");
        String color = request.getParameter("color");
        String especie = request.getParameter("especie");
        String dniCliente = request.getParameter("dniCliente");

        // Aquí creas un objeto de la clase que maneja la conexión a la base de datos
        Conexion conexion = new Conexion();

        // Creas un DAO para añadir mascotas pasándole a la conexión 
        MascotasDAO mascotasDAO = new MascotasDAO(conexion.con);

        // Llamada a la función para agregar la mascota a la base de datos
        mascotasDAO.agregarMascota(nombre, sexo, raza, color, especie, dniCliente);

        // Redirige al usuario de nuevo a la página de mascotas
        response.sendRedirect("Mascotas.jsp");        
    }
}

