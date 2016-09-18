package ar.edu.unq.uis.rankIt.appModel

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

	new(List<Calificacion> c) {
		calificaciones = c
		nombreUsuarioABuscar = ""
		nombrePublicacionABuscar = ""
		search()
	}

	def setNombrePublicacionABuscar(String nombre) {
		nombrePublicacionABuscar = nombre
		ObservableUtils.firePropertyChanged(this, "calificacionesFiltradas")
		search()
	}

	def setNombreUsuarioABuscar(String nombre) {
		nombreUsuarioABuscar = nombre
		ObservableUtils.firePropertyChanged(this, "calificacionesFiltradas")
		search()
	}

	def search() {
		if (nombrePublicacionABuscar == "" && nombreUsuarioABuscar == "") {
			calificaciones
		} else {
			calificaciones.filter[calificacion|calificacion.evaluado.nombre.contains(nombrePublicacionABuscar)].toList
			calificaciones.filter[calificacion|calificacion.evaluado.nombre.contains(nombreUsuarioABuscar)].toList
		}

	}

	def List<Calificacion> getCalificacionesFiltradas() {
		search()
	}

}

