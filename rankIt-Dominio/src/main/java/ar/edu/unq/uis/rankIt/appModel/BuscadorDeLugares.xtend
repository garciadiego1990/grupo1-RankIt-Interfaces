package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.Publicacion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class BuscadorDeLugares{
	var String nombreLugarABuscar
	var List<Publicacion> lugares
	
	
	new(List<Publicacion> lugares) {
		this.lugares = lugares
		this.nombreLugarABuscar = ""
		this.search()
	}
	
	def setNombreLugarABuscar(String nombre) {
		this.nombreLugarABuscar = nombre
		ObservableUtils.firePropertyChanged(this,"lugaresFiltrados")
		this.search()
	}
	
	def search() {
		if(this.nombreLugarABuscar == "" )
			return this.lugares
		else
			return this.lugares.filter[ lugar | lugar.nombre.contains(nombreLugarABuscar)].toList
	}
	
	def List<Publicacion> getLugaresFiltrados(){
		search()
	}
	
}