package ar.edu.unq.uis.rankit_android;

import android.content.Context;
import android.view.View;
import android.widget.ArrayAdapter;

import java.util.List;

import ar.edu.unq.uis.rankit_android.model.Evaluado;

/**
 * Created by aeentk on 19/11/16.
 */

public class EvaluadosAdapter extends ArrayAdapter<Evaluado> {

    public EvaluadosAdapter(Context context, List<Evaluado> evaluados) {
        super(context, android.R.layout.simple_spinner_item, evaluados);
    }

    @Override
    public long getItemId(int position) {
        return getItem(position).getId();
    }
/*
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        LayoutInflater inflater = (LayoutInflater) getContext()
                .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View rowView = inflater.inflate(R.layout.pelicula_row, parent, false);
        final Pelicula pelicula = getItem(position);

        TextView tvPelicula = (TextView) rowView.findViewById(R.id.lblPelicula);
        tvPelicula.setText(pelicula.toString());

        TextView tvActores = (TextView) rowView.findViewById(R.id.lblActores);
        tvActores.setText(pelicula.getActores());
        return rowView;
    }*/
}
