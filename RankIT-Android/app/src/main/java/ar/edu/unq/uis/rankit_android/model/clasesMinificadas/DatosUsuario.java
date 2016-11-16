package ar.edu.unq.uis.rankit_android.model.clasesMinificadas;

/**
 * Created by nicolas on 16/11/16.
 */

public class DatosUsuario {
    private String usuario;
    private String password;

    public DatosUsuario(){}

    public DatosUsuario(String usuario, String password) {
        this.usuario = usuario;
        this.password = password;
    }

    public String getUsuario() {
        return this.usuario;
    }

    public String getPassword() {
        return this.password;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    public void setPassword(String password) {
        this.password = password;
    }

}
