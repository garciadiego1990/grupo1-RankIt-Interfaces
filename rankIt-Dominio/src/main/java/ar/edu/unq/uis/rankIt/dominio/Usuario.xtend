package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime

@Accessors
@Observable
class Usuario {
	String nombre
	String contrasenia = contraseniaDefault
	DateTime fechaDeRegistro = new DateTime
	boolean estaActivo = false
	boolean estaBaneado = false
	Integer publicacionesOfensivas = 0
	
	public val static String nombreDefault = "NN"
	public val static String contraseniaDefault = "123" 
	
	new() {
		this(nombreDefault, contraseniaDefault)
	}
	
	new(String unNombre, String contrasenia) {
		this.nombre = unNombre
		this.estaActivo = false
		this.estaBaneado = false
		this.contrasenia = contrasenia
		this.fechaDeRegistro = new DateTime
	}
	
	
	def void setContrasenia(String nuevaContrasenia){
		this.contrasenia = nuevaContrasenia
	}
	
	
	def void establecerContraseniaDefault() {
		this.setContrasenia(contraseniaDefault)
	}
	
	def void setEstaBaneado(boolean baneado) {
		this.estaBaneado = baneado
		if(baneado)
			estaActivo = false
	}
			
}
