package ar.edu.unq.uis.rankIt.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable


@Observable
@Accessors
class AdministradorDeCalificaciones {
	AdministradorDePublicaciones admin = new AdministradorDePublicaciones
	List<Calificacion> calificaciones = new ArrayList<Calificacion>		
	
	def agregarCalificacion(Calificacion c) {
		calificaciones.add(c)
	}
	
	def List<Calificacion> calificacionesDeLugaresYServicios() {
		var List<Publicacion> publicaciones = new ArrayList<Publicacion>
		var List<Calificacion> todasLasCalificaciones= new ArrayList<Calificacion>
		publicaciones.addAll(admin.todo)
		todasLasCalificaciones.addAll(calificaciones)
	
		for(Publicacion p : publicaciones){
			todasLasCalificaciones.addAll(p.calificaciones)
		}
		todasLasCalificaciones
	}
	
	def totalCalificaciones() {
		calificaciones.size
	}
	
	def calificacionesOfensivas() {
		calificaciones.filter[esOfensiva].size
	}
	
	// Va a haber problemas si no encuentra lo que busca
	def Calificacion buscarCalificacion(String usuario, String publicacion) {
		var List<Calificacion> todasLasCalificaciones = calificacionesDeLugaresYServicios()
		for(Calificacion c: todasLasCalificaciones){
			if(c.evaluador.equals(usuario) && c.evaluado.equals(publicacion)) return c		
		}
	}
	def void eliminarCalificacion(Calificacion c){
		//
	}	 
}
