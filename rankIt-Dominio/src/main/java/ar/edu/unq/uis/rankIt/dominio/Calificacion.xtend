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
	
	new() {
		evaluador = new Usuario("ADMIN")
		detalle = "prueba"
//<<<<<<< HEAD
		puntaje = null
		evaluado= null
//=======
//>>>>>>> 120cc6d034d8187646b9b1597b4761afd2c0c877
	}
	
	def void calificar(Integer unaCalificacion, Usuario unEvaluador, Publicacion unaPublicacion, String det){
		puntaje = unaCalificacion
		evaluador = unEvaluador
		evaluado = unaPublicacion
		detalle = det
		
	}
	
	def String getNombrePublicacion(){
		evaluado.nombre
	}
	
	def String getNombreUsuario(){
		evaluador.nombre
	}
}