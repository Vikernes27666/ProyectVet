/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author vieri
 */
public class Mascota {
    private int id;
    private String nombreAnimal;
    private String sexoMascota;
    private String raza;
    private String color;
    private String especie;
    private Cliente cliente;

    public Mascota(int id, String nombreAnimal, String sexoMascota, String raza, String color, String especie, Cliente cliente) {
        this.id = id;
        this.nombreAnimal = nombreAnimal;
        this.sexoMascota = sexoMascota;
        this.raza = raza;
        this.color = color;
        this.especie = especie;
        this.cliente = cliente;
    }

    public Mascota() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreAnimal() {
        return nombreAnimal;
    }

    public void setNombreAnimal(String nombreMascota) {
        this.nombreAnimal = nombreMascota;
    }

    public String getSexoMascota() {
        return sexoMascota;
    }

    public void setSexoMascota(String sexoMascota) {
        this.sexoMascota = sexoMascota;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public String toString() {
        return "Mascota{" + "id=" + id + ", nombreMascota=" + nombreAnimal + ", sexoMascota=" + sexoMascota + ", raza=" + raza + ", color=" + color + ", especie=" + especie + ", cliente=" + cliente + '}';
    }
    
    
}
