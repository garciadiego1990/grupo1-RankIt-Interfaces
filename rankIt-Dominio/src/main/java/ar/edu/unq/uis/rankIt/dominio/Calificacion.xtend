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
	// Agregado por necesidad del segundo TP
	Integer idCalificacion
	
	new(Publicacion publicacion, Usuario evaluador, Integer puntaje, String detalle){
		this.puntaje = puntaje
		this.evaluador = evaluador
		this.evaluado = publicacion
		this.detalle = detalle
	}
	
	new(Publicacion publicacion, Usuario evaluador, Integer puntaje, String detalle, Integer idN){
		this.puntaje = puntaje
		this.evaluador = evaluador
		this.evaluado = publicacion
		this.detalle = detalle
		idCalificacion = idN
	}
	
	def String getNombrePublicacion(){
		evaluado.nombre
	}
	
	def String getNombreUsuario(){
		evaluador.nombre
	}
	
	def Integer getIdCalificacion(){
		return idCalificacion
	}
	
	def void setEvaluado(Publicacion publicacion) {
		var viejoEvaluado = this.evaluado
		this.evaluado = publicacion
		publicacion.agregarCalificacion(this)
		viejoEvaluado.eliminarCalificacion(this)
	}
}
