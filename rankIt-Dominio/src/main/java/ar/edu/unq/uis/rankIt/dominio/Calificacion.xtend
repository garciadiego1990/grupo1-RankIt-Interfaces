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
	
	new(Publicacion publicacion, Usuario evaluador, Integer puntaje, String detalle){
		this.puntaje = puntaje
		this.evaluador = evaluador
		this.evaluado = publicacion
		this.detalle = detalle
	}
	
	def String getNombrePublicacion(){
		evaluado.nombre
	}
	
	def String getNombreUsuario(){
		evaluador.nombre
	}
}
