package ar.edu.unq.uis.rankIt.dominio

import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Usuario {
	String nombre = null
	String contrasenia = null
	Calendar fechaDeRegistro = Calendar.getInstance()
	boolean estaActivo = false
	boolean estaBaneado = false
	Integer publicacionesOfensivas = 0
	
	
	new() {
		
	} 
	
	def void banear(){
		estaBaneado = true
	}
}