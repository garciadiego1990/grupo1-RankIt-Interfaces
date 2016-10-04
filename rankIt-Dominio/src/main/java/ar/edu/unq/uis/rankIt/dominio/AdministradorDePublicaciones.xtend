package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AdministradorDePublicaciones {
	List<Publicacion> publicaciones = new ArrayList<Publicacion>
	
	def agregar(Publicacion p){
		publicaciones.add(p)
	}
	
	def inscriptos() {
		publicaciones.size
	}
	
	def habilitados() {
		publicaciones.filter[it.estaHabilitado].size
	}
	
	def todosLosHabilitados() {
		publicaciones.filter[it.estaHabilitado]
	}

	def deshabilitados() {
		inscriptos - habilitados
	}
	
	def borrar(Publicacion p) {
		publicaciones.remove(p)
	}
}