package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.Usuario

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
		admin = getRepoCalificaciones
		buscador = new BuscadorDeCalificaciones(admin.calificaciones)
		this.actualizarResumen()
	}

	def getNombreEvaluados(){
		admin.getNombrePublicaciones
	}
	
	def DateTime getFecha() {
		calificacionSeleccionada.getFecha
	}

	def String getNombreUsuario() {
		calificacionSeleccionada.getEvaluador.getNombre
	}

	def String getNombrePublicacion() {
		if (calificacionSeleccionada.getEvaluado.getNombre == null) {
			return "--"
		} else {
			calificacionSeleccionada.getEvaluado.getNombre
		}
	}
	
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
	def void crearNuevaCalificacion() {
		if (calificacionSeleccionada == null)
			return;
			
		new Calificacion(	calificacionSeleccionada.evaluado,
							new Usuario("ADMIN", Usuario.contraseniaDefault),
							0,
							"")
//		c.evaluado= calificacionSeleccionada.evaluado
//		c.puntaje = 0
//		admin.agregarCalificacion(c)
		buscarCalificaciones()
		actualizarResumen()
//		buscador.search()
	}

	def eliminarCalificacionSeleccionada() {
		admin.calificaciones.remove(calificacionSeleccionada)
		buscarCalificaciones()
		actualizarResumen()
//		buscador.search()
	}
	
//	ESTE MÉTODO ESTÁ REPETIDO - Abel
//	def setPublicacionConContenidoOfensivo(boolean value) {
//		calificacionSeleccionada.esOfensiva = value
//		ObservableUtils.firePropertyChanged(this, "calificacionOfensiva")
//		this.actualizarResumen
//	}
	
	def void setCalificacionOfensiva(boolean value) {
		calificacionSeleccionada.esOfensiva = value
		ObservableUtils.firePropertyChanged(this, "calificacionOfensiva")
		this.actualizarResumen
	}
	
	// BUSCADOR:
	def void buscarCalificaciones() {
		buscador.search()
	}

   // METODOS EXPLICITOS DE ACTUALIZACION DE LA VISTA:
	def void actualizarPanelEdicionCalificacion() {
		ObservableUtils.firePropertyChanged(this,"fecha")
		ObservableUtils.firePropertyChanged(this,"nombreUsuario")
		ObservableUtils.firePropertyChanged(this,"detalle")
		ObservableUtils.firePropertyChanged(this,"puntaje")
		ObservableUtils.firePropertyChanged(this, "ofensivas")
		ObservableUtils.firePropertyChanged(this,"calificacionOfensiva")
		
	}
	
	/**@author ae */
	def void actualizarResumen() {
		this.ofensivas = this.admin.calificacionesOfensivas
		this.registradas = this.admin.totalCalificaciones
		ObservableUtils.firePropertyChanged(this, "nombreEvaluados")
		ObservableUtils.firePropertyChanged(this, "resumen")
	}
	
//BUSCADOR	
	
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
	
//MENU

	/**@author ae */
	def String getResumen() {
		return this.ofensivas + " / " + this.registradas
	}

//CARGO EL APPLICATION CONTEXT

	def AdministradorDeCalificaciones getRepoCalificaciones() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		adminGral.adminCalificaciones
	}
}
