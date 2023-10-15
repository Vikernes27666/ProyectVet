package Controlador;
import basededatos.Conexion;
import dao.MascotasDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EliminarMascotaServlet", urlPatterns = {"/EliminarMascotaServlet"})
public class EliminarMascotaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null && idParam.matches("\\d+")) {
            int id = Integer.parseInt(idParam);

            // Creas una conexión a la base de datos
            Conexion conexion = new Conexion();

            // Creas un DAO para manejar la eliminación de mascotas
            MascotasDAO mascotasDAO = new MascotasDAO(conexion.con);

            // Llamada a la función para eliminar la mascota por ID
            mascotasDAO.eliminarMascota(id);

            // Redirige a la página de mascotas después de la eliminación
            response.sendRedirect("Mascotas.jsp");
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