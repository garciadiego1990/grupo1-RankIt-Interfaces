package ar.edu.unq.uis.rankIt.dominio

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
	
	val static String nombreDefault = "NN"
	val static String contraseniaDefault = "123" 
	
	
	new(String unNombre, String contrasenia) {
		this.nombre = unNombre
		this.estaActivo = false
		this.estaBaneado = false
		this.contrasenia = contrasenia
		this.fechaDeRegistro = new DateTime
	}
	
	
	/**
	 * Contructor que genera un {@link Usuario} con sus valores seteados por default.
	 * 
	 * @author Abel Espínola
	 */
	new() {
		this(nombreDefault, contraseniaDefault)
	}
	
	
	/**
	 * Dada una nueva contraseña, se la setea al {@link Usuario}.
	 * 
	 * @param nuevaContrasenia - La nueva contraseña del {@link Usuario}
	 * @author Abel Espínola
	 */
	def void setContrasenia(String nuevaContrasenia){
		this.contrasenia = nuevaContrasenia
	}
	
	/**
	 * Se le asigna al {@link Usuario} la contraseña por default.
	 * 
	 * @author Abel Espínola
	 */
	def void establecerContraseniaDefault() {
		this.setContrasenia(contraseniaDefault)
	}
}