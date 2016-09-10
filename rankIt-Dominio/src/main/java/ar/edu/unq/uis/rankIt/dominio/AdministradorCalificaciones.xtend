package ar.edu.unq.uis.rankIt.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AdministradorCalificaciones {
	var Administrador admin = new Administrador
	var List<Calificacion> todasLasCalificaciones = new ArrayList<Calificacion>
	
	new(){}
	
	def void setTodasLasCalificaciones(){
		calificacionesDeLugaresYServicios
	}
	
	def void calificacionesDeLugaresYServicios() {
		var List<Publicacion> publicaciones = new ArrayList<Publicacion>
		publicaciones.addAll(admin.lugares)
		publicaciones.addAll(admin.servicios)
	
		for(Publicacion p : publicaciones){
			todasLasCalificaciones.addAll(p.calificaciones)
		}
	}
	
	def int totalDeEvaluaciones() {
		todasLasCalificaciones.size
	}
	
	def int calificacionesOfensivas() {
		var calificacionesOfensivas = 0
		for (Calificacion c : todasLasCalificaciones) {
			if(c.esOfensiva) {
				calificacionesOfensivas++
			}
		}
		calificacionesOfensivas
	}
	
	def Calificacion buscarCalificacion(String usuario, String publicacion) {
		
		
		
	}

}
