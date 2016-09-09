package ar.edu.unq.uis.appModel

import ar.edu.unq.uis.rankIt.dominio.Administrador
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Publicacion

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AdminCalificacionesAppModel {
	var Administrador admin = new Administrador
	var List<Calificacion> todasLasCalificaciones = new ArrayList<Calificacion>
	
	new(){}
	
	def void lugaresYServicios() {
		for(Publicacion p : admin.lugares){
			todasLasCalificaciones.addAll(p.calificaciones)
		}
		for(Publicacion p: admin.servicios){
			todasLasCalificaciones.addAll(p.calificaciones)
		}
	}
}
