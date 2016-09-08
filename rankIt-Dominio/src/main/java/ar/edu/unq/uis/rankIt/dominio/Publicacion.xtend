package ar.edu.unq.uis.rankIt.dominio

import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import java.util.ArrayList

@Accessors
class Publicacion {
	String nombre 
	boolean estaHabilitado 
	Date fechaDeRegistro 
	List<Calificacion> calificaciones = new ArrayList<Calificacion>
 	Date fechaDeCalificacion 
	Usuario evaluador 
	boolean esOfensivo
	
	new() {
	
	}
	
	def void eliminarCalificacion(Calificacion c) {
		this.calificaciones.remove(c)
	} 
	
	 
}