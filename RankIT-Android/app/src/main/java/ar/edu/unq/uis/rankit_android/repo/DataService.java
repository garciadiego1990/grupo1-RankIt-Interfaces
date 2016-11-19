package ar.edu.unq.uis.rankit_android.repo;


import java.util.List;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.model.Evaluado;
import ar.edu.unq.uis.rankit_android.model.exceptions.UsuarioNoEncontradoException;

/** Singleton que tiene como función proveer de datos a la aplicación.
 * Esta clase es el único punto de entrada a los datos que manejará la aplicación. */
public class DataService {

    //Fuente de donde esta clase obtendrá los datos necesarios para la aplicación.
    private DataDummy repo; //TODO: cambiar DataDummy por la interfaz del servicio rest que se va a utilizar.

    //Singleton
    public static DataService INSTANCE;



    private DataService() {
        this.repo = new DataDummy();
    }

    public static DataService getInstance() {
        if(INSTANCE == null)
            INSTANCE = new DataService();
        return INSTANCE;
    }



    /**Dado el id del usuario logueado en la aplicación se responde con la lista de todas las calificaciones
     * que realizó.
     * @return Todas las calificaciones de un determinado usuario.*/
    public List<Calificacion> getCalificaciones(Integer idUsuario) {
        return this.repo.getCalificacionesDeUsuario(idUsuario);
    }


    /**Loguea un usuario en la aplicación haciendo uso de su usuario y contraseña.
     * Si el logueo es exitoso se responde con el id del usuario logueado. Caso contrario se lanza una excepción.
     * @param usuario - usuario a loguear.
     * @param contrasenia - contraseña del usuario
     * @return el id del usuario logueado.
    * @throws ar.edu.unq.uis.rankit_android.model.exceptions.UsuarioNoEncontradoException en caso de fallar
    * el logueo por usuario o contraseña erroneos.*/
    public Integer login(String usuario, String contrasenia) {
        Integer id = this.repo.loginUsuario(usuario, contrasenia);
        if(id == null)
            throw new UsuarioNoEncontradoException();
        return id;
    }


    /**Se responde con la calificación que posee el id dado.
     * @return calificación con el id dado.*/
    public Calificacion getCalificacion(Integer id) {
        return this.repo.getCalificacion(id);
    }

    public void updateCalificacion(Integer idUsuario, Integer idCalificacion, String motivo, Integer puntaje) {
        this.repo.updateCalificacion(idUsuario, idCalificacion, motivo, puntaje);
    }

    public List<Evaluado> getEvaluados() {
        return this.repo.getEvaluados();
    }

    public void saveCalificacion(String nombre, int puntaje, String motivo) {
        this.repo.saveCalificacion(nombre, puntaje, motivo);
    }
}
