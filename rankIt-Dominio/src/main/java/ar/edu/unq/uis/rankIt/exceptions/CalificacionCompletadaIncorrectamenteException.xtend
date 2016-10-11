package ar.edu.unq.uis.rankIt.exceptions

import org.uqbar.commons.model.UserException

class CalificacionCompletadaIncorrectamenteException extends UserException {
	
	new(String message) {
		super("Existen parámetros incorrectos para la creacion de la calificacion.")
	}
	
}