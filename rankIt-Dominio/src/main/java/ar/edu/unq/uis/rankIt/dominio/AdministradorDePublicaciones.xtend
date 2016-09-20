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

	def deshabilitados() {
		inscriptos - habilitados
	}
	
	def borrar(Publicacion p) {
		publicaciones.remove(p)
	}
	
	//TODO: publicaciones: Creo que esto no es necesario ya que de las búsquedas se encarga otro objeto.
	//No lo borro por que no sé si se usa en otro lado.	- Abel
	def buscar(Publicacion p) {
		var publicacionesBuscadas = publicaciones.filter[it.nombre == p.nombre]
		if (publicacionesBuscadas.size != 0) return publicacionesBuscadas.get(0)
		else null
	}
	
}