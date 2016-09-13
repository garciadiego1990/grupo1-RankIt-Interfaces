package ar.edu.unq.uis.rankIt.dominio

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdministradorCalificaciones {
 	
	var Administrador admin = new Administrador
	var List<Calificacion> todasLasCalificaciones = new ArrayList<Calificacion>
	
	new(Administrador unAdmin){
		admin = unAdmin
		todasLasCalificaciones = calificacionesDeLugaresYServicios
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
		todasLasCalificaciones.size
		println(todasLasCalificaciones.size)
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
	
	// Va a haber problemas si no encuentra lo que busca
	def Calificacion buscarCalificacion(String usuario, String publicacion) {
		for(Calificacion c: todasLasCalificaciones){
			if(c.evaluador.equals(usuario) && c.evaluado.equals(publicacion)){
				return c
			}	
		}
	}
}
