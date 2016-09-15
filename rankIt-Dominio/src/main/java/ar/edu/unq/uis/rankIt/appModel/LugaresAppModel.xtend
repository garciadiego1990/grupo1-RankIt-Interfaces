package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import org.joda.time.DateTime
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.ApplicationContext
import static org.uqbar.commons.model.ObservableUtils.*
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class LugaresAppModel {
	
	AdministradorDePublicaciones admin 
	String nombreDeLugarBuscado
	var BuscadorDeLugares buscador
	Publicacion lugarSeleccionado
	
	new() {
		admin = getRepoLugares
		buscador = new BuscadorDeLugares(admin.todo)
	}
	
	def DateTime getFechaDeRegistro(){
		lugarSeleccionado.fechaDeRegistro
	}
	
	def String getNombre(){
		lugarSeleccionado.getNombre
	}
	
	def boolean estaHabilitado(){
		lugarSeleccionado.estaHabilitado
	}
	
	def int getCantidadDeCalificaciones(){
		getLugarSeleccionado.cantidadDeEvaluaciones
	} 
	
	def double getRatingPromedio(){
		if(lugarSeleccionado == null){
			0
		}else{
			lugarSeleccionado.ratingPromedio
		}
	}
	
	def void setLugarSeleccionado(Publicacion publicacion){
		this.lugarSeleccionado=publicacion
		ObservableUtils.firePropertyChanged(this,"ratingPromedio")
	}
	

	
	def crearNuevoLugar() {
	 	admin.agregar(new Publicacion())
		buscarLugares()
	 	actualizarResumen()
	 }
	
	
	def eliminarLugarSeleccionado() {
		this.admin.borrar(lugarSeleccionado)
		buscarLugares()
		actualizarResumen()
	}
	
	def setLugarSeleccionadoHabilitado(boolean estado) {
		lugarSeleccionado.estaHabilitado = estado
		actualizarResumenHabilitados()
	}
	
	//PANEL DE RESUMEN:

	
	def Integer getCantidadLugaresRegistrados() {
		admin.inscriptos
	}
	
	
	def Integer getCantidadLugaresHabilitados() {
		admin.habilitados
	}
	
	def int getCantidadLugaresDeshabilitados() {
		admin.deshabilitados
	}
	
	//BUSCADOR:

	def void setNombreDeLugarBuscado(String nombre) {
		this.nombreDeLugarBuscado = nombre
		this.buscador.setNombreLugarABuscar(nombre)
	}
	
	def String getNombreDeLugarBuscado() {
		nombreDeLugarBuscado
	}


	def void buscarLugares() {
		buscador.search()
	}
	
//PANEL DE EDICION:

	 def String getNombreDeLugarSeleccionado() {
	 	this.lugarSeleccionado.nombre
	 }
	 
//METODOS EXPLICITOS DE ACTUALIZACION DE LA VISTA:

	def void actualizarPanelEdicionUsuario() {
		firePropertyChanged(this, "nombreDeLugarSeleccionado")
	}


	def void actualizarResumen() {
		firePropertyChanged(this, "cantidadLugaresRegistrados")
		this.actualizarResumenHabilitados()
		
	}
	
	def void actualizarResumenHabilitados() {
		firePropertyChanged(this, "cantidadLugaresHabilitados")
		firePropertyChanged(this, "cantidadLugaresDeshabilitados")
	}
	
	
//CARGO EL APPLICATION CONTEXT

	def AdministradorDePublicaciones getRepoLugares() {
		ApplicationContext.instance.getSingleton(typeof(AdministradorDePublicaciones))
	}	
	 

	
	
	/* 
	def eliminarLugarSeleccionado() {
		admin.eliminarLugar(nombreDeLugarBuscado)
	}
	
		def int getLugaresHabilitados() {
			admin.lugaresHabilitados
	}
	
		def int getLugaresTotales() {
			admin.lugaresTotales
	}
	
	def int getLugaresDeshabilitados(){
		admin.lugaresDeshabilitados
	}
	
	def getRatingPromedio(){
		lugarSeleccionado.ratingPromedio
	}
	
	def getCantidadDeEvaluaciones(){
		lugarSeleccionado.cantidadDeEvaluaciones
	}
	* 
	*/
}