package ar.edu.unq.uis.rankit_android;

import android.app.Activity;
import android.content.Context;
import android.database.DataSetObserver;
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
import ar.edu.unq.uis.rankit_android.repo.DataProvider;

/**
 * Created by aee on 11/11/16.
 */
public class CalificacionAdapter extends BaseAdapter implements Filterable {

    /*Lista que guarda todas las calificaciones.*/
    private List<Calificacion> mCalificaciones;

    /*Lista que guarda todas las calificaciones filtradas por algún parámetro de búsqueda.
    * Es esta lista la que se adaptará a la vista de calificaciones.*/
    private List<Calificacion> mCalificacionesFiltered;

    private Context mContext;
    private CalificacionListFilter filter;


    public CalificacionAdapter(Context context, List<Calificacion> calificaciones) {
        this.filter = new CalificacionListFilter();
        this.mContext = context;
        this.mCalificaciones = calificaciones;
        this.mCalificacionesFiltered = new ArrayList<Calificacion>(this.mCalificaciones);
    }

    @Override
    public int getCount() {
        return this.mCalificacionesFiltered.size();
    }

    @Override
    public Calificacion getItem(int position) {
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
        final Calificacion calificacion = this.getItem(position);

        TextView tvNombreCalificacion = (TextView) rowView.findViewById(R.id.nombreCalificacion);
        tvNombreCalificacion.setText(calificacion.getEvaluado());

        TextView tvMotivoCalificacion = (TextView) rowView.findViewById(R.id.detallePreview);
        tvMotivoCalificacion.setText(calificacion.getMotivo());

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
                results.values = new ArrayList<Calificacion>(mCalificaciones);
                results.count = mCalificaciones.size();
            }
            else {
                ArrayList<Calificacion> filteredList = new ArrayList<Calificacion>();
                String aFilter = constraint.toString().toLowerCase();

                for(Calificacion c: mCalificaciones) {
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
            mCalificacionesFiltered = (List<Calificacion>) results.values;
            if(results.count < 0)
                notifyDataSetInvalidated();
            else
                notifyDataSetChanged();
        }
    }
}
