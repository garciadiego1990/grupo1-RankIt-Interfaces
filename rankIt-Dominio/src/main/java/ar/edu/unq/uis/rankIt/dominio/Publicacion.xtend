package ar.edu.unq.uis.rankIt.dominio

import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList

@Observable
@Accessors
class Publicacion {
	String nombre 
	boolean estaHabilitado = true
	Calendar fechaDeRegistro = Calendar.getInstance()
	List<Calificacion> calificaciones = new ArrayList<Calificacion>
 	
	new(String unNombre) {
		nombre = unNombre
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