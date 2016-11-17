package ar.edu.unq.uis.rankit_android.dummy;

import android.provider.ContactsContract;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unq.uis.rankit_android.model.Calificacion;

/**
 * Created by aee on 11/11/16.
 */

public class DataDummy {

    private List<Calificacion> calificaciones = new ArrayList<Calificacion>();

    static final DataDummy INSTANCE = new DataDummy();

    public DataDummy(){
        int i = 0;
        this.calificaciones.add(new Calificacion("Speedy", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Movistar", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Edesur", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Cablevision", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Carrefour", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Quilmes", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Berazategui", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Lomas de Zamora", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Telecentro", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Parque de la Costa", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Edenor", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Jumbo", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Tigre", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Florencio Varela", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Claro", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Personla", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("AySA", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("San Telmo", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("La Boca", i++, i, "Un motivo hardcodeado..."));
        this.calificaciones.add(new Calificacion("Nuñez", i++, i, "Un motivo hardcodeado..."));
    }

    public static DataDummy getInstance() {
        return INSTANCE;
    }

    public List<Calificacion> getCalificaciones(String nombreCalificacion, Integer cantidad) {
        List<Calificacion> listaFiltrada = new ArrayList<Calificacion>();
        for(Calificacion c: this.calificaciones) {
            if(true) { //c.getNombre().matches(nombreCalificacion)
                listaFiltrada.add(c);
            }
        }
        return listaFiltrada;
    }

    public Calificacion getCalificacion(long id) {
        for(Calificacion c: this.calificaciones) {
            if(c.getId().equals((int)id)) {
                return c;
            }
        }
        return null;
    }

    public void updateCalificacion(Integer id, String motivo, Integer puntaje) {
        Calificacion c = this.getCalificacion(id);
        c.setMotivo(motivo);
        c.setPuntaje(puntaje);
    }
}
