package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import org.joda.time.DateTime
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
abstract class PublicacionAppModel {

	var AdministradorDePublicaciones admin
	var String nombreDePublicacionBuscada
	var BuscadorDePublicaciones buscador
	var Publicacion publicacionSeleccionada

	
	new() {
		admin = getRepoPublicaciones
		buscador = new BuscadorDePublicaciones(admin.todo)
	}

	def DateTime getFechaDeRegistro() {
		publicacionSeleccionada.fechaDeRegistro
	}

	def String getNombre() {
		publicacionSeleccionada.getNombre
	}

	def boolean estaHabilitado() {
		publicacionSeleccionada.estaHabilitado
	}

	def Integer getCantidadDeCalificaciones() {
		if (publicacionSeleccionada == null) {
			0
		} else {
			publicacionSeleccionada.cantidadDeEvaluaciones
		}
	}

	def double getRatingPromedio() {
		if (publicacionSeleccionada == null) {
			0
		} else {
			publicacionSeleccionada.ratingPromedio
		}
	}

	def void setPublicacionSeleccionada(Publicacion publicacion) {
		publicacionSeleccionada = publicacion
		if (publicacion != null)
			this.actualizarPanelEdicionPublicacion()
	}

	def crearNuevaPublicacion() {
		admin.agregar(new Publicacion())
		buscarPublicaciones()
		actualizarResumen()
		ObservableUtils.firePropertyChanged(buscador,"publicacionesFiltradas")
	}

	def eliminarPublicacionSeleccionada() {
		admin.borrar(publicacionSeleccionada)
		buscarPublicaciones()
		actualizarResumen()
		ObservableUtils.firePropertyChanged(buscador,"publicacionesFiltradas")
	}

	def setPublicacionSeleccionadaHabilitado(boolean estado) {
		publicacionSeleccionada.estaHabilitado = estado
		actualizarResumenHabilitados()
	}

	// PANEL DE RESUMEN:
	
	def Integer getCantidadPublicacionesRegistradas() {
		admin.inscriptos
	}

	def Integer getCantidadPublicacionesHabilitadas() {
		admin.habilitados
	}

	def int getCantidadPublicacionesDeshabilitadas() {
		admin.deshabilitados
	}
	
	def boolean getPublicacionHabilitada(){
		publicacionSeleccionada.estaHabilitado
	}
	
	def void setPublicacionHabilitada(boolean value){
		publicacionSeleccionada.estaHabilitado = value
		ObservableUtils.firePropertyChanged(this, "publicacionHabilitada")
		ObservableUtils.firePropertyChanged(this, "cantidadPublicacionesHabilitadas")
		ObservableUtils.firePropertyChanged(this, "cantidadPublicacionesDeshabilitadas")
	}

	// BUSCADOR:
	
	def void setNombreDePublicacionBuscada(String nombre) {
		nombreDePublicacionBuscada = nombre
		buscador.setNombrePublicacionABuscar(nombre)
	}

	def String getNombreDePublicacionBuscada() {
		nombreDePublicacionBuscada
	}

	def void buscarPublicaciones() {
		buscador.search()
	}

//PANEL DE EDICION:

	def String getNombreDePublicacionSeleccionada() {
		this.publicacionSeleccionada.nombre
	}
	


//  METODOS EXPLICITOS DE ACTUALIZACION DE LA VISTA: 

	def void actualizarPanelEdicionPublicacion() {
		ObservableUtils.firePropertyChanged(this, "nombre")
		ObservableUtils.firePropertyChanged(this, "ratingPromedio")
		ObservableUtils.firePropertyChanged(this, "cantidadDeCalificaciones")
		ObservableUtils.firePropertyChanged(this, "publicacionHabilitada")
	}

	def void actualizarResumen() {
		firePropertyChanged(this, "cantidadPublicacionesRegistradas")
		this.actualizarResumenHabilitados()

	}

	def void actualizarResumenHabilitados() {
		firePropertyChanged(this, "cantidadPublicacionesHabilitadas")
		firePropertyChanged(this, "cantidadPublicacionesDeshabilitadas")
	}

//CARGO EL APPLICATION CONTEXT

	abstract def AdministradorDePublicaciones getRepoPublicaciones();
}
