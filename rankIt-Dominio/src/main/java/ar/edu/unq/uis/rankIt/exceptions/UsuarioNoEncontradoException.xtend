package ar.edu.unq.uis.rankIt.exceptions

class UsuarioNoEncontradoException extends RuntimeException {
	
	new(String message) {
		super("El usuario de nombre \""+message+"\" no está registrado en la aplicación.")
	}
	
}