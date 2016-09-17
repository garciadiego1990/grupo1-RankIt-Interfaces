package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.Publicacion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class BuscadorDePublicaciones{
	var String nombrePublicacionABuscar
	var List<Publicacion> publicaciones
	
	
	new(List<Publicacion> lugares) {
		this.publicaciones = lugares
		this.nombrePublicacionABuscar = ""
		this.search()
	}
	
	def setNombrePublicacionABuscar(String nombre) {
		this.nombrePublicacionABuscar = nombre
		ObservableUtils.firePropertyChanged(this,"publicacionesFiltradas")
		this.search()
	}
	
	def search() {
		if(nombrePublicacionABuscar == "" )
			publicaciones
		else
			publicaciones.filter[ publicacion | publicacion.nombre.contains(nombrePublicacionABuscar)].toList
	}
	
	def List<Publicacion> getPublicacionesFiltradas(){
		search()
	}
	
}