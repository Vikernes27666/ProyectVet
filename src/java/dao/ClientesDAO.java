package dao;
import Controlador.AgregarClienteServlet;
import java.sql.*;
import java.sql.PreparedStatement;

public class ClientesDAO {
   private Connection con;

    public ClientesDAO(Connection con) {
        this.con = con;
    }

    public void agregarCliente(String DNI, String Nombre) {
        try {
            String SQLQuery = "INSERT INTO clientes (DNI,Nombre) VALUES (?, ?)";

            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setString(1, DNI);
            statement.setString(2, Nombre);
            int records = statement.executeUpdate();
            System.out.println(records + " New record added.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void eliminarCliente(String DNI) {
        try {
            String SQLQuery = "DELETE FROM clientes WHERE DNI = ?";
            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setString(1, DNI);
            int records = statement.executeUpdate();
            System.out.println(records + " Record(s) deleted.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    

    

}