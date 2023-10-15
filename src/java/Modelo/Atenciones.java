package Modelo;

import java.util.Date;

public class Atenciones {
    private int ID;
    private String NombreAnimal;
    private String SexoAnimal;
    private String Raza;
    private String Color;
    private String Especie;
    private Date FechaNacimiento;
    private String NombrePropietario;
    private int DNIPropietario;
    private String RazonAtencion;
    private Date FechaAtencion;

    public Atenciones() {}

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNombreAnimal() {
        return NombreAnimal;
    }

    public void setNombreAnimal(String NombreAnimal) {
        this.NombreAnimal = NombreAnimal;
    }

    public String getSexoAnimal() {
        return SexoAnimal;
    }

    public void setSexoAnimal(String SexoAnimal) {
        this.SexoAnimal = SexoAnimal;
    }

    public String getRaza() {
        return Raza;
    }

    public void setRaza(String Raza) {
        this.Raza = Raza;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getEspecie() {
        return Especie;
    }

    public void setEspecie(String Especie) {
        this.Especie = Especie;
    }

    public Date getFechaNacimiento() {
        return FechaNacimiento;
    }

    public void setFechaNacimiento(Date FechaNacimiento) {
        this.FechaNacimiento = FechaNacimiento;
    }

    public String getNombrePropietario() {
        return NombrePropietario;
    }

    public void setNombrePropietario(String NombrePropietario) {
        this.NombrePropietario = NombrePropietario;
    }

    public int getDNIPropietario() {
        return DNIPropietario;
    }

    public void setDNIPropietario(int DNIPropietario) {
        this.DNIPropietario = DNIPropietario;
    }

    public String getRazonAtencion() {
        return RazonAtencion;
    }

    public void setRazonAtencion(String RazonAtencion) {
        this.RazonAtencion = RazonAtencion;
    }

    public Date getFechaAtencion() {
        return FechaAtencion;
    }

    public void setFechaAtencion(Date FechaAtencion) {
        this.FechaAtencion = FechaAtencion;
    }
}