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
	
	def agregarUsuario(Usuario u) {
		usuarios.add(u)
	}	
}