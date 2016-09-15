package ar.edu.unq.uis.rankIt.dominio

import java.util.List

class AdministradorDePublicaciones {
	List<Publicacion> todo
	
	def getTodo(){
		todo
	}
	
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
		return todo.filter[it.nombre == p.nombre].get(0)
	}
	
	
}