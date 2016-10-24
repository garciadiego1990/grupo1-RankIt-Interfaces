package ar.edu.unq.uis.rankIt.clasesMinificadas

import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CalificacionMinificada {
	
	
	Integer puntaje
	String detalle
	String evaluado
	String evaluador
	Integer id
	String tipo
	Publicacion publicacion
	
	new(){
		super()
	}
	
	new(Integer id, String nombreEvaluador, String nombreEvaluado, Integer puntaje, String detalle, String unTipo) {
		this.id = id
		this.evaluador = nombreEvaluador
		this.evaluado = nombreEvaluado
		this.puntaje = puntaje
		this.detalle = detalle
		this.tipo = unTipo
	}
	
	
	def static List<CalificacionMinificada> generarCalificacionesMinificadas(List<Calificacion> calificaciones) {
		val calificacionesMini = new ArrayList<CalificacionMinificada>()
		for(Calificacion c: calificaciones) {
			calificacionesMini.add = new CalificacionMinificada(c.id, c.evaluador.nombre, c.evaluado.nombre, c.puntaje, c.detalle, c.evaluado.tipo)
		}
		return calificacionesMini
	}
/* 	
	def Calificacion convertir(){
		var Publicacion pp = new Publicacion
		pp.setNombre(this.evaluado)
		var Calificacion c = new Calificacion(pp,null, puntaje, detalle,id)
		return c
	}
*/
}