package ar.edu.unq.uis.rankit_android;

import android.content.Intent;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v4.app.Fragment;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.CalificacionMinificada;

public class CalificacionesListActivity extends AppCompatActivity implements CalificacionesListFragment.Callbacks {

    private Integer idUsuario;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_calificaciones_list);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.nueva_calificacion);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                crearCalificaccion();
            }
        });

        this.idUsuario = Integer.valueOf(this.getIntent().getExtras().getSerializable(LoginActivity.ID_USER).toString());

        Bundle arguments = new Bundle();
        arguments.putSerializable(CalificacionesListFragment.ARG_ITEM_ID,
                this.idUsuario);
        Fragment fragment = new CalificacionesListFragment();
        fragment.setArguments(arguments);
        getSupportFragmentManager().beginTransaction()
                .add(R.id.calificaciones_fragment, fragment)
                .commit();
    }

    private void crearCalificaccion() {
        Intent i = new Intent(this, CalificacionNuevaActivity.class);
        i.putExtra(LoginActivity.ID_USER, this.idUsuario);

        this.startActivity(i);
    }

    @Override
    public void onItemSelected(CalificacionMinificada calificacion) {
        Intent i = new Intent(this, CalificacionDetalleActivity.class);
        i.putExtra(CalificacionDetalleActivity.ARG_ITEM_ID, calificacion);
        i.putExtra(LoginActivity.ID_USER, this.idUsuario);

        this.startActivity(i);
    }
}
