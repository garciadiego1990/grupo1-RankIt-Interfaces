package ar.edu.unq.uis.rankIt.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdministradorDeCalificaciones {
	
	var List<Calificacion> calificaciones
	//Cargados en el bootsTrap
	var List<Publicacion> servicios
	var List<Publicacion> lugares
	
	new(){
		this.calificaciones = new ArrayList<Calificacion>
		this.servicios	= new ArrayList<Publicacion>
		this.lugares = new ArrayList<Publicacion>
		this.actualizarListaDeCalificaciones()// TODO
	}	

	def int totalCalificaciones() {
		calificaciones.size
	}
	
	// Modificado por recomendacion de Abel
	def int calificacionesOfensivas() {
		calificaciones.filter[esOfensiva].size
	}
	
	/**@author ae */
	def List<Publicacion> getPublicaciones() {
		var List<Publicacion> publicaciones = new ArrayList<Publicacion>
		
		publicaciones.addAll(this.servicios)
		publicaciones.addAll(this.lugares)
		
		return publicaciones
	}	 
	
//ALTA BAJA CALIFICACIONES

	def void agregarCalificacion(Calificacion calificacion){
		var evaluado = calificacion.evaluado
		evaluado.agregarCalificacion(calificacion)
		this.actualizarListaDeCalificaciones()
	}
	
	def void eliminarCalificacion(Calificacion calificacion){
		var evaluado = calificacion.evaluado
		evaluado.eliminarCalificacion(calificacion)
		this.actualizarListaDeCalificaciones()
	}

//ACTUALIZAR CALIFICACIONES EN EL ADMINISTRADOR

	/** Actualizo la lista de calificaciones de este administrador.
	 * Este método debe ser llamado explícitamente cada vez que se hace una inserción o eliminación
	 * de una {@link Calificacion} o {@link Publicacion}.
	 * @author ae */
	def void actualizarListaDeCalificaciones() {
		this.calificaciones.clear()
		var List<Publicacion> publicaciones = new ArrayList<Publicacion>
		
		publicaciones.addAll(servicios)
		publicaciones.addAll(lugares)
		
		for(Publicacion p : publicaciones){
			this.calificaciones.addAll(p.calificaciones)
		}
	}

}
