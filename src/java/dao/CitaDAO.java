package dao;

import java.sql.*;
import Modelo.Citas;
import Modelo.Cliente;
import Modelo.Mascota;
import basededatos.Conexion;
import java.util.ArrayList;

public class CitaDAO {

    private Connection con;
    private String SELECT = "SELECT ci.ID, ci.FechaCita,ci.RazonCita, ci.Estado, ci.DniCliente, cl.Nombre,  ci.IdMascota, ma.NombreAnimal, ma.Raza, ma.Color, ma.Especie, ma.SexoAnimal FROM bdvet.citas ci INNER JOIN bdvet.clientes cl ON cl.DNI=ci.DniCliente INNER JOIN bdvet.mascotas ma ON ma.ID=ci.IdMascota";

    public CitaDAO(Connection con) {
        this.con = con;
    }

    public CitaDAO() {
        this.con = new Conexion().con;
    }
    

    public void agregarCita(Citas cita) {
        try {
            String SQLQuery = "INSERT INTO citas (RazonCita, FechaCita, DniCliente, IdMascota, Estado) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setString(1, cita.getRazonCita());
            statement.setDate(2, new Date(cita.getFechaCita().getTime())); // Convierte la fecha a java.sql.Date
            statement.setString(3, cita.getDniCliente());
            statement.setInt(4, cita.getIdMascota());
            statement.setString(5, cita.getEstado());

            int records = statement.executeUpdate();
            System.out.println(records + " Nuevo registro agregado.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void editarCita(Citas cita) {
        try {
            if (cita != null && cita.getFechaCita() != null) { // Verifica que el objeto y la fecha no sean nulos
                String SQLQuery = "UPDATE citas SET RazonCita = ?, FechaCita = ?, DniCliente = ?, IdMascota = ?, Estado = ? WHERE ID = ?";

                PreparedStatement statement = con.prepareStatement(SQLQuery);
                statement.setString(1, cita.getRazonCita());
                statement.setDate(2, new Date(cita.getFechaCita().getTime()));
                statement.setString(3, cita.getDniCliente());
                statement.setInt(4, cita.getIdMascota());
                statement.setString(5, cita.getEstado());
                statement.setInt(6, cita.getID());

                int records = statement.executeUpdate();
                System.out.println(records + " Registro(s) actualizado(s).");
            } else {
                // Maneja el caso en que la cita o la fecha sean nulos
                System.out.println("Error: La cita o la fecha no son válidos.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void eliminarCita(int id) {
        try {
            String SQLQuery = "DELETE FROM citas WHERE ID = ?";
            PreparedStatement statement = con.prepareStatement(SQLQuery);
            statement.setInt(1, id);
            int records = statement.executeUpdate();
            System.out.println(records + " Registro(s) eliminado(s).");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<Citas> obtenerCitas() throws SQLException {
        ArrayList<Citas> listaCitas = new ArrayList<>();
        String query = SELECT;
        PreparedStatement statement = con.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Citas cita = new Citas();
            Cliente cliente = new Cliente();
            Mascota mascota = new Mascota();
            
            // Llenado de datos del cliente
            cliente.setDni(resultSet.getString("DniCliente"));
            cliente.setNombre(resultSet.getString("Nombre"));
            
            // Llenado de datos de la mascota
            mascota.setId(resultSet.getInt("IdMascota"));
            mascota.setNombreAnimal(resultSet.getString("NombreAnimal"));
            mascota.setColor(resultSet.getString("Color"));
            mascota.setRaza(resultSet.getString("Raza"));
            mascota.setSexoMascota(resultSet.getString("SexoAnimal"));
            mascota.setEspecie(resultSet.getString("Especie"));
            mascota.setCliente(cliente);
            
            //Llenado de datos de la cita
            cita.setRazonCita(resultSet.getString("RazonCita"));
            cita.setFechaCita(resultSet.getDate("FechaCita"));
            cita.setEstado(resultSet.getString("Estado"));
            cita.setID(resultSet.getInt("ID"));
            cita.setDniCliente(resultSet.getString("DniCliente"));
            cita.setIdMascota(resultSet.getInt("IdMascota"));
            cita.setMascota(mascota);
            

            listaCitas.add(cita);
        }

        return listaCitas;
    }
    
    public ArrayList<Citas> obtenerCitasPorFecha(Date fecha) throws SQLException {
        ArrayList<Citas> listaCitas = new ArrayList<>();
        String query = SELECT + " WHERE ci.FechaCita = ?";
        PreparedStatement statement = con.prepareStatement(query);
        statement.setDate(1, (java.sql.Date) fecha);
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Citas cita = new Citas();
            Cliente cliente = new Cliente();
            Mascota mascota = new Mascota();
            
            // Llenado de datos del cliente
            cliente.setDni(resultSet.getString("DniCliente"));
            cliente.setNombre(resultSet.getString("Nombre"));
            
            // Llenado de datos de la mascota
            mascota.setId(resultSet.getInt("IdMascota"));
            mascota.setNombreAnimal(resultSet.getString("NombreAnimal"));
            mascota.setColor(resultSet.getString("Color"));
            mascota.setRaza(resultSet.getString("Raza"));
            mascota.setSexoMascota(resultSet.getString("SexoAnimal"));
            mascota.setEspecie(resultSet.getString("Especie"));
            mascota.setCliente(cliente);
            
            //Llenado de datos de la cita
            cita.setRazonCita(resultSet.getString("RazonCita"));
            cita.setFechaCita(resultSet.getDate("FechaCita"));
            cita.setEstado(resultSet.getString("Estado"));
            cita.setID(resultSet.getInt("ID"));
            cita.setDniCliente(resultSet.getString("DniCliente"));
            cita.setIdMascota(resultSet.getInt("IdMascota"));
            cita.setMascota(mascota);
            

            listaCitas.add(cita);
        }

        return listaCitas;
    }
    
    public ArrayList<Citas> obtenerCitasPorTexto(String texto) throws SQLException {
        ArrayList<Citas> listaCitas = new ArrayList<>();
        String query = SELECT+ " WHERE ci.RazonCita LIKE \"%"+texto+"%\" OR ma.NombreAnimal LIKE \"%"+texto+"%\" OR ma.Raza LIKE \"%"+texto+"%\" OR ci.DniCliente LIKE \"%"+texto+"%\";";
        PreparedStatement statement = con.prepareStatement(query);
        
        ResultSet resultSet = statement.executeQuery();
        while (resultSet.next()) {
            Citas cita = new Citas();
            Cliente cliente = new Cliente();
            Mascota mascota = new Mascota();
            
            // Llenado de datos del cliente
            cliente.setDni(resultSet.getString("DniCliente"));
            cliente.setNombre(resultSet.getString("Nombre"));
            
            // Llenado de datos de la mascota
            mascota.setId(resultSet.getInt("IdMascota"));
            mascota.setNombreAnimal(resultSet.getString("NombreAnimal"));
            mascota.setColor(resultSet.getString("Color"));
            mascota.setRaza(resultSet.getString("Raza"));
            mascota.setSexoMascota(resultSet.getString("SexoAnimal"));
            mascota.setEspecie(resultSet.getString("Especie"));
            mascota.setCliente(cliente);
            
            //Llenado de datos de la cita
            cita.setRazonCita(resultSet.getString("RazonCita"));
            cita.setFechaCita(resultSet.getDate("FechaCita"));
            cita.setEstado(resultSet.getString("Estado"));
            cita.setID(resultSet.getInt("ID"));
            cita.setDniCliente(resultSet.getString("DniCliente"));
            cita.setIdMascota(resultSet.getInt("IdMascota"));
            cita.setMascota(mascota);
            

            listaCitas.add(cita);
        }

        return listaCitas;
    }
}
