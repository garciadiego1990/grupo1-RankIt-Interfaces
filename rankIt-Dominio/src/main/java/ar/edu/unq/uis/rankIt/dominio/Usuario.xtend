package ar.edu.unq.uis.rankIt.dominio

import java.util.Calendar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime

@Accessors
@Observable
class Usuario {
	String nombre
	String contrasenia
	DateTime fechaDeRegistro
	boolean estaActivo
	boolean estaBaneado
	Integer publicacionesOfensivas = 0
	
	
	new(String unNombre, String contrasenia) {
		this.nombre = unNombre
		this.estaActivo = false
		this.estaBaneado = false
		this.contrasenia = contrasenia
		this.fechaDeRegistro = new DateTime
	} 
	
	
	/**
	 * Dada una nueva contraseña, se la setea al {@link Usuario}.
	 * 
	 * @param nuevaContrasenia - La nueva contraseña del {@link Usuario}
	 */
	def void setContrasenia(String nuevaContrasenia){
		this.contrasenia = nuevaContrasenia
	}
}