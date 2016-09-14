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
	
	var Administrador administrador
	
	var Usuario usuarioSeleccionado
	var String nombreDeUsuarioBuscado = ""
	var DateTime fechaDeRegistroUsuarioSeleccionado
	
	List<Usuario> usuariosBuscados
	

	/**
	 * Constructor del application model para la vista {@link AdministrarUsuariosWindow}.
	 * 
	 * @param admnistrador - Administrador de la lista de {@link Usuario}s
	 * @author Abel Espínola
	 */
	new() {
		this.administrador = new Administrador()
	}
	
//	/**
//	 * Getter que lanza una excepción en caso de haberse seleccionado ningún {@link Usuario}
//	 * 
//	 * @author Abel Espínola
//	 */
//	def Usuario getUsuarioSeleccionado() {
//		if (this.usuarioSeleccionado == null) {
//			throw new RuntimeException("Seleccione un usario a editar")
//		}
//		return this.usuarioSeleccionado
//	}
	
	
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
	 	this.refrescarPantalla()
	 }
	
	/**
	 * Se eliminia el {@link Usuario} seleccionado de la aplicación.
	 * 
	 * @author Abel Espínola
	 */
	def eliminarUsuarioSeleccionado() {
		this.administrador.eliminarUsuario(usuarioSeleccionado)
		this.refrescarPantalla()
	}
	
	
	/**
	 * Se reinicia la clave del {@link Usuario} seleccionado al valor '123'
	 * 
	 * @author Abel Espínola
	 */
	def blanquearContrasenia() {
		this.usuarioSeleccionado.establecerContraseniaDefault()
	}
	
	
	/** Se inactiva al {@link Usuario} seleccionado.
	 * 
	 * @author Abel Espínola
	 */
	def setUsuarioSeleccionadoActivo(boolean estado) {
		this.usuarioSeleccionado.estaActivo = estado
		this.refrescarPantalla()	
	}
	
	/** Se banea al {@link Usuario} seleccionado.
	 * 
	 * @author Abel Espínola
	 */
	def setUsuarioSeleccionadoBaneado(boolean estado) {
		this.usuarioSeleccionado.estaBaneado = estado
		this.refrescarPantalla()
	}
	
	/** Se responde si el {@link Usuario} seleccionado está activo.
	 * 
	 * @author Abel Espínola
	 */
	def getUsuarioSeleccionadoActivo() {
		this.usuarioSeleccionado.estaActivo
	}
	
	/** Se responde si el {@link Usuario} seleccionado está baneado.
	 * 
	 * @author Abel Espínola
	 */
	def getUsuarioSeleccionadoBaneado() {
		this.usuarioSeleccionado.estaBaneado
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
//BUSCADOR:

	def setNombreDeUsuarioBuscado(String nombreBuscado) {
		this.usuariosBuscados = this.administrador.buscarUsuariosPorNombre(nombreBuscado)
		firePropertyChanged(this, "usuariosBuscados")
	}


//PANEL DE EDICION:

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
	 
//BINDING GRILLA

	/**
	 * TODO
	 */


//METODOS AUXILIARES:

	def refrescarPantalla() {
//		this.usuarioSeleccionado = null
		firePropertyChanged(this, "cantidadUsuariosRegistrados")
		firePropertyChanged(this, "cantidadUsuariosActivos")
		firePropertyChanged(this, "cantidadUsuariosInactivos")
		firePropertyChanged(this, "cantidadUsuariosBaneados")
	}

}