package ar.edu.unq.uis.rankit_android;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import ar.edu.unq.uis.rankit_android.model.Calificacion;

public class CalificacionDetalleActivity extends AppCompatActivity {

    private TextView puntosLabel;
    private TextView detalleLabel;
    private Calificacion calificacion;

    private Button editarBoton;

    public static final String ARG_ITEM_ID = "item_id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificacion_detalle);

        Toolbar toolbar = (Toolbar) findViewById(R.id.detalle_toolbar);
        setSupportActionBar(toolbar);

        // Show the Up button in the action bar.
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        this.puntosLabel    = (TextView) this.findViewById(R.id.puntos_label);
        this.detalleLabel   = (TextView) this.findViewById(R.id.detalle);

        this.editarBoton = (Button) this.findViewById(R.id.editar_boton);

        this.editarBoton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view){
            editarCalificacion();
            }
        });

        this.calificacion = (Calificacion) this.getIntent().getExtras().getSerializable(ARG_ITEM_ID);

        this.detalleLabel.setText(calificacion.getMotivo());
        this.puntosLabel.setText(calificacion.getPuntaje().toString());
    }



    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();
        if (id == android.R.id.home) {
            // This ID represents the Home or Up button. In the case of this
            // activity, the Up button is shown. For
            // more details, see the Navigation pattern on Android Design:
            //
            // http://developer.android.com/design/patterns/navigation.html#up-vs-back
            //
            navigateUpTo(new Intent(this, CalificacionesListActivity.class));
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    public void editarCalificacion(){
        Intent editarIntent = new Intent(this, CalificacionEditarActivity.class);
        editarIntent.putExtra(CalificacionEditarActivity.ARG_ITEM, this.calificacion);
        Log.w("Calificacion", this.calificacion.getEvaluado());
        this.startActivity(editarIntent);
    }
}
