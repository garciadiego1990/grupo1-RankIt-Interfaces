package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.dominio.buscadores.BuscadorDeCalificaciones
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import java.util.List

@Accessors
@Observable
class CalificacionesAppModel {
	var AdministradorDeCalificaciones admin
	var String nombreDePublicacionBuscada
	var String nombreDeUsuarioBuscado
	var BuscadorDeCalificaciones buscador
	var Calificacion calificacionSeleccionada
	
	int ofensivas
	
	int registradas

	new() {
		this.admin = this.getRepoCalificaciones()
		this.buscador = new BuscadorDeCalificaciones(admin.calificaciones)
		this.actualizarResumen()
	}

	def List<Publicacion> getPublicaciones(){
		admin.publicaciones
	}
	
	def DateTime getFecha() {
		calificacionSeleccionada.getFecha
	}

	def String getNombreUsuario() {
		calificacionSeleccionada.getEvaluador.getNombre
	}
//
//	def String getNombrePublicacion() {
//		if (calificacionSeleccionada.getEvaluado.getNombre == null) {
//			return "--"
//		} else {
//			calificacionSeleccionada.getEvaluado.getNombre
//		}
//	}
	
	
	def String getNombrePublicacion() {
		calificacionSeleccionada.getNombrePublicacion
	}
	
	// No se si es necesario
//	def void setNombrePublicacion(String unNombre){
//		calificacionSeleccionada.evaluador.nombre = unNombre 
//		ObservableUtils.firePropertyChanged(this, "nombrePublicacion")
//		this.actualizarResumen
//		buscarCalificaciones
//		actualizarPanelEdicionCalificacion() 
//		admin.actualizarListaDeCalificaciones
//	}
	
	def boolean getCalificacionOfensiva() {
		calificacionSeleccionada.esOfensiva
	}

	def int getPuntaje() {
		calificacionSeleccionada.getPuntaje
	}
	
	def String getDetalle() {
		calificacionSeleccionada.getDetalle
	}

	def void setCalificacionSeleccionada(Calificacion c) {
		calificacionSeleccionada = c
		if(c!=null){
			actualizarPanelEdicionCalificacion()
			//ObservableUtils.firePropertyChanged(this, "calificacionesRegistradas")
		    //ObservableUtils.firePropertyChanged(this, "calificacionesOfensivas")
		}
	}
	
	
	/**@author ae */
	def void crearNuevaCalificacion() throws RuntimeException {
		if (calificacionSeleccionada == null)
			new RuntimeException("Seleccione una publicacion")
		
		var nuevaCalificacion = new Calificacion(	calificacionSeleccionada.evaluado,
													new Usuario("ADMIN", Usuario.contraseniaDefault),
													0,
													"prueba")
		this.admin.agregarCalificacion(nuevaCalificacion)
		this.buscarCalificaciones()
		this.actualizarResumen()
	}


	def eliminarCalificacionSeleccionada() {
		this.admin.eliminarCalificacion(calificacionSeleccionada)
		this.buscarCalificaciones()
		this.actualizarResumen()
	}
		
	
	def void setCalificacionOfensiva(boolean value) {
		calificacionSeleccionada.esOfensiva = value
		ObservableUtils.firePropertyChanged(this, "calificacionOfensiva")
		this.actualizarResumen
	}


   // METODOS EXPLICITOS DE ACTUALIZACION DE LA VISTA:
	def void actualizarPanelEdicionCalificacion() {
		ObservableUtils.firePropertyChanged(this,"fecha")
		ObservableUtils.firePropertyChanged(this,"nombreUsuario")
		ObservableUtils.firePropertyChanged(this,"nombrePublicacion")
		ObservableUtils.firePropertyChanged(this,"detalle")
		ObservableUtils.firePropertyChanged(this,"puntaje")
		ObservableUtils.firePropertyChanged(this, "ofensivas")
		ObservableUtils.firePropertyChanged(this,"calificacionOfensiva")
	}
	
	
	def void actualizarResumen() {
		this.ofensivas = this.admin.calificacionesOfensivas
		this.registradas = this.admin.totalCalificaciones
		ObservableUtils.firePropertyChanged(this, "resumen")
	}
	
//BUSCADOR	
	
	def void buscarCalificaciones() {
		buscador.search()
	}
	
	/**@author ae */
	def void setNombreDeUsuarioBuscado(String nombre) {
		this.nombreDeUsuarioBuscado = nombre
		this.buscador.nombreUsuarioABuscar = nombre
	}
	
	/**@author ae */
	def void setNombreDePublicacionBuscada(String nombre) {
		this.nombreDePublicacionBuscada = nombre
		this.buscador.nombrePublicacionABuscar = nombre 
	}
	
	/**TODO @author dg */
	def String getNombreDePublicacionBuscada() {
		nombreDePublicacionBuscada
	}
	
//MENU

	/**@author ae */
	def String getResumen() {
		return this.ofensivas + " / " + this.registradas
	}

//CARGO EL APPLICATION CONTEXT

	def AdministradorDeCalificaciones getRepoCalificaciones() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		return adminGral.adminCalificaciones
	}
}
