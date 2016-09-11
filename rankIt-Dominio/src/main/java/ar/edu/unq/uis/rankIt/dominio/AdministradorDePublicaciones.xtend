package ar.edu.unq.uis.rankIt.dominio

import java.util.List

class AdministradorDePublicaciones {
	List<Publicacion> servicios
	List<Publicacion> lugares 
	
	
	def agregarServicio(Publicacion p) {
		servicios.add(p)
	}
	
	def serviciosInscriptos() {
		servicios.size
	}

	def serviciosHabilitados() {
		servicios.filter[it.estaHabilitado].size
	}

	def serviciosDeshabilitados() {
		serviciosInscriptos - serviciosHabilitados
	}
	
	def borrarServicio(Publicacion p) {
		servicios.remove(p)
	}
	
	def buscarServicio(Publicacion p) {
		return servicios.filter[it.nombre == p.nombre].get(0)
	}
		
}