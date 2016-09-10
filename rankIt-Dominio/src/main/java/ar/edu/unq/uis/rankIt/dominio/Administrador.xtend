package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Administrador {
	List<Publicacion> servicios
	List<Publicacion> lugares
	List<Usuario> usuarios

	new() {
		servicios = new ArrayList<Publicacion>
		lugares = new ArrayList<Publicacion>
		usuarios = new ArrayList<Usuario>
	}
	
	// Métodos de servicios
	def void agregarServicio(String nombre) {
		lugares.add(new Publicacion(nombre))
	}
	
	def int serviciosHabilitados() {
		servicios.filter[it|it.estaHabilitado].size
	}

	def int serviciosDeshabilitados() {
		servicios.filter[it|!it.estaHabilitado].size
	}
	
	def void eliminarServicio(String nombreServicio) {
		servicios = servicios.filter[it|it.nombre != nombreServicio].toList
	}
	
	// Métodos de lugares
	def void agregarLugar(String nombre) {
		lugares.add(new Publicacion(nombre))
	}
	
	def void eliminarLugar(String nombreLugar) {
		lugares = lugares.filter[it|it.nombre != nombreLugar].toList
	}
	
	def int lugaresHabilitados() {
		lugares.filter[it.estaHabilitado].size
	}
	
	def int lugaresDeshabilitados() {
		lugares.filter[!it.estaHabilitado].size
	}
	
	
	
	// Métodos de usuario
	def void agregarUsuario(String nombre) {
		usuarios.add(new Usuario(nombre))
	}

	def void eliminarUsuario(String usuario) {
		usuarios = usuarios.filter[it|it.nombre != nombre].toList
	}
}
