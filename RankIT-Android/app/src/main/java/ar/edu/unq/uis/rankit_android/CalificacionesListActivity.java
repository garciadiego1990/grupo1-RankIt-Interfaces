package ar.edu.unq.uis.rankit_android;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import ar.edu.unq.uis.rankit_android.model.Calificacion;

public class CalificacionesListActivity extends AppCompatActivity implements CalificacionesListFragment.Callbacks {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificaciones_list);

    }

    @Override
    public void onItemSelected(Calificacion calificacion) {
        Intent detalleIntent = new Intent(this, CalificacionDetalleActivity.class);
        detalleIntent.putExtra(CalificacionDetalleActivity.ARG_ITEM_ID, calificacion.getId());
        startActivity(detalleIntent);
    }
}
