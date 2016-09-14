package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Publicacion {
	String nombre 
	boolean estaHabilitado
	Date fechaDeRegistro
	List<Calificacion> calificaciones
 	
	
	new() {
		estaHabilitado = false
		fechaDeRegistro = new Date
		calificaciones = new ArrayList<Calificacion>
	}
	
	new(String nombre) {
		estaHabilitado = false
		fechaDeRegistro = new Date
		calificaciones = new ArrayList<Calificacion>
		this.nombre = nombre
	}
	
	def getCalificaciones(){
		calificaciones
	}
/*	
	def void calificar(Integer unaCalificacion, Usuario unEvaluador, Publicacion unaPublicacion){
		var Calificacion c = new Calificacion
		c.calificar(unaCalificacion, unEvaluador, this)
		calificaciones.add(c)
				
	}
*/
	def void eliminarCalificacion(Calificacion c) {
		this.calificaciones.remove(c)
	} 
	

	def Integer cantidadDeEvaluaciones(){
		calificaciones.size
	}
	
	def Integer ratingPromedio(){
		var ret = 0
		for(Calificacion c:calificaciones){
			ret = ret + c.puntaje
		}
	return ret/cantidadDeEvaluaciones 
	}
	 
}