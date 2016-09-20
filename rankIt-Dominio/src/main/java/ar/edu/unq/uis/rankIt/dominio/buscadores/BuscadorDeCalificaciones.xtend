package ar.edu.unq.uis.rankIt.dominio.buscadores

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import ar.edu.unq.uis.rankIt.dominio.Calificacion

@Accessors
@Observable
class BuscadorDeCalificaciones {

	var String nombreUsuarioABuscar
	var String nombrePublicacionABuscar
	var List<Calificacion> calificaciones
	var List<Calificacion> resultados

	new(List<Calificacion> c) {
		calificaciones = c
		nombreUsuarioABuscar = ""
		nombrePublicacionABuscar = ""
		search()
	}

	def setNombrePublicacionABuscar(String nombre) {
		this.nombrePublicacionABuscar = nombre.toLowerCase
		this.search()
	}

	def setNombreUsuarioABuscar(String nombre) {
		this.nombreUsuarioABuscar = nombre.toLowerCase
		this.search()
	}

	def search() {
		this.resultados =	calificaciones.filter[calificacion |
								calificacion.evaluado.nombre.toLowerCase.matches("(.*)"+this.nombrePublicacionABuscar+"(.*)") &&
								calificacion.evaluador.nombre.toLowerCase.matches("(.*)"+this.nombreUsuarioABuscar+"(.*)")
							].toList
		ObservableUtils.firePropertyChanged(this, "resultados")
	}

}

