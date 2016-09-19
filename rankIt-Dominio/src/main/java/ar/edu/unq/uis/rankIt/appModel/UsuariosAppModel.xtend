package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.Usuario
import java.util.List
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios

import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral

@Accessors
@Observable
class UsuariosAppModel {
	
	var AdministradorDeUsuarios repositorioUsuarios
	var Usuario usuarioSeleccionado
	var BuscadorDeUsuarios buscador
	var String nombreABuscar
	
	var int registrados
	var int activos
	var int inactivos
	var int baneados
	
	new() {
		this.repositorioUsuarios = this.getRepoUsuarios()
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
	
	
	def setUsuarioSeleccionadoActivo(boolean estado) {
		this.usuarioSeleccionado.estaActivo = estado
		this.actualizarResumenActivos()
	}
	

	def getUsuarioSeleccionadoActivo() {
		this.usuarioSeleccionado.estaActivo
	}	
	
	
	def setUsuarioSeleccionadoBaneado(boolean estado) {
		this.usuarioSeleccionado.estaBaneado = estado
		this.actualizarResumenBaneados()
	}
	
	
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

	def void setNombreABuscar(String nombre) {
		this.nombreABuscar = nombre
		this.buscador.setPatronDeBusqueda(nombre)
	}
	
	def String getNombreDeUsuarioBuscado() {
		return this.nombreABuscar
	}


	def void buscarUsuarios() {
		this.buscador.search()
	}
	
//PANEL DE EDICION:

	
	def blanquearContrasenia() {
		this.usuarioSeleccionado.establecerContraseniaDefault()
	}

	 
	 
	 def String getNombreDeUsuarioSeleccionado() {
	 	this.usuarioSeleccionado.nombre
	 }
	 
//BINDING GRILLA

	def void setUsuarioSeleccionado(Usuario usuario) {
		this.usuarioSeleccionado = usuario
		if (usuario != null)
			this.actualizarPanelEdicionUsuario()
	}


//METODOS EXPLICITOS DE ACTUALIZACION DE LA VISTA:
	 
	def void actualizarPanelEdicionUsuario() {
		firePropertyChanged(this, "usuarioSeleccionadoActivo")
		firePropertyChanged(this, "usuarioSeleccionadoBaneado")
	}
	

	def void actualizarResumen() {
		firePropertyChanged(this, "cantidadUsuariosRegistrados")
		this.actualizarResumenActivos()
		this.actualizarResumenBaneados()
	}
	
	def void actualizarResumenBaneados() {
		firePropertyChanged(this, "cantidadUsuariosBaneados")
	}
	
	def void actualizarResumenActivos() {
		firePropertyChanged(this, "cantidadUsuariosActivos")
		firePropertyChanged(this, "cantidadUsuariosInactivos")
	}
	
	def void actualizarMenu() {
		firePropertyChanged(this, "resumen")
	}
	
	
//CARGO EL APPLICATION CONTEXT

	def AdministradorDeUsuarios getRepoUsuarios() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		adminGral.adminUsuarios
	}	
}