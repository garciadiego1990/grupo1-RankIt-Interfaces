package ar.edu.unq.uis.rankit_android;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.repo.DataService;

/**
 * Created by aee on 15/11/16.
 */
public class CalificacionEditarActivity extends AppCompatActivity {

    private EditText puntajeET;
    private TextView tituloTV;
    private EditText motivoET;
    private FloatingActionButton guardarFAB;
    private DataService data;

    private Integer idCalificacion;
    private Integer idUsuario;

    public static final String ARG_ITEM_ID = "item_id";

    public CalificacionEditarActivity() {
        super();
        this.data = DataService.getInstance();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_calificacion_editar);

        this.tituloTV = (TextView) this.findViewById(R.id.toolbar_title);
        this.puntajeET = (EditText) this.findViewById(R.id.puntaje_edit);
        this.motivoET = (EditText) this.findViewById(R.id.editar_motivo);

        this.guardarFAB = (FloatingActionButton) this.findViewById(R.id.guardar_edicion_boton);

        this.guardarFAB.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view){
                guardarEdicionCalificacion();
            }
        });

        this.idCalificacion = (Integer) this.getIntent().getExtras().getSerializable(ARG_ITEM_ID);
        this.idUsuario = (Integer) this.getIntent().getExtras().getInt(LoginActivity.ID_USER);
    }


    @Override
    protected void onStart() {
        super.onStart();
        this.mostrarCalificacion(this.idCalificacion);
    }


    private void mostrarCalificacion(Integer id) {
        Calificacion calificacionAEditar = this.data.getCalificacion(id);
        this.tituloTV.setText(calificacionAEditar.getEvaluado());
        this.motivoET.setText(calificacionAEditar.getMotivo());
        this.puntajeET.setText(calificacionAEditar.getPuntaje().toString());
    }


    public void guardarEdicionCalificacion() {
        Integer puntaje = Integer.valueOf(this.puntajeET.getText().toString());
        String motivo = this.motivoET.getText().toString();

        this.data.updateCalificacion(this.idUsuario, this.idCalificacion, motivo, puntaje);
        this.finish();
    }

}