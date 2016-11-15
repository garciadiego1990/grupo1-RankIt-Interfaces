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
        for(int i=0; i<=30; i++)
            this.calificaciones.add(new Calificacion(i+" calif dummy", i, i, "Un motivo hardcodeado..."));
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
            if(c.getId().equals((int)id)) { //c.getNombre().matches(nombreCalificacion)
                return c;
            }
        }
        return null;
    }
}
