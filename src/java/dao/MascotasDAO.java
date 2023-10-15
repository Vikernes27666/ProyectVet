package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MascotasDAO {
    private Connection con;

    public MascotasDAO(Connection con) {
        this.con = con;
    }

    public void agregarMascota(String nombre, String sexo, String raza, String color, String especie, String dniCliente) {
        try {
            String SQLQuery = "INSERT INTO mascotas (NombreAnimal, SexoAnimal, Raza, Color, Especie, DniCliente) VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setString(1, nombre);
            statement.setString(2, sexo);
            statement.setString(3, raza);
            statement.setString(4, color);
            statement.setString(5, especie);
            statement.setString(6, dniCliente);

            int records = statement.executeUpdate();
            System.out.println(records + " Nuevo registro agregado.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void eliminarMascota(int id) {
        try {
            String SQLQuery = "DELETE FROM mascotas WHERE ID = ?";
            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setInt(1, id);
            int records = statement.executeUpdate();
            System.out.println(records + " Registro(s) eliminado(s).");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    // Puedes agregar más métodos para actualizar y consultar mascotas según tus necesidades.
}

