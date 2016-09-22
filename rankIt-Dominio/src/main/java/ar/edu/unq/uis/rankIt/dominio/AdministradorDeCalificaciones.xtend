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
	
//ALTA BAJA MODIFICACION CALIFICACIONES

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
	
	def void cambiarEvaluadoEnCalificacion(Calificacion calificacion, Publicacion nuevoEvaluado) {
		var antiguoEvaluado = calificacion.evaluado
		antiguoEvaluado.eliminarCalificacion(calificacion)
		calificacion.evaluado = nuevoEvaluado
		nuevoEvaluado.agregarCalificacion(calificacion)
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
	
	/** Dado un {@link Usuario} se responde si superó el límite de calificaciones ofensivas.
	 * @author ae */
	def Boolean esOfensivoElUsuario(Usuario usuario) {
		var calificacionesOfensivas = 
			calificaciones.filter[each | each.evaluador.equals(usuario) && each.esOfensiva ].size
		return calificacionesOfensivas > 5
	}

	/** Dado un {@link Usuario} se lo banea si superó el límite de calificaciones ofensivas.
	 * @author ae */
	def banearSiEsOfensivo(Usuario usuario) {
		if(this.esOfensivoElUsuario(usuario))
			usuario.estaBaneado = true
	}

	/** Dado un {@link Usuario} se retorna su calificación más reciente.
	 * @author ae */	
	def Calificacion calificacionMasRecienteDelUsuario(Usuario usuario) {
		var calificacionesDelUsuario =
				this.calificaciones.filter[each | each.evaluador.equals(usuario)].toList
		try {
			calificacionesDelUsuario = calificacionesDelUsuario.sortBy[each | each.fecha ].reverse
			return calificacionesDelUsuario.get(0)
		}
		catch(IndexOutOfBoundsException e) {
			throw new IndexOutOfBoundsException(usuario.nombre+" nunca calificó.")
		}
		
	}

}
