package ar.edu.unq.uis.rankit_android;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.model.Evaluado;
import ar.edu.unq.uis.rankit_android.repo.DataService;


/**
 * Created by aeentk on 18/11/16.
 */
public class CalificacionNuevaActivity extends AppCompatActivity {

    private DataService data;

    private Button guardarBoton;
    private Spinner puntosSPR;
    private Spinner evaluadosSPR;
    private EditText motivoET;

    public CalificacionNuevaActivity() {
        super();
        this.data = DataService.getInstance();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_calificacion_nueva);

        this.guardarBoton = (Button) this.findViewById(R.id.guardar_edicion_boton);
        this.guardarBoton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                guardarCalificacion();
            }
        });

        this.motivoET = (EditText) this.findViewById(R.id.editar_motivo);

        this.bindEvaluadosSpinner();
        this.bindPuntajeSpinner();
    }

    private void bindEvaluadosSpinner() {
        this.evaluadosSPR = (Spinner) findViewById(R.id.evaluados_spinner);
        ArrayAdapter<Evaluado> adapter = new EvaluadosAdapter(this, this.data.getEvaluados());
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        this.evaluadosSPR.setAdapter(adapter);
    }

    private void bindPuntajeSpinner() {
        this.puntosSPR = (Spinner) this.findViewById(R.id.puntaje_spinner);
        // Create an ArrayAdapter using the string array and a default spinner layout
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(this,
                R.array.puntos_array, android.R.layout.simple_spinner_item);
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        this.puntosSPR.setAdapter(adapter);
    }

    public void guardarCalificacion(){
        Evaluado e = (Evaluado) this.evaluadosSPR.getSelectedItem();
        int puntaje = Integer.valueOf(this.puntosSPR.getSelectedItem().toString());
        String motivo = this.motivoET.getText().toString();
        this.data.saveCalificacion(e.getNombre(), puntaje, motivo);

        this.finish();
    }
}
