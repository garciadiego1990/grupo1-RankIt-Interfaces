package ar.edu.unq.uis.rankit_android;

import android.app.ListFragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.List;

import ar.edu.unq.uis.rankit_android.repo.DataDummy;
import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.repo.DataProvider;

/**
 * Created by aee on 11/11/16.
 */
public class CalificacionesListFragment extends ListFragment {

    private EditText searchET;
    private Button searchBTN;
    private CalificacionAdapter adapter;
    //Proveedor de datos:
    private DataProvider data;
    private Integer idUsuario;

    public CalificacionesListFragment() {
        super();
        this.data = DataProvider.getInstance();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        this.idUsuario = savedInstanceState.getInt(LoginActivity.ID_USER);

        List<Calificacion> calificacionesDelUsuario = this.data.getCalificaciones(this.idUsuario);
        this.adapter = new CalificacionAdapter(this.getActivity(), calificacionesDelUsuario);
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


    @Override
    public void onStart() {
        super.onStart();
        adapter.notifyDataSetChanged();
    }


    @Override
    public void onListItemClick(ListView listView, View view, int position, long id) {
        super.onListItemClick(listView, view, position, id);

        Calificacion calificacion = (Calificacion) this.getListAdapter().getItem(position);
        Callbacks callbacks = (Callbacks) this.getActivity();
        callbacks.onItemSelected(calificacion);
    }
}
