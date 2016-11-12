package ar.edu.unq.uis.rankit_android.model;

/**
 * Created by aee on 11/11/16.
 */
public class Calificacion {

    private String nombre;
    private Integer id;
    private Integer puntaje;
    private String motivo;

    public Calificacion(){
        super();
    }

    public Calificacion(String nombre, Integer id, Integer puntaje, String motivo){
        this.setNombre(nombre);
        this.setId(id);
        this.setPuntaje(puntaje);
        this.setMotivo(motivo);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
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
