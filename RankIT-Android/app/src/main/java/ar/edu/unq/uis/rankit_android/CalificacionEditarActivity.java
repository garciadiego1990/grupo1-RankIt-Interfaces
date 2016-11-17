package ar.edu.unq.uis.rankit_android;

import android.os.Bundle;
import android.preference.EditTextPreference;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import ar.edu.unq.uis.rankit_android.dummy.DataDummy;
import ar.edu.unq.uis.rankit_android.model.Calificacion;

/**
 * Created by aee on 15/11/16.
 */
public class CalificacionEditarActivity extends AppCompatActivity {

    private EditText puntajeET;
    private EditText motivoET;
    private Button guardarBTN;

    private Integer idCalificacion;

    public static final String ARG_ITEM_ID = "item_id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_calificacion_editar);

        this.puntajeET = (EditText) this.findViewById(R.id.puntos);
        this.motivoET = (EditText) this.findViewById(R.id.editar_motivo);

        this.guardarBTN = (Button) this.findViewById(R.id.guardar_edicion_boton);

        this.guardarBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view){
                guardarEdicionCalificacion();
            }
        });

        this.idCalificacion = (Integer) this.getIntent().getExtras().getSerializable(ARG_ITEM_ID);
    }


    @Override
    protected void onStart() {
        super.onStart();
        this.mostrarCalificacion(this.idCalificacion);
    }


    private void mostrarCalificacion(Integer id) {
        Calificacion calificacionAEditar = DataDummy.getInstance().getCalificacion(id);

        this.motivoET.setText(calificacionAEditar.getMotivo());
        this.puntajeET.setText(calificacionAEditar.getPuntaje().toString());
    }


    public void guardarEdicionCalificacion() {
        Integer puntaje = Integer.valueOf(this.puntajeET.getText().toString());
        String motivo = this.motivoET.getText().toString();

        DataDummy.getInstance().updateCalificacion( this.idCalificacion,
                                                    motivo,
                                                    puntaje);
        this.finish();
    }

}
