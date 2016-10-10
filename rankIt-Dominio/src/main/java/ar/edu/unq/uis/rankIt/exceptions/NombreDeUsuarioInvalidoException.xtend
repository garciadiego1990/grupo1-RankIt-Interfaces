package ar.edu.unq.uis.rankIt.exceptions

class NombreDeUsuarioInvalidoException extends RuntimeException {
	
	new(String message) {
		super(	"El nombre de usuario \""+message+"\" es inválido debido a que esta siendo"
				+"utilizado por otro usuario o el nombre dado es null o no respeta el"
				+"formato que debe poseer un nombre.")
	}
}