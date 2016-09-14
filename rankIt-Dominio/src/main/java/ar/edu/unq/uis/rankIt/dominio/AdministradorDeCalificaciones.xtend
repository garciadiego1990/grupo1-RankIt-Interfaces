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
	
	new() {
		
	}	
	
	def agregarCalificacion(Calificacion c) {
		calificaciones.add(c)
	}
	
	def List<Calificacion> calificacionesDeLugaresYServicios() {
		var List<Publicacion> publicaciones = new ArrayList<Publicacion>
		var List<Calificacion> todasLasCalificaciones= new ArrayList<Calificacion>
		publicaciones.addAll(admin.lugares)
		publicaciones.addAll(admin.servicios)
	
		for(Publicacion p : publicaciones){
			todasLasCalificaciones.addAll(p.calificaciones)
		}
	todasLasCalificaciones
	}
	
	def int totalDeEvaluaciones() {
		calificacionesDeLugaresYServicios.size
	}
	
	def int calificacionesOfensivas() {
		var calificacionesOfensivas = 0
		var List<Calificacion> todasLasCalificaciones = calificacionesDeLugaresYServicios()
		for (Calificacion c : todasLasCalificaciones) {
			if(c.esOfensiva) {
				calificacionesOfensivas++
			}
		}
		calificacionesOfensivas
	}
	
	// Va a haber problemas si no encuentra lo que busca
	def Calificacion buscarCalificacion(String usuario, String publicacion) {
		var List<Calificacion> todasLasCalificaciones = calificacionesDeLugaresYServicios()
		for(Calificacion c: todasLasCalificaciones){
			if(c.evaluador.equals(usuario) && c.evaluado.equals(publicacion)){
				return c
			}	
		}
	}
	def void eliminarCalificacion(Calificacion c){
		//
	}	 
}
