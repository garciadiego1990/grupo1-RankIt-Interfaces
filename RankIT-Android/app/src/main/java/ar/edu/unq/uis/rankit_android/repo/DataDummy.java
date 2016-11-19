package ar.edu.unq.uis.rankit_android.repo;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.model.Evaluado;

/**
 * Created by aee on 11/11/16.
 */

public class DataDummy {

    private List<Calificacion> calificaciones = new ArrayList<Calificacion>();
    private List<Evaluado> evaluados = new ArrayList<Evaluado>();

    static final DataDummy INSTANCE = new DataDummy();

    public int i;

    public DataDummy(){
        this.i = 0;
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

        this.evaluados.add(new Evaluado(i++, null, "Speedy", null));
        this.evaluados.add(new Evaluado(i++, null, "Movistar", null));
        this.evaluados.add(new Evaluado(i++, null, "Edesur", null));
        this.evaluados.add(new Evaluado(i++, null, "Cablevision", null));
        this.evaluados.add(new Evaluado(i++, null, "Carrefour", null));
        this.evaluados.add(new Evaluado(i++, null, "Quilmes", null));
        this.evaluados.add(new Evaluado(i++, null, "Berazategui", null));
        this.evaluados.add(new Evaluado(i++, null, "Lomas de Zamora", null));
        this.evaluados.add(new Evaluado(i++, null, "San Telmo", null));
        this.evaluados.add(new Evaluado(i++, null, "Telecentro", null));
        this.evaluados.add(new Evaluado(i++, null, "Parque de la Costa", null));
        this.evaluados.add(new Evaluado(i++, null, "Edenor", null));
        this.evaluados.add(new Evaluado(i++, null, "Jumbo", null));
        this.evaluados.add(new Evaluado(i++, null, "Tigre", null));
        this.evaluados.add(new Evaluado(i++, null, "Florencio Varela", null));
        this.evaluados.add(new Evaluado(i++, null, "Claro", null));
        this.evaluados.add(new Evaluado(i++, null, "Personal", null));
        this.evaluados.add(new Evaluado(i++, null, "AySA", null));
        this.evaluados.add(new Evaluado(i++, null, "La Boca", null));
        this.evaluados.add(new Evaluado(i++, null, "Nuñez", null));
        this.evaluados.add(new Evaluado(i++, null, "Yanqui Disney-SC", null));
        this.evaluados.add(new Evaluado(i++, null, "Euro Disney-SC", null));
        this.evaluados.add(new Evaluado(i++, null, "Asia Disney-SC", null));
        this.evaluados.add(new Evaluado(i++, null, "Oceania Disney-SC", null));
        this.evaluados.add(new Evaluado(i++, null, "Ruso Disney-SC", null));
    }

    public static DataDummy getInstance() {
        return INSTANCE;
    }

    /**@param idUsuario - Represenata el id de un usuario (en este método nunca se usa este parámetro).
     * @return todas las calificaciones, sin importar a qué usuario le pertenece*/
    public List<Calificacion> getCalificacionesDeUsuario(Integer idUsuario) {
        return this.calificaciones;
    }

    public Calificacion getCalificacion(long id) {
        for(Calificacion c: this.calificaciones) {
            if(c.getId().equals((int)id)) {
                return c;
            }
        }
        return null;
    }

    /**idUsuario no se usa en ningún momento.*/
    public void updateCalificacion(Integer idUsuario, Integer idCalificacion, String motivo, Integer puntaje) {
        Calificacion c = this.getCalificacion(idCalificacion);
        c.setMotivo(motivo);
        c.setPuntaje(puntaje);
    }

    /** Login hardcodeado:
     * Con usaurio=root, contrasenia=root:
     * - return 1
     * Con cualquier otro par de parámetros:
     * - return null */
    public Integer loginUsuario(String usuario, String contrasenia) {
        if(usuario.equals("root") && contrasenia.equals("root"))
            return 1;
        else
            return null;
    }

    /**Todos los evaluados. No importa si es servicio o lugar.*/
    public List<Evaluado> getEvaluados() {
        return this.evaluados;
    }

    /** Crea una calificación, le setea un id y la guarda en la lista de calificaciones.*/
    public void saveCalificacion(String nombre, int puntaje, String motivo) {
        Calificacion c = new Calificacion(nombre, i, puntaje, motivo);
        this.calificaciones.add(c);
    }
}
