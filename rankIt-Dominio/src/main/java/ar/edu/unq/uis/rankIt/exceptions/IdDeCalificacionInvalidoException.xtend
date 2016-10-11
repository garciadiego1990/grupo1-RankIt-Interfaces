package ar.edu.unq.uis.rankIt.exceptions

class IdDeCalificacionInvalidoException extends RuntimeException {
	
	new(String message) {
		super("El id \""+message+"\" de calificación no es un id válido")
	}
	
}