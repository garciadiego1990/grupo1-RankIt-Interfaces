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
		var servicio = new Publicacion
		servicio.nombre = nombre
		servicios.add(servicio)
	}

	def void agregarLugar(String nombre) {
		var lugar = new Publicacion
		lugar.setNombre(nombre)
		lugares.add(lugar)
	}
	
	def void agregarUsuario(String nombre){
		var usuario = new Usuario
		usuario.nombre = nombre
		usuarios.add(usuario)
	}
	
	def void eliminarUsuario(String usuario){
		usuarios = usuarios.filter[it | it.nombre != nombre].toList
	}
	
	def void eliminarServicio(String nombreServicio) {
		servicios = servicios.filter[it | it.nombre != nombreServicio].toList
	}
	
	def void eliminarLugar(String nombreLugar) {
		lugares = lugares.filter[it | it.nombre != nombreLugar].toList
	}
	
	
	
	// Agregado de Nico y abel, testear porque no me convence.
	def int calificacionesRegistradas() {
		return this.calificacionesDeServicios + (this.calificacionesDeLugares)
	}
	
	def int calificacionesDeServicios() {
		var ret  = 0
		for(Publicacion p : this.servicios) {
			ret += p.calificaciones.size
		}
			return ret
	}
	
	def int calificacionesDeLugares() {
		var ret  = 0
		for(Publicacion p : this.lugares) {
			ret += p.calificaciones.size
		}
			return ret
	}
	
	
	def int lugaresHabilitados() {
		return lugares.filter[it | it.estaHabilitado].size
	}
	
	def int lugaresDeshabilitados() {
		return lugares.filter[it | !it.estaHabilitado].size
	}
	
	def int serviciosHabilitados() {
		return servicios.filter[it | it.estaHabilitado].size
	}
	
	def int serviciosDeshabilitados() {
		return servicios.filter[it | !it.estaHabilitado].size
	}
	
}