package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AdministradorDeUsuarios {
	List<Usuario> usuarios
	
	 
	new() {
		this.usuarios = new ArrayList<Usuario>
	}
	
	/** Dado un {@link Usuario} se lo agrega a la lista de usuarios de RankIt.
	 * 
	 * @param usuario - Un nuevo {@link Usuario} que será agregado a la base de datos de la aplicación.
	 * @author ae */
	def void agregarUsuario(Usuario usuario) {
		usuarios.add(usuario)
	}

	/** Dado un {@link Usuario} se lo elimina de la lista de usuarios de RankIt.
	 * 
	 * @param usuario - Un nuevo {@link Usuario} que será eliminado a la base de datos de la aplicación.
	 * @author ae */
	def void eliminarUsuario(Usuario usuario) {
		usuarios.remove(usuario)
	}
	
	/** Se responde con la cantidad de {@link Usuario}s totales en RankIt
	 * 
	 * @author ae */
	 def Integer usuariosTotales() {
	 	usuarios.size
	 }
	
	/** Se responde con la cantidad de {@link Usuario}s que están activos en RankIt.
	 * 
	 * @author ae */
	def Integer usuariosActivos() {
		usuarios.filter[it.estaActivo].size
	}
	
	/** Se responde con la cantidad de {@link Usuario}s que están inactivos en RankIt.
	 * 
	 * @author ae */
	def Integer usuariosInactivos() {
		usuarios.filter[!it.estaActivo].size
	}
	
	/** Se responde con la cantidad de {@link Usuario}s que están baneados en RankIt.
	 * 
	 * @author ae */
	def Integer usuariosBaneados() {
		usuarios.filter[it.estaBaneado].size
	}
		
}