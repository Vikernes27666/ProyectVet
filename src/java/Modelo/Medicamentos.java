package Modelo;

public class Medicamentos {
    private int IDMedicamento;
    private String Nombre;
    private String Descripcion;
    private int CantidadInventario;
    private String FechaVencimiento;
    private double Precio;

    public Medicamentos() {
    }

    public int getIDMedicamento() {
        return IDMedicamento;
    }

    public void setIDMedicamento(int IDMedicamento) {
        this.IDMedicamento = IDMedicamento;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getCantidadInventario() {
        return CantidadInventario;
    }

    public void setCantidadInventario(int CantidadInventario) {
        this.CantidadInventario = CantidadInventario;
    }

    public String getFechaVencimiento() {
        return FechaVencimiento;
    }

    public void setFechaVencimiento(String FechaVencimiento) {
        this.FechaVencimiento = FechaVencimiento;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }
}