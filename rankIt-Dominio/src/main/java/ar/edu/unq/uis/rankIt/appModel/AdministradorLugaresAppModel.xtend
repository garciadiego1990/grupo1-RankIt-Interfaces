package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones

@Accessors
@Observable
class AdministradorLugaresAppModel {
	
	AdministradorDePublicaciones admin 
	Publicacion lugarSeleccionado
	String nombreDeLugarBuscado
	
	new(AdministradorDePublicaciones admin) {
		this.admin = admin
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