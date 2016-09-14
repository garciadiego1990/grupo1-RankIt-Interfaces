package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.Usuario
import java.util.List
import java.util.Date
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios

@Accessors
@Observable
class UsuariosAppModel {
	
	AdministradorDeUsuarios admin
	
	Usuario usuarioSeleccionado
	List<Usuario> usuariosRegistrados
	String nombreDeUsuarioBuscado
	Date fechaDeRegistroUsuarioSeleccionado
	
	
	new(AdministradorDeUsuarios admin) {
		this.admin = admin
	}
	
	/* 
	
	def List<Usuario> getUsuariosRegistrados() {
		this.usuariosRegistrados
	}
//SELECCION NUEVO USUARIO DE LA GRILLA:

	def void setUsuarioSeleccionado(Usuario usuario) {
		this.usuarioSeleccionado = usuario
		this.nuevoUsuarioSeleccionado()
	}

//ALTA BAJA MODIFICACION:
	
	
	 def crearNuevoUsuario() {
	 	this.administrador.agregarUsuario(new Usuario())
		this.refrescarListaDeUsuariosEnPantalla()
	 }
	
	
	def eliminarUsuarioSeleccionado() {
		this.administrador.eliminarUsuario(usuarioSeleccionado)
		this.refrescarListaDeUsuariosEnPantalla()

	}
	
	
	def blanquearContrasenia() {
		this.usuarioSeleccionado.establecerContraseniaDefault()
	}
//PANEL DE RESUMEN:

	
	def Integer getCantidadUsuariosRegistrados() {
		this.administrador.usuariosTotales()
	}
	
	
	def Integer getCantidadUsuariosActivos() {
		this.administrador.usuariosActivos()
	}
	
	
	def Integer getCantidadUsuariosInactivos() {
		this.administrador.usuariosInactivos()
	}
	
	
	def Integer getCantidadUsuariosBaneados() {
		this.administrador.usuariosBaneados()
	}
	
//PANEL DE EDICION:

	
	 def String getFechaDeRegistroUsuarioSeleccionado() {
	 	this.usuarioSeleccionado.fechaDeRegistro.toString()
	 }
	 
	 
	 def void nuevoUsuarioSeleccionado() {
	 	firePropertyChanged(this, "nombreDeUsuarioSeleccionado")
	 	firePropertyChanged(this, "fechaDeRegistroUsuarioSeleccionado")
	 }
	 
	 def String getNombreDeUsuarioSeleccionado() {
	 	this.usuarioSeleccionado.nombre
	 }
	

//METODOS AUXILIARES:

	def refrescarListaDeUsuariosEnPantalla() {
		firePropertyChanged(this, "cantidadUsuariosRegistrados")
		firePropertyChanged(this, "usuariosRegistrados")
//		firePropertyChanged(this, "cantidadUsariosActivos")
//		firePropertyChanged(this, "cantidadUsariosInactivos")
//		firePropertyChanged(this, "cantidadUsariosBaneados")
	}

	*/

}