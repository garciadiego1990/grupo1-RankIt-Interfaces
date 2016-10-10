package ar.edu.unq.uis.rankit.dominio.signup

import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.exceptions.NombreDeUsuarioInvalidoException

class SignUp {
	
	val AdministradorDeUsuarios administradorDeUsuarios
	
	new(AdministradorDeUsuarios admin) {
		this.administradorDeUsuarios = admin
	}
	
	def registrarUsuario(String nombreUsuario, String password) {
		if(this.nombreDeUsuarioValido(nombreUsuario)) {
			var usuarioNuevo = new Usuario(nombreUsuario, password)
			this.administradorDeUsuarios.agregarUsuario(usuarioNuevo)
			return usuarioNuevo
		}
		else
			throw new NombreDeUsuarioInvalidoException(nombreUsuario)
	}
	
	def nombreDeUsuarioValido(String nombre) {
		return	(nombre != null) 	&&
				(nombre != "")		&&
				!this.administradorDeUsuarios.usuarios.exists[ each | each.nombre == nombre]
	}
	
}