package ar.edu.unq.uis.rankit_android.model.exceptions;

/**
 * Created by aee on 17/11/16.
 */
public class UsuarioNoEncontradoException extends RuntimeException {

    public UsuarioNoEncontradoException() {
        super("El usuario dado es inexistente o los datos del usuario se ingresaron de forma erronea.");
    }
}
