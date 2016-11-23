package ar.edu.unq.uis.rankit_android;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Filter;
import android.widget.Filterable;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

import ar.edu.unq.uis.rankit_android.model.Calificacion;
import ar.edu.unq.uis.rankit_android.model.clasesMinificadas.CalificacionMinificada;

/**
 * Created by aee on 11/11/16.
 */
public class CalificacionAdapter extends BaseAdapter implements Filterable {

    /*Lista que guarda todas las calificaciones.*/
    private List<CalificacionMinificada> mCalificaciones;

    /*Lista que guarda todas las calificaciones filtradas por algún parámetro de búsqueda.
    * Es esta lista la que se adaptará a la vista de calificaciones.*/
    private List<CalificacionMinificada> mCalificacionesFiltered;

    private Context mContext;
    private CalificacionListFilter filter;


    public CalificacionAdapter(Context context, List<CalificacionMinificada> calificaciones) {
        this.filter = new CalificacionListFilter();
        this.mContext = context;
        this.mCalificaciones = calificaciones;
        this.mCalificacionesFiltered = new ArrayList<CalificacionMinificada>(this.mCalificaciones);
    }

    @Override
    public int getCount() {
        return this.mCalificacionesFiltered.size();
    }

    @Override
    public CalificacionMinificada getItem(int position) {
        return this.mCalificacionesFiltered.get(position);
    }

    @Override
    public long getItemId(int position){
        return this.getItem(position).getId();
    }

    public Context getContext() {
        return mContext;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent){
        LayoutInflater inflater =
                (LayoutInflater) this.getContext().getSystemService(Context.LAYOUT_INFLATER_SERVICE);

        View rowView = inflater.inflate(R.layout.calificacion_row, parent, false);
        final CalificacionMinificada calificacion = this.getItem(position);

        TextView tvNombreCalificacion = (TextView) rowView.findViewById(R.id.nombreCalificacion);
        tvNombreCalificacion.setText(calificacion.getEvaluado());

        TextView tvMotivoCalificacion = (TextView) rowView.findViewById(R.id.detallePreview);
        tvMotivoCalificacion.setText(calificacion.getDetalle());

        return rowView;
    }


    @Override
    public Filter getFilter(){
        return this.filter;
    }


    private class CalificacionListFilter extends Filter {

        @Override
        protected FilterResults performFiltering(CharSequence constraint) {
            FilterResults results = new FilterResults();

            if(constraint == null || constraint.length() == 0) {
                results.values = new ArrayList<CalificacionMinificada>(mCalificaciones);
                results.count = mCalificaciones.size();
            }
            else {
                ArrayList<CalificacionMinificada> filteredList = new ArrayList<CalificacionMinificada>();
                String aFilter = constraint.toString().toLowerCase();

                for(CalificacionMinificada c: mCalificaciones) {
                    if(c.getEvaluado().toLowerCase().contains(aFilter)) {
                        filteredList.add(c);
                    }
                }
                results.values = filteredList;
                results.count = filteredList.size();
            }

            return results;
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results) {
            mCalificacionesFiltered = (List<CalificacionMinificada>) results.values;
            if(results.count < 0)
                notifyDataSetInvalidated();
            else
                notifyDataSetChanged();
        }
    }
}
