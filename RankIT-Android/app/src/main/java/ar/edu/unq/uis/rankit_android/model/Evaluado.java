package ar.edu.unq.uis.rankit_android.model;

/**
 * Created by aeentk on 19/11/16.
 */

public class Evaluado {

    private Integer id;
    private String tipo;
    private String nombre;
    private Double promedio;

    public Evaluado() {
        super();
    }

    public Evaluado(Integer id, String tipo, String nombre, Double promedio) {
        this.id = id;
        this.tipo = tipo;
        this.nombre = nombre;
        this.promedio = promedio;
    }

    public Integer getId() { return id; }

    public void setId(Integer id) { this.id = id; }

    public String getTipo() { return tipo; }

    public void setTipo(String tipo) { this.tipo = tipo; }

    public String getNombre() { return nombre; }

    public void setNombre(String nombre) { this.nombre = nombre; }

    public Double getPromedio() { return promedio; }

    public void setPromedio(Double promedio) { this.promedio = promedio; }

    @Override
    public String toString() {
        return this.getNombre();
    }
}
