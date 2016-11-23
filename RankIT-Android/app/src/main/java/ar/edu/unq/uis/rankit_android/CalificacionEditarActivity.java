package ar.edu.unq.uis.rankit_android;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.repo.DataService;

/**
 * Created by aee on 15/11/16.
 */
public class CalificacionEditarActivity extends AbstractEdicionCalificacionActivity {

    private Integer idCalificacion;

    public static final String ARG_ITEM_ID = "item_id";


    public CalificacionEditarActivity() {
        super();
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        this.idCalificacion = (Integer) this.getIntent().getExtras().getSerializable(ARG_ITEM_ID);
    }

    @Override
    protected void guardarEdicion() {
        Integer puntaje = Integer.valueOf(this.puntajeET.getText().toString());
        String motivo = this.motivoET.getText().toString();

        this.data.updateCalificacion(this.idUsuario, this.idCalificacion, motivo, puntaje);
        Toast.makeText(this,"La calificacíon a sido editada",Toast.LENGTH_LONG).show();
        this.finish();
    }

    @Override
    protected int getLayoutVista() {
        return R.layout.activity_calificacion_editar;
    }

    @Override
    protected String getMSGConfirmacion() {
        return "¿Desea confirmar la edición de la calificación actual?";
    }


    @Override
    protected void onStart() {
        super.onStart();
        this.cargarCamposDeEdicion(this.idCalificacion);
    }


    /** Dado el id de la calificación a editar, se cargan los campos editables de la calificación en la vista.*/
    private void cargarCamposDeEdicion(Integer id) {
        Calificacion calificacionAEditar = this.data.getCalificacion(id);
        this.tituloTV.setText(calificacionAEditar.getEvaluado());
        this.motivoET.setText(calificacionAEditar.getMotivo());
        this.puntajeET.setText(calificacionAEditar.getPuntaje().toString());
    }

}
