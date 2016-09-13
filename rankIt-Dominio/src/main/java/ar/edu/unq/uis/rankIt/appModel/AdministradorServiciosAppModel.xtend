package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministradorServiciosAppModel {
	AdministradorDePublicaciones admin
	Publicacion publicacionSeleccionada
	int serviciosInscriptos
	int serviciosHabilitados

	
	def nuevoServicio() {
		var servicio = new Publicacion()
		admin.agregarServicio(servicio)
	}
	
	def eliminarServicio() {
		admin.borrarServicio(publicacionSeleccionada)
	}
	
	def setServiciosInscriptos() {
		serviciosInscriptos = admin.serviciosInscriptos()
	}
	
	def int getServiciosInscriptos() {
		return serviciosInscriptos
	}
	
	def setServiciosHabilitados() {
		serviciosHabilitados = admin.serviciosHabilitados()
	}
	/* 
	def int getServiciosHabilitados() {
		return serviciosHabilitados
	}
	
	def eliminarServicioSeleccionado(){
		admin.eliminarServicio(nombreDeServicioBuscado)
	}
	
	def int getServiciosHabilitados() {
		admin.serviciosHabilitados
	}
	
	def int getServiciosTotales() {
		admin.serviciosTotales
	}
	
	def int getServiciosDeshabilitados(){
		admin.serviciosDeshabilitados
	}
	
	def getRatingPromedio(){
		servicioSeleccionado.ratingPromedio
	}
	
	def getCantidadDeEvaluaciones(){
		servicioSeleccionado.cantidadDeEvaluaciones
	}
	* 
	*/
}