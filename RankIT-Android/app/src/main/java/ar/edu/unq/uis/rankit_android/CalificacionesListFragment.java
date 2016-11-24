package ar.edu.unq.uis.rankit_android;

import android.app.ListFragment;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.EditorInfo;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.TextView;

import java.util.List;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.CalificacionMinificada;
import ar.edu.unq.uis.rankit_android.model.myApy.MyApiEndpointInterface;
import ar.edu.unq.uis.rankit_android.model.myService.ServiceGenerator;
import ar.edu.unq.uis.rankit_android.repo.DataService;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * Created by aee on 11/11/16.
 */
public class CalificacionesListFragment extends ListFragment {

    private EditText searchET;
    private ImageButton searchBTN;
    private CalificacionAdapter adapter;
    //Proveedor de datos:
    private DataService data;
    private Integer idUsuario;

    public CalificacionesListFragment() {
        super();
        this.data = DataService.getInstance();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        this.idUsuario = this.getActivity().getIntent().getExtras().getInt(LoginActivity.ID_USER);

        buscarCalificacionesDeUsuario(this.idUsuario);

    }

    private void buscarCalificacionesDeUsuario(Integer idUsuario) {

        MyApiEndpointInterface client = ServiceGenerator.createService(MyApiEndpointInterface.class);

        Call<List<CalificacionMinificada>> call =
                client.calificaciones(idUsuario.toString());

        call.enqueue(new Callback<List<CalificacionMinificada>>() {
            @Override
            public void onResponse(Call<List<CalificacionMinificada>> call, Response<List<CalificacionMinificada>> response) {

                mostrarCalificaciones(response.body());

            }

            @Override
            public void onFailure(Call<List<CalificacionMinificada>> call, Throwable t) {
            }
        });
    }

    private void mostrarCalificaciones(List<CalificacionMinificada> calificaciones) {
        this.adapter = new CalificacionAdapter(this.getActivity(), calificaciones);
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
        this.searchET.setOnEditorActionListener(new TextView.OnEditorActionListener() {
            @Override
            /**En caso de apretar el botón DONE del teclado dispara la busqueda.*/
            public boolean onEditorAction(TextView v, int actionId, KeyEvent event) {
                if (actionId == EditorInfo.IME_ACTION_DONE && event == null) {
                    buscar();
                    return true;
                }
                return false;
            }
        });

        this.searchBTN = (ImageButton) this.getView().findViewById(R.id.busqueda_boton);
        this.searchBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                buscar();
            }
        });
    }

    /** Se dispara la búsqueda buscando calificaciones cuyo nombre contenga el patrón de text extraido del
     * campo de búsqueda de la vista.*/
    public void buscar() {
        String text = searchET.getText().toString();
        adapter.getFilter().filter(text);
    }


    @Override
    public void onStart() {
        super.onStart();
        //Actualiza la lista cada vez que el activity esta por estar visible.
        this.buscar();
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
