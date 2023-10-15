
package dao;
import java.sql.*;
import Controlador.AgregarPerfilServlet;
public class PerfilDAO {
    private Connection con;

    public PerfilDAO(Connection con) {
        this.con = con;
    }

    public void agregarPerfil(String nombre, String telefono, String usuario, String contrasena, String cargo) {
        try {
            String SQLQuery = "INSERT INTO usuarios (nombre, telefono, usuario, contrasena, cargo) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setString(1, nombre);
            statement.setString(2, telefono);
            statement.setString(3, usuario);
            statement.setString(4, contrasena);
            statement.setString(5, cargo);

            int records = statement.executeUpdate();
            System.out.println(records + " New record added.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void eliminarPerfil(int id) {
        try {
            String SQLQuery = "DELETE FROM usuarios WHERE ID = ?";
            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setInt(1, id);
            int records = statement.executeUpdate();
            System.out.println(records + " Record(s) deleted.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

    

}
