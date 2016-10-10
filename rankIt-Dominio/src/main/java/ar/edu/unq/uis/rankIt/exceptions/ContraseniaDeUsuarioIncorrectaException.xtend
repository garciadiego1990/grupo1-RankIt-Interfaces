package ar.edu.unq.uis.rankIt.exceptions

class ContraseniaDeUsuarioIncorrectaException extends RuntimeException {
	
	new(String message) {
		super("La contraseña ingresada es incorrecta para el usuario \""+message+"\".")
	}
}