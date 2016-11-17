package ar.edu.unq.uis.rankit_android.repo;

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
}
