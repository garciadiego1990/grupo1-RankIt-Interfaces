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

	def void agregarServicio(String nombre) {
		var servicio = new Publicacion(nombre)
		servicios.add(servicio)
	}

	def void agregarLugar(String nombre) {
		var lugar = new Publicacion(nombre)
		lugares.add(lugar)
	}

	// Incompleto
	def void agregarUsuario(String nombre) {
		if (!usuarios.exists[it|it.nombre == nombre]) {
			var usuario = new Usuario
			usuario.nombre = nombre
			usuarios.add(usuario)
		} else {
			// Tendria que tirar una excepcion o algo
		}
	}

	def void eliminarUsuario(String usuario) {
		usuarios = usuarios.filter[it|it.nombre != nombre].toList
	}

	def void eliminarServicio(String nombreServicio) {
		servicios = servicios.filter[it|it.nombre != nombreServicio].toList
	}

	def void eliminarLugar(String nombreLugar) {
		lugares = lugares.filter[it|it.nombre != nombreLugar].toList
	}

	
}
