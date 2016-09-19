package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AdministradorDePublicaciones {
	List<Publicacion> todo = new ArrayList<Publicacion>
	
	def agregar(Publicacion p){
		todo.add(p)
	}
	
	def inscriptos() {
		todo.size
	}
	
	def habilitados() {
		todo.filter[it.estaHabilitado].size
	}

	def deshabilitados() {
		inscriptos - habilitados
	}
	
	def borrar(Publicacion p) {
		todo.remove(p)
	}
	
	def buscar(Publicacion p) {
		var publicacionesBuscadas = todo.filter[it.nombre == p.nombre]
		if (publicacionesBuscadas.size != 0) return publicacionesBuscadas.get(0)
		else null
	}
	
}