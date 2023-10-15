package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
    private Connection conexion; // Obtén la conexión desde tu clase de conexión

    public LoginDAO(Connection conexion) {
        this.conexion = conexion;
    }

    public boolean validarCredenciales(String usuario, String contrasena) {
        try {
            String consulta = "SELECT ID, nombre, telefono, usuario, cargo FROM usuarios WHERE usuario=? AND contrasena=?";
            PreparedStatement statement = conexion.prepareStatement(consulta);
            statement.setString(1, usuario);
            statement.setString(2, contrasena);
            ResultSet resultado = statement.executeQuery();
            return resultado.next();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
