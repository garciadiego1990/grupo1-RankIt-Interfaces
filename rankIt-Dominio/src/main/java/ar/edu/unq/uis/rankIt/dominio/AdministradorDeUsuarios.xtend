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
		usuarios = new ArrayList<Usuario>
	}
	
	def void agregarUsuario(Usuario usuario) {
		usuarios.add(usuario)
	}

	def void eliminarUsuario(Usuario usuario) {
		usuarios.remove(usuario)
	}
	
	def Integer usuariosTotales() {
	 	usuarios.size
	}
	
	def Integer usuariosActivos() {
		usuarios.filter[it.estaActivo].size
	}
	
	def Integer usuariosInactivos() {
		usuarios.filter[!it.estaActivo].size
	}
	
	def Integer usuariosBaneados() {
		usuarios.filter[it.estaBaneado].size
	}
		
}