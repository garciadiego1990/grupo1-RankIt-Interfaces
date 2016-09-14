package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Administrador {
	List<Publicacion> servicios = new ArrayList<Publicacion>
	List<Publicacion> lugares = new ArrayList<Publicacion>
	List<Usuario> usuarios = new ArrayList<Usuario>

	new() {
	}
	

// Métodos de servicios
//---------------------


	def void agregarServicio(String nombre) {
		lugares.add(new Publicacion(nombre))
	}
	
	/**
	 * Se responde con la cantidad de {@link Servicio}s totales en RankIt.
	 */
	def Integer serviciosTotales() {
		servicios.size
	}

	def int serviciosHabilitados() {
		servicios.filter[it|it.estaHabilitado].size
	}

	/**
	 * Se responde con cantidad de {@link Servicio}s deshabilitados.
	 */
	def Integer serviciosDeshabilitados() {
		this.serviciosTotales - this.serviciosHabilitados
	}
	
	def void eliminarServicio(String nombreServicio) {
		servicios = servicios.filter[it|it.nombre != nombreServicio].toList
	}
	
	
// Métodos de lugares
//------------------- 


	def void agregarLugar(Publicacion p) {
		lugares.add(p)
	}
	
	def void eliminarLugar(String nombreLugar) {
		lugares = lugares.filter[it|it.nombre != nombreLugar].toList
	}
	
	/**
	 * Se responde con la cantidad de {@link Lugar}es totales en RankIt. 
	 */
	def Integer lugaresTotales() {
		lugares.size
	}
	
	def int lugaresHabilitados() {
		lugares.filter[it.estaHabilitado].size
	}
	
	/**
	 * Se responde con la cantidad de {@link Lugar}es deshabilitados en RankIt.
	 */
	def Integer lugaresDeshabilitados() {
		this.lugaresTotales - this.lugaresHabilitados
	}
	
	
	
// Métodos de usuario
//-------------------

	/**
	 * Dado un {@link Usuario} se lo agrega a la lista de usuarios de RankIt.
	 * 
	 * @param usuario - Un nuevo {@link Usuario} que será agregado a la base de datos de la aplicación.
	 * @author Abel Espínola
	 */
	def void agregarUsuario(Usuario usuario) {
		usuarios.add(usuario)
	}

	/**
	 * Dado un {@link Usuario} se lo elimina de la lista de usuarios de RankIt.
	 * 
	 * @param usuario - Un nuevo {@link Usuario} que será eliminado a la base de datos de la aplicación.
	 * @author Abel Espínola
	 */
	def void eliminarUsuario(Usuario usuario) {
		usuarios.remove(usuario)
	}
	
	/**
	 * Se responde con la cantidad de {@link Usuario}s totales en RankIt
	 * 
	 * @author Abel Espínola
	 */
	 def Integer usuariosTotales() {
	 	usuarios.size
	 }
	
	/**
	 * Se responde con la cantidad de {@link Usuario}s que están activos en RankIt.
	 * 
	 * @author Abel Espínola
	 */
	def Integer usuariosActivos() {
		usuarios.filter[it.estaActivo].size
	}
	
	/**
	 * Se responde con la cantidad de {@link Usuario}s que están inactivos en RankIt.
	 * 
	 * @author Abel Espínola
	 */
	def Integer usuariosInactivos() {
		usuarios.filter[!it.estaActivo].size
	}
	
	/**
	 * Se responde con la cantidad de {@link Usuario}s que están baneados en RankIt.
	 * 
	 * @author Abel Espínola
	 */
	def Integer usuariosBaneados() {
		usuarios.filter[it.estaBaneado].size
	}
	
	/**
	 * Se responde con la lista de {@link Usuario}s filtrada por nombre.
	 * 
	 * @author Abel Espínola
	 */
	def List<Usuario> buscarUsuariosPorNombre(String nombre) {
		usuarios.filter[usuario | usuario.nombre == nombre].toList
	}
}
