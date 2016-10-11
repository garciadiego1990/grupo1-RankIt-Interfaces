package ar.edu.unq.uis.rankIt.exceptions

class IdDeCalificacionInexistenteException extends RuntimeException {
	
	new(String message) {
		super("No existe la calificación con el id: "+message+".")
	}
	
}