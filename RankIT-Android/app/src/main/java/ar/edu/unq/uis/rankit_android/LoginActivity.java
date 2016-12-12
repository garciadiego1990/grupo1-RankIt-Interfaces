package ar.edu.unq.uis.rankit_android;

import android.content.Intent;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.DatosUsuario;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.LogUsuario;
import ar.edu.unq.uis.rankit_android.model.exceptions.UsuarioNoEncontradoException;
import ar.edu.unq.uis.rankit_android.model.myApy.MyApiEndpointInterface;
import ar.edu.unq.uis.rankit_android.model.myService.ServiceGenerator;
import ar.edu.unq.uis.rankit_android.repo.DataService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


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
                ingresar(view);
            }
        });
    }

    public void ingresar(View view) {
        EditText usuarioText = (EditText) findViewById(R.id.usuario);
        EditText passText = (EditText) findViewById(R.id.password);

        DatosUsuario usuario = new DatosUsuario();
        usuario.setUsuario(usuarioText.getText().toString());

        EditText passwordText = (EditText) findViewById(R.id.password);
        usuario.setPassword(passwordText.getText().toString());

        try {

            MyApiEndpointInterface client = ServiceGenerator.createService(MyApiEndpointInterface.class);


            Call<LogUsuario> call =
                    client.logInUsuario(usuario);

            call.enqueue(new Callback<LogUsuario>() {
                @Override
                public void onResponse(Call<LogUsuario> call, Response<LogUsuario> response) {

                    pantallaCalificacionDelUsuario(response.body());

                }


                @Override
                public void onFailure(Call<LogUsuario> call, Throwable t) {
                    onFailed();
                    t.printStackTrace();
                }
            });


        }
        catch(UsuarioNoEncontradoException e){
            Snackbar.make(view, "'usuario' o 'contraseña' ingresados incorrectamente", Snackbar.LENGTH_LONG)
                    .setAction("Action", null).show();
        }


    }

    private void onFailed() {
        Toast.makeText(this, "Pobre usuario que no le funciona la app", Toast.LENGTH_LONG).show();
    }

    private void pantallaCalificacionDelUsuario(LogUsuario usuarioLogueado) {
        Intent intent = new Intent(this, CalificacionesListActivity.class);
        intent.putExtra(ID_USER, usuarioLogueado.getId());
        startActivity(intent);
    }


}
