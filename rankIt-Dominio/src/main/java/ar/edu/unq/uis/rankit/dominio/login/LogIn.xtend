package ar.edu.unq.uis.rankit.dominio.login

import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.exceptions.UsuarioNoEncontradoException
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException

@Accessors
class LogIn {
	
	var AdministradorDeUsuarios administradorDeUsuarios
	
	new(AdministradorDeUsuarios administradorUsuarios) {
		this.administradorDeUsuarios = administradorUsuarios
	}
	
	/** Dado el nombre y contraseña de un {@link Usuario} registrado en la aplicación se loguea 
	 * a dicho usuario.
	 * @return el usuario con nombre de usuario y password dados.
	 * @throws {@link UsuarioNoEncontradoException} en caso de no existir el usuario con el nombre dado.
	 * @throws {@link ContraseniaDeUsuarioIncorrectaException} en caso que la contraseña dada sea incorrecta.
	 * @author ae */
	def logearUsuario(String nombreUsuario, String contrasenia) {
		var usuarios = this.administradorDeUsuarios.usuarios
		var Usuario usuarioEncontrado = usuarios.findFirst[each | each.nombre == nombreUsuario ]
		if(usuarioEncontrado == null)
			throw new UsuarioNoEncontradoException(nombreUsuario)
		if(usuarioEncontrado.contrasenia != contrasenia)
			throw new ContraseniaDeUsuarioIncorrectaException(nombreUsuario)
		return usuarioEncontrado
	}
	
}