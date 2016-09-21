package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.dominio.buscadores.BuscadorDeUsuarios
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@Observable
class UsuariosAppModel {
	
	var AdministradorDeUsuarios admin
	var Usuario usuarioSeleccionado
	var BuscadorDeUsuarios buscador
	var String nombreABuscar
	
	var int registrados
	var int activos
	var int inactivos
	var int baneados
	
	new() {
		this.admin = this.getRepoUsuarios()
		this.buscador = new BuscadorDeUsuarios(admin.usuarios)
		this.actualizarResumen()
	}
	

	def List<Usuario> getUsuariosRegistrados() {
		this.usuariosRegistrados
	}
	
//ALTA BAJA MODIFICACION:
	
	 def crearNuevoUsuario() {
	 	this.admin.agregarUsuario(new Usuario())
		this.buscarUsuarios()
	 	this.actualizarResumen()
	 }
	
	
	def eliminarUsuarioSeleccionado() {
		this.admin.eliminarUsuario(this.usuarioSeleccionado)
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
		this.usuarioSeleccionado.setEstaBaneado(estado)
		this.actualizarResumen()
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
		this.registrados = this.admin.usuariosTotales()
		this.activos = this.admin.usuariosActivos()
		this.inactivos = this.registrados - this.activos
		this.baneados = this.admin.usuariosBaneados()
		this.actualizarMenu()
	}
	
	def void actualizarResumenBaneados() {
		this.baneados = this.admin.usuariosBaneados()
		this.actualizarMenu()
	}
	
	def void actualizarResumenActivos() {
		this.activos = this.admin.usuariosActivos()
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