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
		this.actualizarResumen()
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

//METODOS DE ACTUALIZACION DE LA VISTA:
	 
	def void actualizarPanelEdicionUsuario() {
		firePropertyChanged(this, "usuarioSeleccionadoActivo")
		firePropertyChanged(this, "usuarioSeleccionadoBaneado")
	}
	
	def void actualizarResumen() {
		this.registrados = this.repositorioUsuarios.usuariosTotales()
		this.activos = this.repositorioUsuarios.usuariosActivos()
		this.inactivos = this.registrados - this.activos
		this.baneados = this.repositorioUsuarios.usuariosBaneados()
		this.actualizarMenu()
	}
	
	def void actualizarResumenBaneados() {
		this.baneados = this.repositorioUsuarios.usuariosBaneados()
		this.actualizarMenu()
	}
	
	def void actualizarResumenActivos() {
		this.activos = this.repositorioUsuarios.usuariosActivos()
		this.inactivos = this.registrados - this.activos
		this.actualizarMenu()
	}
	
	def void actualizarMenu() {
		firePropertyChanged(this, "resumen")
	}

//MENU
	
	def String getResumen() {
		return this.activos + " / " + this.registrados + " (" + this.baneados + ")"
	}
	
//CARGO EL APPLICATION CONTEXT

	def AdministradorDeUsuarios getRepoUsuarios() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		adminGral.adminUsuarios
	}	
}