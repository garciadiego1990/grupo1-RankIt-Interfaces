package ar.edu.unq.uis.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.Administrador
import ar.edu.unq.uis.rankIt.dominio.Usuario

import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class AdministrarUsuariosRankItAppModel {
	
	val Administrador administrador = new Administrador()
	
	var Usuario usuarioSeleccionado
	var String nombreDeUsuarioBuscado
	
	def getUsuariosRegistrados() {
		
	}
	
	/**
	 * Se reinicia la clave del {@link Usuario} seleccionado al valor '123'
	 */
	def blanquearContrasenia() {
		this.usuarioSeleccionado.setContrasenia("123")
	}
	
	/**
	 * Se eliminia el {@link Usuario} seleccionado de la aplicación.
	 */
	def eliminarUsuarioSeleccionado() {
		this.administrador.eliminarUsuario(usuarioSeleccionado)
	}
}