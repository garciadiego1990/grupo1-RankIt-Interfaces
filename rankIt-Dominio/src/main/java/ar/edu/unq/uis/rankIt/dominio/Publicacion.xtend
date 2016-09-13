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
	
	def void eliminarCalificacion(Calificacion c) {
		this.calificaciones.remove(c)
	} 
	
}