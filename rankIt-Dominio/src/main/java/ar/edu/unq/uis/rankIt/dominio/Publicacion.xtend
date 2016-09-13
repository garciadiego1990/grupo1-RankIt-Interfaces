package ar.edu.unq.uis.rankIt.dominio

<<<<<<< HEAD
import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
=======

>>>>>>> nicolas
import java.util.List
import java.util.ArrayList
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
@Observable
class Publicacion {
	String nombre 
	boolean estaHabilitado
	Date fechaDeRegistro
	List<Calificacion> calificaciones
 	
	new(String nombre) {
		estaHabilitado = false
		fechaDeRegistro = new Date
		calificaciones = new ArrayList<Calificacion>
		this.nombre = nombre
	}
	
	new() {
		estaHabilitado = false
		fechaDeRegistro = new Date
		calificaciones = new ArrayList<Calificacion>
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
	
<<<<<<< HEAD
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
	 
=======
>>>>>>> nicolas
}