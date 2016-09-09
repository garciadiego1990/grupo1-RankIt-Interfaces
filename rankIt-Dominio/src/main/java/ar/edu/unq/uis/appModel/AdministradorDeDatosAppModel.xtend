package ar.edu.unq.uis.appModel

import ar.edu.unq.uis.rankIt.dominio.Administrador
import ar.edu.unq.uis.rankIt.dominio.Publicacion


class AdministradorDeDatosAppModel {
	Administrador admin = new Administrador
	
	def int calificacionesRegistradas() {
		this.calificacionesDeServicios + (this.calificacionesDeLugares)
	}

	def int calificacionesDeServicios() {
		var ret = 0
		for (Publicacion p : admin.servicios) {
			ret += p.calificaciones.size
		}
		ret
	}

	def int calificacionesDeLugares() {
		var ret = 0
		for (Publicacion p : admin.lugares) {
			ret += p.calificaciones.size
		}
		ret
	}

	def int lugaresHabilitados() {
		admin.lugares.filter[it|it.estaHabilitado].size
	}

	def int lugaresDeshabilitados() {
		admin.lugares.filter[it|!it.estaHabilitado].size
	}

	def int serviciosHabilitados() {
		admin.servicios.filter[it|it.estaHabilitado].size
	}

	def int serviciosDeshabilitados() {
		return admin.servicios.filter[it|!it.estaHabilitado].size
	}
}