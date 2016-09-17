package ar.edu.unq.uis.rankIt.dominio

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Calificacion {
	Integer puntaje
	DateTime fecha
	boolean esOfensiva
	String detalle
	Usuario evaluador
	Publicacion evaluado
	
	new() {
	}
	
	def void calificar(Integer unaCalificacion, Usuario unEvaluador, Publicacion unaPublicacion){
		puntaje = unaCalificacion
		evaluador = unEvaluador
		evaluado = unaPublicacion
		esOfensiva = false
	}
}