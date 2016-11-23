package ar.edu.unq.uis.rankit_android;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.repo.DataService;

/**
 * Created by aeentk on 23/11/16.
 */

public abstract class AbstractEdicionCalificacionActivity extends AppCompatActivity {


    protected EditText puntajeET;
    protected TextView tituloTV;
    protected EditText motivoET;
    protected FloatingActionButton guardarFAB;

    protected DataService data;

    protected Integer idUsuario;

    public AbstractEdicionCalificacionActivity() {
        super();
        this.data = DataService.getInstance();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(this.getLayoutVista());

        this.tituloTV = (TextView) this.findViewById(R.id.toolbar_title);
        this.puntajeET = (EditText) this.findViewById(R.id.puntaje_edit);
        this.motivoET = (EditText) this.findViewById(R.id.editar_motivo);

        this.guardarFAB = (FloatingActionButton) this.findViewById(R.id.guardar_edicion_boton);
        this.guardarFAB.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(validosCamposEditables()) {
                    dialogoConfirmarEdicion();
                }
            }
        });

        this.idUsuario = (Integer) this.getIntent().getExtras().getInt(LoginActivity.ID_USER);
    }


    /** Se responde si los campos editables de la vista tienen datos válidos.
     * En caso de ser válidos se responde true; caso contrario se retorna false y se informa en pantalla
     * cuales son los campos erroneos.*/
    private boolean validosCamposEditables() {
        boolean camposValidos = true;
        if(this.puntajeET.getText().length() == 0) {
            camposValidos = false;
            Toast.makeText(this,"Ingrese un puntaje válido",Toast.LENGTH_SHORT).show();
        }
        if(this.motivoET.getText().length() == 0) {
            camposValidos = false;
            Toast.makeText(this,"Ingrese el motivo de la calificación",Toast.LENGTH_SHORT).show();
        }
        return camposValidos;
    }


    /**Al llamar a este método se muestra un diálogo en pantalla consultando al usuario si desea guardar los cambios
     * a la calificación que está siendo mostrada por este activity.
     * En caso de aceptar, la calificación se guarda y se regresa al activity padre;
     * En caso de cancelar la edición, se cierra este diálogo y no se hace nada.*/
    public void dialogoConfirmarEdicion() {
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(this);
        alertDialogBuilder.setMessage(this.getMSGConfirmacion());

        alertDialogBuilder.setPositiveButton("Aceptar",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface arg0, int arg1) {
                        guardarEdicion();
                    }
                });


        alertDialogBuilder.setNegativeButton("Cancelar",
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        //No hacer nada.
                    }
                });

        AlertDialog alertDialog = alertDialogBuilder.create();
        alertDialog.show();
    }


    /**Este método implementa la acción a realizarce al momento de guardarse los cambios realizados a la calificación.*/
    protected abstract void guardarEdicion();


    /** Se retorna el int que representa el layout de la vista de este activity.*/
    protected abstract int getLayoutVista();


    /**Este método retorna el texto a mostrarse en el dialogo de confirmación que se muestra al guardar
     * la edición de la calificación. */
    protected abstract String getMSGConfirmacion();

}
