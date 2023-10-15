package Modelo;

import java.util.Date;

public class Citas {
    private int ID;
    private String RazonCita;
    private Date FechaCita;
    private String DniCliente;
    private int IdMascota;
    private String Estado;
    private Mascota mascota;

    public Mascota getMascota() {
        return mascota;
    }

    public void setMascota(Mascota mascota) {
        this.mascota = mascota;
    }

    public Citas() {
    }

    public Citas(int ID, String RazonCita, Date FechaCita, String DniCliente, int IdMascota, String Estado) {
        this.ID = ID;
        this.RazonCita = RazonCita;
        this.FechaCita = FechaCita;
        this.DniCliente = DniCliente;
        this.IdMascota = IdMascota;
        this.Estado = Estado;
    }
    

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getRazonCita() {
        return RazonCita;
    }

    public void setRazonCita(String RazonCita) {
        this.RazonCita = RazonCita;
    }

    public Date getFechaCita() {
        return FechaCita;
    }

    public void setFechaCita(Date FechaCita) {
        this.FechaCita = FechaCita;
    }

    public String getDniCliente() {
        return DniCliente;
    }

    public void setDniCliente(String DniCliente) {
        this.DniCliente = DniCliente;
    }

    public int getIdMascota() {
        return IdMascota;
    }

    public void setIdMascota(int IdMascota) {
        this.IdMascota = IdMascota;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    @Override
    public String toString() {
        return "Citas{" + "ID=" + ID + ", RazonCita=" + RazonCita + ", FechaCita=" + FechaCita + ", DniCliente=" + DniCliente
                + ", IdMascota=" + IdMascota + ", Estado=" + Estado + '}';
    }

    
}
