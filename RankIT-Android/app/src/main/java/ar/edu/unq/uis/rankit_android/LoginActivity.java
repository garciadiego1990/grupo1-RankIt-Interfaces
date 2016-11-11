package ar.edu.unq.uis.rankit_android;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;


public class LoginActivity extends AppCompatActivity {

    private EditText usuarioET;
    private EditText passwordET;
    private EditText errorMsgET;
    private Button ingresarBtn;

    @Override
    protected void onCreate(Bundle savedInstanceState){
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_rankit_login);

        this.errorMsgET = (EditText) this.findViewById(R.id.error_message);
        this.errorMsgET.setVisibility(View.GONE);
        this.usuarioET = (EditText) this.findViewById(R.id.usuario);
        this.passwordET = (EditText) this.findViewById(R.id.password);
        this.ingresarBtn = (Button) this.findViewById(R.id.ingresar);

        this.ingresarBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view){

                String usuario = usuarioET.getText().toString();
                String contraseña = passwordET.getText().toString();

                errorMsgET.setText(usuario+" "+contraseña);
                errorMsgET.setVisibility(View.VISIBLE);
            }
        });
    }
}
