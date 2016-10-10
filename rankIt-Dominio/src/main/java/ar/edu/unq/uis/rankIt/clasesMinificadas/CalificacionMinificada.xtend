package ar.edu.unq.uis.rankIt.clasesMinificadas

import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Publicacion

class CalificacionMinificada {
	// No se informa el puntaje, el motivo de la puntuación, el evaluado o el id de calificación modificada
	Integer puntaje
	String detalle
	String nombreDelEvaluado
	Integer idCalificacionMinificada
	
	
	def Calificacion convertir(){
		var Publicacion pp = new Publicacion
		pp.setNombre(nombreDelEvaluado)
		var Calificacion c = new Calificacion(pp,null, puntaje, detalle,idCalificacionMinificada)
		return c
	}

}