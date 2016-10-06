package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import com.fasterxml.jackson.databind.annotation.JsonSerialize

@Accessors
@Observable
class Publicacion {
	String nombre
	boolean estaHabilitado
	DateTime fechaDeRegistro
	List<Calificacion> calificaciones
	Integer id
	String tipo

	new() {
		fechaDeRegistro = new DateTime
		calificaciones = new ArrayList<Calificacion>
		nombre = "--"
	}
	
	new(Integer id, String tipo, String nombre) {
		this.id = id
		this.tipo = tipo
		this.nombre = nombre
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
	
	def agregarCalificacion(Calificacion c) {
		calificaciones.add(c)
	} 

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
		else return 0
	}

}
