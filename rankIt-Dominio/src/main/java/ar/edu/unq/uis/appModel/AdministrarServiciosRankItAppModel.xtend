package ar.edu.unq.uis.appModel

import ar.edu.unq.uis.rankIt.dominio.Administrador
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministrarServiciosRankItAppModel {
	var Administrador admin = new Administrador()
	var Publicacion servicioSeleccionado
	var String nombreDeServicioBuscado
	
	new(){}
	
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
	
}