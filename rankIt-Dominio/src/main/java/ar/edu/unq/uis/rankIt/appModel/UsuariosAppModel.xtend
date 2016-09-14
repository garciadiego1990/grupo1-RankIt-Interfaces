package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.Usuario
import java.util.List
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import org.joda.time.DateTime

import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@Observable
class UsuariosAppModel {
	
	var AdministradorDeUsuarios repositorioUsuarios
	var BuscadorDeUsuarios buscador
	var DateTime fechaDeRegistroUsuarioSeleccionado
	var String nombreABuscar
	

	/**
	 * Constructor del application model para la vista {@link AdministrarUsuariosWindow}.
	 * 
	 * @author Abel Espínola
	 */
	new() {
		this.repositorioUsuarios = new AdministradorDeUsuarios()
		this.buscador = new BuscadorDeUsuarios(typeof(Usuario), repositorioUsuarios.usuarios)
	}
	

	def List<Usuario> getUsuariosRegistrados() {
		this.usuariosRegistrados
	}
	
//ALTA BAJA MODIFICACION:
	
	
	 def crearNuevoUsuario() {
	 	this.repositorioUsuarios.agregarUsuario(new Usuario())
		this.buscarUsuarios()
	 	this.actualizarResumen()
	 }
	
	
	def eliminarUsuarioSeleccionado() {
		this.repositorioUsuarios.eliminarUsuario(this.usuarioSeleccionado)
		this.buscarUsuarios()
		this.actualizarResumen()
	}
	
	
	/** 
	 * Se inactiva al {@link Usuario} seleccionado.
	 * 
	 * @author Abel Espínola
	 */
	def setUsuarioSeleccionadoActivo(boolean estado) {
		this.usuarioSeleccionado.estaActivo = estado
		this.actualizarResumenActivos()
	}
	
		/** Se responde si el {@link Usuario} seleccionado está activo.
	 * 
	 * @author Abel Espínola
	 */
	def getUsuarioSeleccionadoActivo() {
		this.usuarioSeleccionado.estaActivo
	}	
	
	/** 
	 * Se banea al {@link Usuario} seleccionado.
	 * 
	 * @author Abel Espínola
	 */
	def setUsuarioSeleccionadoBaneado(boolean estado) {
		this.usuarioSeleccionado.estaBaneado = estado
		this.actualizarResumenBaneados()
	}
	
	/** Se responde si el {@link Usuario} seleccionado está baneado.
	 * 
	 * @author Abel Espínola
	 */
	def getUsuarioSeleccionadoBaneado() {
		this.usuarioSeleccionado.estaBaneado
	}
	
//PANEL DE RESUMEN:

	
	def Integer getCantidadUsuariosRegistrados() {
		this.repositorioUsuarios.usuariosTotales()
	}
	
	
	def Integer getCantidadUsuariosActivos() {
		this.repositorioUsuarios.usuariosActivos()
	}
	
	
	def Integer getCantidadUsuariosInactivos() {
		this.repositorioUsuarios.usuariosInactivos()
	}
	
	
	def Integer getCantidadUsuariosBaneados() {
		this.repositorioUsuarios.usuariosBaneados()
	}
	
//BUSCADOR:

	def void setNombreDeUsuarioBuscado(String nombre) {
		this.nombreABuscar = nombre
		this.buscador.setNombreUsuarioABuscar(nombre)
	}
	
	def String getNombreDeUsuarioBuscado() {
		return this.nombreABuscar
	}


	def void buscarUsuarios() {
		this.buscador.search()
	}
	
	/**
	 * 
	 * @author Abel Espínola
	 */
	def Usuario getUsuarioSeleccionado() {
		this.buscador.selected
	}


//PANEL DE EDICION:

	/**
	 * Se reinicia la clave del {@link Usuario} seleccionado al valor '123'
	 * 
	 * @author Abel Espínola
	 */
	def blanquearContrasenia() {
		this.usuarioSeleccionado.establecerContraseniaDefault()
	}

	 /**
	  * Se informa a la ventana de administración de {@link Usuario}s que un nuevo usuario a sido seleccionado en la grilla.
	  * En este método se definen las notificaciones pertinentes que se deben realizar a los elementos observables.
	  * 
	  * @author Abel Espínola
	  */
	 def String getFechaDeRegistroUsuarioSeleccionado() {
	 	this.usuarioSeleccionado.fechaDeRegistro.toString()
	 }
	 
	 
	 def String getNombreDeUsuarioSeleccionado() {
	 	this.usuarioSeleccionado.nombre
	 }
	 
//BINDING GRILLA

	/**
	 * TODO
	 */



//METODOS EXPLICITOS DE ACTUALIZACION DE LA VISTA:

	def void actualizarPanelEdicionUsuario() {
		firePropertyChanged(this, "nombreDeUsuarioSeleccionado")
		firePropertyChanged(this, "fechaDeRegistroUsuarioSeleccionado")
	}


	def void actualizarResumen() {
		firePropertyChanged(this, "cantidadUsuariosRegistrados")
		this.actualizarResumenActivos()
		this.actualizarResumenBaneados
	}
	
	def void actualizarResumenBaneados() {
		firePropertyChanged(this, "cantidadUsuariosBaneados")
	}
	
	def void actualizarResumenActivos() {
		firePropertyChanged(this, "cantidadUsuariosActivos")
		firePropertyChanged(this, "cantidadUsuariosInactivos")
	}
	
}