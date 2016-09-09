package ar.edu.unq.uis.rankIt.dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Calificacion {
	Integer puntaje
	Date fecha
	boolean esOfensiva
	String detalle
	Usuario evaluador
	
	new() {
	}
	
	def void calificar(Integer unaCalificacion){
		puntaje = unaCalificacion
	}
}