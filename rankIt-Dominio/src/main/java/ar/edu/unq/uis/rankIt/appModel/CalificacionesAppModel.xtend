package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.ApplicationContext


@Accessors
@Observable
class CalificacionesAppModel {
	AdministradorDeCalificaciones admin
	Calificacion calificacionSeleccionada
	

	new(AdministradorDeCalificaciones admin) {
		this.admin = admin
	}
	
	def DateTime getFecha(){
		calificacionSeleccionada.getFecha
	}
	
	def String getNombreUsuario(){
		calificacionSeleccionada.getEvaluador.getNombre
	}
	
	def String getNombrePublicacion(){
		//calificacionSeleccionada.getEvaluado.getNombre
		"Diego"
	}
	
	def int getPuntaje(){
		calificacionSeleccionada.getPuntaje
	}
	
	def boolean getEsOfensiva(){
		calificacionSeleccionada.esOfensiva
	}
	
	def String getDetalle(){
		calificacionSeleccionada.getDetalle
	}
	
	def int getCalificacionesRegistradas(){
		admin.totalDeEvaluaciones
	}
	
	def int getCalificacionesOfensivas(){
		admin.calificacionesOfensivas
	}
	
	def void setCalificacionSeleccionada(Calificacion c){
		calificacionSeleccionada = c
		ObservableUtils.firePropertyChanged(this,"calificacionesRegistradas")
		ObservableUtils.firePropertyChanged(this,"calificacionesOfensivas")
		
	}
	
	def void crearNuevaCalificacion(){
		admin.calificaciones.add(new Calificacion)
		//buscarCalificaciones()
		actualizarResumen()
		// ObservableUtils.firePropertyChanged(buscador,"calificacionesFiltradas")
	}
	
	def eliminarCalificacionSeleccionada() {
		admin.calificaciones.remove(calificacionSeleccionada)
		//buscarCalificaciones()
		actualizarResumen()
	//	ObservableUtils.firePropertyChanged(buscador,"calificacionesFiltradas")
	}
	
	def void setPublicacionConContenidoOfensivo(boolean value){
		calificacionSeleccionada.esOfensiva = value
		ObservableUtils.firePropertyChanged(this, "calificacionesOfensivas")
	
	}

//PANEL DE EDICION:
//	def String getNombreDeCalificacionSeleccionada() {
//		this.calificacionSeleccionada.nombre
//	}

// METODOS EXPLICITOS DE ACTUALIZACION DE LA VISTA:
//	def void actualizarPanelEdicionUsuario() {
//		ObservableUtils.firePropertyChanged(this, "nombreDeCalificacionSeleccionada")
//	}

	def void actualizarResumen() {
		ObservableUtils.firePropertyChanged(this, "cantidadCalificacionesOfensivas")
		actualizarResumenOfensivas()

	}

	def void actualizarResumenOfensivas() {
		ObservableUtils.firePropertyChanged(this, "cantidadCalificacionesOfensivas")
	}

//CARGO EL APPLICATION CONTEXT
	def AdministradorDeCalificaciones getRepoPublicaciones() {
		ApplicationContext.instance.getSingleton(typeof(AdministradorDeCalificaciones))
	}
/* 	
 
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
	
	*/
}