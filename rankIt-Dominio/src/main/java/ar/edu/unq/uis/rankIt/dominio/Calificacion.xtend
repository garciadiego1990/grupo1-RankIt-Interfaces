package ar.edu.unq.uis.rankIt.dominio

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Calificacion {
	Integer puntaje
	DateTime fecha = new DateTime
	boolean esOfensiva = false
	String detalle
	Usuario evaluador
	Publicacion evaluado
	Integer id
	String tipo
	
	new(Publicacion publicacion, Usuario evaluador, Integer puntaje, String detalle){
		this.puntaje = puntaje
		this.evaluador = evaluador
		this.evaluado = publicacion
		this.detalle = detalle
		this.tipo = publicacion.tipo
	}
	
	def String getNombrePublicacion(){
		evaluado.nombre
	}
	
	def String getNombreUsuario(){
		evaluador.nombre
	}
	
	/** Dada una publicacion se modifica en esta calificación la publicación que esta siendo evaluada.
	 * @author ae */
	def void setEvaluado(Publicacion publicacion) {
		var viejoEvaluado = this.evaluado
		this.evaluado = publicacion
		publicacion.agregarCalificacion(this)
		viejoEvaluado.eliminarCalificacion(this)
	}
}
