package ar.edu.unq.uis.rankit_android;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import ar.edu.unq.uis.rankit_android.repo.DataProvider;

/**
 * Created by aeentk on 18/11/16.
 */
public class CalificacionNuevaActivity extends AppCompatActivity {

    private DataProvider data;

    public CalificacionNuevaActivity() {
        super();
        this.data = DataProvider.getInstance();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_calificacion_nueva);
    }
}
