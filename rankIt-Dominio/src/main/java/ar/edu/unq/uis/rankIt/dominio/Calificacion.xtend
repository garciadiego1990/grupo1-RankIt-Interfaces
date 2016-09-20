package ar.edu.unq.uis.rankIt.dominio

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Calificacion {
	int puntaje
	DateTime fecha = new DateTime
	boolean esOfensiva = false
	String detalle
	Usuario evaluador
	Publicacion evaluado
	
	new() {
		evaluador = new Usuario("ADMIN", Usuario.contraseniaDefault)
		detalle = "prueba"
	}
	
	new(Publicacion publicacion, Usuario evaluador, Integer puntaje, String detalle){
		this.puntaje = puntaje
		this.evaluador = evaluador
		this.evaluado = publicacion
		this.detalle = detalle
		publicacion.agregarCalificacion(this)
	}
	
	def String getNombrePublicacion(){
		evaluado.nombre
	}
	
	def String getNombreUsuario(){
		evaluador.nombre
	}
}