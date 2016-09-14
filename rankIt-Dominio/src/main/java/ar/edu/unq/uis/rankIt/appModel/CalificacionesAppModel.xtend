package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Date
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import ar.edu.unq.uis.rankIt.dominio.Calificacion


@Accessors
@Observable
class CalificacionesAppModel {
	AdministradorDeCalificaciones admin
	Calificacion calificacionSeleccionada
	
	// Estoy tratando de subir los cambios
	
	new(AdministradorDeCalificaciones admin) {
		this.admin = admin
	}
	
	def void eliminarCalificacion(){
		admin.eliminarCalificacion(calificacionSeleccionada)
	}
	
	def void nuevaCalificacion(){
		var Calificacion cal = new Calificacion
		admin.agregarCalificacion(cal)
	}
	
	def Integer getCalificacion(){
		calificacionSeleccionada.getPuntaje
	}
	
	def String getUsuario(){
		calificacionSeleccionada.getEvaluador.getNombre
	}
	
	def String getDetalle(){
		calificacionSeleccionada.getDetalle
	}
	
	def Date getFecha(){
		calificacionSeleccionada.getFecha
	}
	
	def String esOfensiva(){
		if(calificacionSeleccionada.esOfensiva){
			"SI"
		}
		else {"NO"}
	}
	
	def Integer getCalificacionesRegistradas(){
		admin.totalDeEvaluaciones
	}
	
	def Integer getCalificacionesOfensivas(){
		admin.calificacionesOfensivas
	}
	
	def String getEvaluado(){
		calificacionSeleccionada.getEvaluado.getNombre
	}
}