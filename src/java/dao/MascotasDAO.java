package dao;

import Modelo.Cliente;
import Modelo.Mascota;
import basededatos.Conexion;
import java.sql.*;
import java.util.ArrayList;

public class MascotasDAO {
    private Connection con;
    private String SELECT = "SELECT ma.ID, ma.NombreAnimal, ma.Raza, ma.Color, ma.Especie,ma.SexoAnimal, ma.DniCliente, cl.Nombre FROM mascotas ma INNER JOIN bdvet.clientes cl ON cl.DNI=ma.DniCliente ";

    public MascotasDAO(Connection con) {
        this.con = con;
    }

    public MascotasDAO() {
         this.con = new Conexion().con;
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
    
     public ArrayList<Mascota> obtenerMascotas() throws SQLException {
        ArrayList<Mascota> mascotas = new ArrayList<>();
        String query = SELECT ;
        PreparedStatement statement = con.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Cliente cliente = new Cliente();
            Mascota mascota = new Mascota();
            
            // Llenado de datos del cliente
            cliente.setDni(resultSet.getString("DniCliente"));
            cliente.setNombre(resultSet.getString("Nombre"));
            
            // Llenado de datos de la mascota
            mascota.setId(resultSet.getInt("ID"));
            mascota.setNombreAnimal(resultSet.getString("NombreAnimal"));
            mascota.setColor(resultSet.getString("Color"));
            mascota.setRaza(resultSet.getString("Raza"));
            mascota.setSexoMascota(resultSet.getString("SexoAnimal"));
            mascota.setEspecie(resultSet.getString("Especie"));
            mascota.setCliente(cliente);
            
            mascotas.add(mascota);
        }

        return mascotas;
    }
    
    public ArrayList<Mascota> obtenerMascotasPorCliente(String dniCliente) throws SQLException {
        ArrayList<Mascota> mascotas = new ArrayList<>();
        String query = SELECT + " WHERE cl.DniCliente = ? ";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setString(1, dniCliente);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Cliente cliente = new Cliente();
            Mascota mascota = new Mascota();
            
            // Llenado de datos del cliente
            cliente.setDni(resultSet.getString("DniCliente"));
            cliente.setNombre(resultSet.getString("Nombre"));
            
            // Llenado de datos de la mascota
            mascota.setId(resultSet.getInt("ID"));
            mascota.setNombreAnimal(resultSet.getString("NombreAnimal"));
            mascota.setColor(resultSet.getString("Color"));
            mascota.setRaza(resultSet.getString("Raza"));
            mascota.setSexoMascota(resultSet.getString("SexoAnimal"));
            mascota.setEspecie(resultSet.getString("Especie"));
            mascota.setCliente(cliente);
            
            mascotas.add(mascota);
        }

        return mascotas;
    }
    
    // Puedes agregar más métodos para actualizar y consultar mascotas según tus necesidades.
}

