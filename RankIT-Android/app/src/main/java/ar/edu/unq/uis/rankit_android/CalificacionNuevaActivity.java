package ar.edu.unq.uis.rankit_android;

import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AppCompatActivity;

import android.support.v7.widget.Toolbar;
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

    private FloatingActionButton guardarBoton;
    private EditText puntosET;
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


        this.guardarBoton = (FloatingActionButton) this.findViewById(R.id.guardar_edicion_boton);
        this.guardarBoton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                guardarCalificacion();
            }
        });

        this.puntosET = (EditText) this.findViewById(R.id.puntaje_edit);
        this.motivoET = (EditText) this.findViewById(R.id.editar_motivo);

        this.bindEvaluadosSpinner();
    }

    private void bindEvaluadosSpinner() {
        this.evaluadosSPR = (Spinner) findViewById(R.id.evaluados_spinner);
        ArrayAdapter<Evaluado> adapter = new EvaluadosAdapter(this, this.data.getEvaluados());
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        this.evaluadosSPR.setAdapter(adapter);
    }

    public void guardarCalificacion(){
        Evaluado e = (Evaluado) this.evaluadosSPR.getSelectedItem();
        int puntaje = Integer.valueOf(this.puntosET.getText().toString());
        String motivo = this.motivoET.getText().toString();
        this.data.saveCalificacion(e.getNombre(), puntaje, motivo);

        this.finish();
    }
}
