package ar.edu.unq.uis.rankit_android.model;

import java.io.Serializable;

/**
 * Created by aee on 11/11/16.
 */
public class Calificacion implements Serializable {

    private String evaluado;
    private Integer id;
    private Integer puntaje;
    private String motivo;

    public Calificacion(){
        super();
    }

    public Calificacion(String evaluadoNombre, Integer id, Integer puntaje, String motivo){
        this.setEvaluado(evaluadoNombre);
        this.setId(id);
        this.setPuntaje(puntaje);
        this.setMotivo(motivo);
    }

    public String getEvaluado() {
        return this.evaluado;
    }

    public void setEvaluado(String nombre) {
        this.evaluado = nombre;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(Integer puntaje) {
        this.puntaje = puntaje;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }
}
