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
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.CalificacionMinificada;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.LogUsuario;
import ar.edu.unq.uis.rankit_android.model.myApy.MyApiEndpointInterface;
import ar.edu.unq.uis.rankit_android.model.myService.ServiceGenerator;
import ar.edu.unq.uis.rankit_android.repo.DataService;
import okhttp3.ResponseBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by aee on 15/11/16.
 */
public class CalificacionEditarActivity extends AbstractEdicionCalificacionActivity {

    private CalificacionMinificada calificacion;

    public static final String ARG_ITEM_ID = "item_id";


    public CalificacionEditarActivity() {
        super();
    }


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        this.calificacion = (CalificacionMinificada) this.getIntent().getExtras().getSerializable(ARG_ITEM_ID);
    }

    @Override
    protected void guardarEdicion() {
        Integer puntaje = Integer.valueOf(this.puntajeET.getText().toString());
        String motivo = this.motivoET.getText().toString();

        MyApiEndpointInterface client = ServiceGenerator.createService(MyApiEndpointInterface.class);

        this.calificacion.setDetalle(motivoET.getText().toString());
        this.calificacion.setPuntaje(Integer.valueOf(puntajeET.getText().toString()));

        Call<ResponseBody> call =
                client.editar(calificacion);

        call.enqueue(new Callback<ResponseBody>() {
            @Override
            public void onResponse(Call<ResponseBody> call, Response<ResponseBody> response) {

                onSucces();

            }

            @Override
            public void onFailure(Call<ResponseBody> call, Throwable t) {
                onFailed();
                t.printStackTrace();
            }
        });
    }



    private void onSucces() {
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

    private void onFailed() {
        Toast.makeText(this,"La calificacíon a sido editada",Toast.LENGTH_LONG).show();
    }


    @Override
    protected void onStart() {
        super.onStart();
        this.cargarCamposDeEdicion(calificacion);
    }


    /** Dado el id de la calificación a editar, se cargan los campos editables de la calificación en la vista.*/
    private void cargarCamposDeEdicion(CalificacionMinificada calificacionAEditar) {
        this.tituloTV.setText(calificacionAEditar.getEvaluado());
        this.motivoET.setText(calificacionAEditar.getDetalle());
        this.puntajeET.setText(calificacionAEditar.getPuntaje().toString());
    }

}
