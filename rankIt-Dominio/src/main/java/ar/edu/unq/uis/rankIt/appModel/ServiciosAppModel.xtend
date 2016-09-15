package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.ApplicationContext

@Accessors
@Observable
class ServiciosAppModel {
	AdministradorDePublicaciones admin
	Publicacion publicacionSeleccionada
	int serviciosInscriptos
	int serviciosHabilitados

	new(AdministradorDePublicaciones admin) {
		this.admin = this.repoServicios
	}

	
	def nuevoServicio() {
		var servicio = new Publicacion()
		admin.agregar(servicio)
	}
	
	
	def eliminarServicio() {
		admin.borrar(publicacionSeleccionada)
	}
	
	def setServiciosInscriptos() {
		serviciosInscriptos = admin.inscriptos()
	}
	
	def int getServiciosInscriptos() {
		return serviciosInscriptos
	}
	
	def setServiciosHabilitados() {
		serviciosHabilitados = admin.habilitados()
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
	
//CARGO EL APPLICATION CONTEXT
	/**@author Abel */
	def AdministradorDePublicaciones getRepoServicios() {
		ApplicationContext.instance.getSingleton(typeof(AdministradorDePublicaciones))
	}	
}