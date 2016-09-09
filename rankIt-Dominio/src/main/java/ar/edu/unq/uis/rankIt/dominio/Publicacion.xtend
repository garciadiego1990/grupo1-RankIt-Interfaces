package ar.edu.unq.uis.rankIt.dominio

import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import java.util.ArrayList

@Accessors
class Publicacion {
	String nombre 
	boolean estaHabilitado = true // No se para que sirve este campo
	Calendar fechaDeRegistro = Calendar.getInstance()
	List<Calificacion> calificaciones = new ArrayList<Calificacion>
 	
	new() {
	
	}
	
	def getCalificaciones(){
		calificaciones
	}
	
	def void eliminarCalificacion(Calificacion c) {
		this.calificaciones.remove(c)
	} 
	
	 
}