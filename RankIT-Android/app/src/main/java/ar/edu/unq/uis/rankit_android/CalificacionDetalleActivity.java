package ar.edu.unq.uis.rankit_android;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.repo.DataProvider;

public class CalificacionDetalleActivity extends AppCompatActivity {

    private TextView puntajeTV;
    private TextView motivoTV;
    private Button editarBoton;

    private Integer idCalificacion;
    private Integer idUsuario;

    private DataProvider data;

    public static final String ARG_ITEM_ID = "item_id";

    public CalificacionDetalleActivity() {
        super();
        this.data = DataProvider.getInstance();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificacion_detalle);

        Toolbar toolbar = (Toolbar) findViewById(R.id.detalle_toolbar);
        setSupportActionBar(toolbar);

        // Show the Up button in the action bar.
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        this.puntajeTV = (TextView) this.findViewById(R.id.puntos_label);
        this.motivoTV = (TextView) this.findViewById(R.id.detalle);
        this.editarBoton = (Button) this.findViewById(R.id.editar_boton);

        this.editarBoton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                irAEditarCalificacion();
            }
        });

        this.idCalificacion = (Integer) this.getIntent().getExtras().getInt(ARG_ITEM_ID);
        this.idUsuario = (Integer) this.getIntent().getExtras().getInt(LoginActivity.ID_USER);
    }


    @Override
    public void onStart() {
        super.onStart();
        this.mostrarCalificacion();
    }


    private void mostrarCalificacion() {
        Calificacion c = this.data.getCalificacion(this.idCalificacion);
        this.motivoTV.setText(c.getMotivo());
        this.puntajeTV.setText(c.getPuntaje().toString());
    }


    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        int id = item.getItemId();onActivityResult(1,1,null);
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

    public void irAEditarCalificacion(){
        Intent editarIntent = new Intent(this, CalificacionEditarActivity.class);
        editarIntent.putExtra(CalificacionEditarActivity.ARG_ITEM_ID, this.idCalificacion);
        editarIntent.putExtra(LoginActivity.ID_USER, this.idUsuario);

        this.startActivity(editarIntent);
    }
}
