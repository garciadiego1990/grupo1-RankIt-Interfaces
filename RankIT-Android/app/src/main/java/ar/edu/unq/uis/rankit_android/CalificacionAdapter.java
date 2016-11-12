package ar.edu.unq.uis.rankit_android;

import android.app.Activity;
import android.content.Context;
import android.database.DataSetObserver;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import java.util.List;

import ar.edu.unq.uis.rankit_android.model.Calificacion;

/**
 * Created by aee on 11/11/16.
 */
public class CalificacionAdapter extends ArrayAdapter<Calificacion> {

    public CalificacionAdapter(Context context, List<Calificacion> calificaciones) {
        super(context, R.layout.calificacion_row, calificaciones);
    }

    @Override
    public long getItemId(int position){
        return this.getItem(position).getId();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){
        LayoutInflater inflater =
                (LayoutInflater) this.getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View rowView = inflater.inflate(R.layout.calificacion_row, parent, false);
        final Calificacion calificacion = this.getItem(position);

        TextView tvCalificacion = (TextView) rowView.findViewById(R.id.nombreCalificacion);
        tvCalificacion.setText(calificacion.getNombre());

        return rowView;
    }
}
