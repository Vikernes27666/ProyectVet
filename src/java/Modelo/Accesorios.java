package modelo;

public class Accesorios {
    private int IDAccesorios;
    private String nombre;
    private String descripcion;
    private int cantidad;
    private double precio;

    public Accesorios() {}

    public int getIDAccesorios() {
        return IDAccesorios;
    }

    public void setIDAccesorios(int IDAccesorios) {
        this.IDAccesorios = IDAccesorios;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
}