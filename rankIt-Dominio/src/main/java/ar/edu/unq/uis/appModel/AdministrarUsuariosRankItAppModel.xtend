package ar.edu.unq.uis.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.Administrador
import ar.edu.unq.uis.rankIt.dominio.Usuario

import static org.uqbar.commons.model.ObservableUtils.*
import java.util.List
import org.joda.time.DateTime

@Accessors
@Observable
class AdministrarUsuariosRankItAppModel {
	
	val Administrador administrador
	
	var Usuario usuarioSeleccionado
	var List<Usuario> usuariosRegistrados
	var String nombreDeUsuarioBuscado
	var DateTime fechaDeRegistroUsuarioSeleccionado
	
	new() {
		this.administrador = new Administrador()
		this.usuariosRegistrados = this.administrador.usuarios
	}
	
	
	/**
	 * Se responde con la lista de {@link Usuario}s de la aplicación.
	 * 
	 * @author Abel Espínola
	 */
	def List<Usuario> getUsuariosRegistrados() {
		this.usuariosRegistrados
	}
//SELECCION NUEVO USUARIO DE LA GRILLA:

	def void setUsuarioSeleccionado(Usuario usuario) {
		this.usuarioSeleccionado = usuario
		this.nuevoUsuarioSeleccionado()
	}

//ALTA BAJA MODIFICACION:
	
	/**
	 * Se crea un nuevo {@link Usuario} con nombre "NN" y contraseña seteada en default.
	 * 
	 * @author Abel Espínola
	 */
	 def crearNuevoUsuario() {
	 	this.administrador.agregarUsuario(new Usuario())
		this.refrescarListaDeUsuariosEnPantalla()
	 }
	
	/**
	 * Se eliminia el {@link Usuario} seleccionado de la aplicación.
	 * 
	 * @author Abel Espínola
	 */
	def eliminarUsuarioSeleccionado() {
		this.administrador.eliminarUsuario(usuarioSeleccionado)
		this.refrescarListaDeUsuariosEnPantalla()

	}
	
	/**
	 * Se reinicia la clave del {@link Usuario} seleccionado al valor '123'
	 * 
	 * @author Abel Espínola
	 */
	def blanquearContrasenia() {
		this.usuarioSeleccionado.establecerContraseniaDefault()
	}
//PANEL DE RESUMEN:

	/**
	 * Se responde con la cantidad de {@link Usuario}s totales del sistema.
	 * 
	 * @author Abel Espínola
	 */
	def Integer getCantidadUsuariosRegistrados() {
		this.administrador.usuariosTotales()
	}
	
	/**
	 * Se responde con la cantidad de {@link Usuario}s activos del sistema.
	 * 
	 * @author Abel Espínola
	 */
	def Integer getCantidadUsuariosActivos() {
		this.administrador.usuariosActivos()
	}
	
	/**
	 * Se responde con la cantidad de {@link Usuario}s inactivos del sistema.
	 * 
	 * @author Abel Espínola
	 */
	def Integer getCantidadUsuariosInactivos() {
		this.administrador.usuariosInactivos()
	}
	
	/**
	 * Se responde con la cantidad de {@link Usuario}s baneados del sistema.
	 * 
	 * @author Abel Espínola
	 */
	def Integer getCantidadUsuariosBaneados() {
		this.administrador.usuariosBaneados()
	}
	
//PANEL DE EDICION:

	/**
	 * Se responde con la fecha de registro del {@link Usuario} seleccionado.
	 * 
	 * @author Abel Espínola
	 */
	 def String getFechaDeRegistroUsuarioSeleccionado() {
	 	this.usuarioSeleccionado.fechaDeRegistro.toString()
	 }
	 
	 /**
	  * Se informa a la ventana de administración de {@link Usuario}s que un nuevo usuario a sido seleccionado en la grilla.
	  * En este método se definen las notificaciones pertinentes que se deben realizar a los elementos observables.
	  * 
	  * @author Abel Espínola
	  */
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



}