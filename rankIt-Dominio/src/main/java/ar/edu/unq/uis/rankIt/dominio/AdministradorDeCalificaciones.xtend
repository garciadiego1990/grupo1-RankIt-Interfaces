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
	
	new(){}	

	
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
	
	def int totalCalificaciones() {
		calificaciones.size
	}
	
	def int calificacionesOfensivas() {
		if(calificaciones.size == 0){
			return 0
		}
		else {calificaciones.filter[esOfensiva].size}
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
	
	def List<String> getNombrePublicaciones(){
		var List<String> ret = new ArrayList<String>()
		
		for(Calificacion c: calificaciones){
			ret.add(c.evaluado.nombre)
		}
		
		return ret 
		
	}	 
}
