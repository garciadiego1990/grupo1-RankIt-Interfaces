package ar.edu.unq.uis.rankit_android;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;

import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.model.Evaluado;
import ar.edu.unq.uis.rankit_android.repo.DataService;


/**
 * Created by aeentk on 18/11/16.
 */
public class CalificacionNuevaActivity extends AbstractEdicionCalificacionActivity {

    private Spinner evaluadosSPR;

    public CalificacionNuevaActivity() {
        super();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        this.cargarEvaluadosEnSpinner();
    }

    @Override
    protected void guardarEdicion() {
        Evaluado e = (Evaluado) this.evaluadosSPR.getSelectedItem();
        int puntaje = Integer.valueOf(this.puntajeET.getText().toString());
        String motivo = this.motivoET.getText().toString();
        this.data.saveCalificacion(e.getNombre(), puntaje, motivo);

        Toast.makeText(this,"La calificacíon a sido creada",Toast.LENGTH_LONG).show();

        this.finish();
    }

    @Override
    protected int getLayoutVista() {
        return R.layout.activity_calificacion_nueva;
    }

    @Override
    protected String getMSGConfirmacion() {
        return "¿Quiere crear esta calificación?";
    }


    /** Se setean en el spinner de la vista todos los evaluados disponibles.*/
    private void cargarEvaluadosEnSpinner() {
        this.evaluadosSPR = (Spinner) findViewById(R.id.evaluados_spinner);
        ArrayAdapter<Evaluado> adapter = new EvaluadosAdapter(this, this.data.getEvaluados());
        // Specify the layout to use when the list of choices appears
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        // Apply the adapter to the spinner
        this.evaluadosSPR.setAdapter(adapter);
    }

}
