package ar.edu.unq.uis.rankit_android;

import android.app.ListFragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;

import ar.edu.unq.uis.rankit_android.dummy.DataDummy;
import ar.edu.unq.uis.rankit_android.model.Calificacion;

/**
 * Created by aee on 11/11/16.
 */
public class CalificacionesListFragment extends ListFragment {

    private EditText searchET;
    private Button searchBTN;
    private CalificacionAdapter adapter;

    public CalificacionesListFragment() {
        super();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.adapter = new CalificacionAdapter(this.getActivity(),
                DataDummy.getInstance().getCalificaciones(null, 10));

        this.setListAdapter(this.adapter);

    }

    public interface Callbacks {
        void onItemSelected(Calificacion calificacion);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.calificaciones_list_fragment, null, false);
    }

    @Override
    public void onActivityCreated(Bundle savedInstanceState){
        super.onActivityCreated(savedInstanceState);

        this.searchET = (EditText) this.getView().findViewById(R.id.busqueda_edittext);
        this.searchBTN = (Button) this.getView().findViewById(R.id.busqueda_boton);

        this.searchBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String text = searchET.getText().toString();
                adapter.getFilter().filter(text);
            }
        });
    }
}
