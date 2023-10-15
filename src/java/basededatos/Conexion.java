package basededatos;
//libreria
import java.sql.*;
public class Conexion implements Parametros{
    public Connection con;
    public PreparedStatement ps;
    public Statement smt;
    public ResultSet rs;
    public Conexion(){
        try{
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USER, CLAVE);
            smt=con.createStatement();
        }catch(Exception ex){
            System.out.println("ERROR no se puede conectar a la BD."+ex);
        }
    }
}
