package ar.edu.unq.uis.rankIt.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.exceptions.IdDeCalificacionInexistenteException
import ar.edu.unq.uis.rankIt.exceptions.CalificacionCompletadaIncorrectamenteException

@Observable
@Accessors
class AdministradorDeCalificaciones {

	var List<Calificacion> calificaciones
	var int registroId
	// Cargados en el bootsTrap
	var List<Publicacion> servicios
	var List<Publicacion> lugares
	

	new() {
		this.calificaciones = new ArrayList<Calificacion>
		this.servicios = new ArrayList<Publicacion>
		this.lugares = new ArrayList<Publicacion>
		this.actualizarListaDeCalificaciones() // TODO
		this.registroId = 0
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
	def Integer agregarCalificacion(Calificacion calificacion) {
		var evaluado = calificacion.evaluado
		evaluado.agregarCalificacion(calificacion)
		calificacion.id = this.generarNuevoId
		this.actualizarListaDeCalificaciones()
		return calificacion.id
	}
	
	private def generarNuevoId() {
		this.registroId++
		return this.registroId
	}

	def void eliminarCalificacion(Calificacion calificacion) {
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

		for (Publicacion p : publicaciones) {
			this.calificaciones.addAll(p.calificaciones)
		}
	}

	/** Dado un {@link Usuario} se responde si superó el límite de calificaciones ofensivas.
	 * @author ae */
	def Boolean esOfensivoElUsuario(Usuario usuario) {
		var calificacionesOfensivas = calificaciones.filter[each|each.evaluador.equals(usuario) && each.esOfensiva].size
		return calificacionesOfensivas > 5
	}

	/** Dado un {@link Usuario} se lo banea si superó el límite de calificaciones ofensivas.
	 * @author ae */
	def banearSiEsOfensivo(Usuario usuario) {
		if (this.esOfensivoElUsuario(usuario))
			usuario.estaBaneado = true
	}

	/** Dado un {@link Usuario} se retorna su calificación más reciente.
	 * @author ae */
	def Calificacion calificacionMasRecienteDelUsuario(Usuario usuario) {
		var calificacionesDelUsuario = this.calificaciones.filter[each|each.evaluador.equals(usuario)].toList
		try {
			calificacionesDelUsuario = calificacionesDelUsuario.sortBy[each|each.fecha].reverse
			return calificacionesDelUsuario.get(0)
		} catch (IndexOutOfBoundsException e) {
			throw new IndexOutOfBoundsException(usuario.nombre + " nunca calificó.")
		}

	}

	/*
	 * **********************************************************************************
	 *  //////////////////////////////////////////////////////////////////////////////////
	 *  ///////////////////// MÉTODOS AGREGADOS PARA EL SEGUNDO TP //////////////////////
	 *  ////////////////////////////////////////////////////////////////////////////////
	 * *********************************************************************************
	 */

	def List<Calificacion> getCalificacionesDeUsuario(String name) {
		var List<Calificacion> ret = new ArrayList<Calificacion>
		ret = this.calificaciones.filter[c|c.evaluador.nombre.equals(name)].toList
		return ret
	}
	
	def List<Calificacion> getCalificacionesDeUsuario(Integer id) {
		var List<Calificacion> ret = new ArrayList<Calificacion>
		ret = this.calificaciones.filter[c|c.evaluador.id.equals(id)].toList
		return ret
	}
	
	def Calificacion getCalificacionConId(Integer id) {
		for (Calificacion c : calificaciones)
			if (c.id.equals(id))
				return c
		throw new IdDeCalificacionInexistenteException(id.toString)
	}

	def void agregarNuevaCalificacionConValidacion(Calificacion calificacion) {
		if (calificacion.puntaje.equals(null) || calificacion.detalle.equals(null) || calificacion.evaluado == null) {
			throw new CalificacionCompletadaIncorrectamenteException("La Calificacion se encuentra incompleta")
		}
		agregarCalificacion(calificacion)
	}

	def void eliminarCalificacionPorID(Integer id) {
		var Calificacion calificacionEncontrada = this.getCalificacionConId(id)
		this.eliminarCalificacion(calificacionEncontrada)
	}
	
	/*  Si le saco lo que esta comentado, cuando pruebo me tira esta error:
	  HTTP ERROR: 500
      Problem accessing /calificaciones. Reason: Infinite recursion (StackOverflowError) .....
	*/
	// Si uso el agregarCalificacion, tambien sucede lo mismo
	def void agregarCalificacionBis(Calificacion calificacion) {
		//var evaluado = calificacion.evaluado
		//evaluado.agregarCalificacion(calificacion)
		calificaciones.add(calificacion)
	}
		
}
