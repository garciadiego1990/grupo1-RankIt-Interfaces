package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Publicacion {
	String nombre
	boolean estaHabilitado
	DateTime fechaDeRegistro
	List<Calificacion> calificaciones
	

	new() {
		fechaDeRegistro = new DateTime
		calificaciones = new ArrayList<Calificacion>
	}

	new(String nombre) {
		estaHabilitado = false
		fechaDeRegistro = new DateTime
		calificaciones = new ArrayList<Calificacion>
		this.nombre = nombre
	}

	def getCalificaciones() {
		calificaciones
	}

	/*	
	 * 	def void calificar(Integer unaCalificacion, Usuario unEvaluador, Publicacion unaPublicacion){
	 * 		var Calificacion c = new Calificacion
	 * 		c.calificar(unaCalificacion, unEvaluador, this)
	 * 		calificaciones.add(c)
	 * 				
	 * 	}
	 */
	def void eliminarCalificacion(Calificacion c) {
		this.calificaciones.remove(c)
	}

	def int cantidadDeEvaluaciones() {
		calificaciones.size
	}

	def double ratingPromedio() {
		if(cantidadDeEvaluaciones>0){
			var suma = calificaciones.fold(0, [acum, calificacion|acum + calificacion.puntaje])
			return suma / cantidadDeEvaluaciones
		}
		else {return 0}
		
		
	}

}
