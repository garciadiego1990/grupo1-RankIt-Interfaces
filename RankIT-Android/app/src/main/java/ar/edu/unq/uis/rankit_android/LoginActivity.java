package ar.edu.unq.uis.rankit_android;

import android.content.Intent;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import ar.edu.unq.uis.rankit_android.model.exceptions.UsuarioNoEncontradoException;
import ar.edu.unq.uis.rankit_android.repo.DataService;


public class LoginActivity extends AppCompatActivity {

    private EditText usuarioET;
    private EditText passwordET;
    private EditText errorMsgET;
    private Button ingresarBtn;
    //Proveedor de datos;
    private DataService data;

    public static final String ID_USER = "id_usuario_logueado";

    public LoginActivity() {
        this.data = DataService.getInstance();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_rankit_login);

        this.usuarioET = (EditText) this.findViewById(R.id.usuario);
        this.passwordET = (EditText) this.findViewById(R.id.password);
        this.ingresarBtn = (Button) this.findViewById(R.id.ingresar);

        this.ingresarBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view){

                String usuario = usuarioET.getText().toString();
                String contrasenia = passwordET.getText().toString();

                iniciarSesion(view, usuario, contrasenia);
            }
        });
    }

    private void iniciarSesion(View view, String usuario, String contrasenia) {
        try {
            int id = this.data.login(usuario, contrasenia);

            Intent intent = new Intent(this, CalificacionesListActivity.class);
            intent.putExtra(ID_USER, id);
            this.startActivity(intent);
        }
        catch(UsuarioNoEncontradoException e){
            Snackbar.make(view, "'usuario' o 'contraseña' ingresados incorrectamente", Snackbar.LENGTH_LONG)
                    .setAction("Action", null).show();
        }
    }
}
