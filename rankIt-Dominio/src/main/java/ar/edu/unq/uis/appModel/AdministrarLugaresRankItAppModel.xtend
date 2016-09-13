package ar.edu.unq.uis.appModel

import ar.edu.unq.uis.rankIt.dominio.Administrador
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministrarLugaresRankItAppModel {
	var Administrador admin = new Administrador()
	var Publicacion lugarSeleccionado
	var String nombreDeLugarBuscado
	
	new(){}
	
	def eliminarLugarSeleccionado(){
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
		//lugarSeleccionado.ratingPromedio
	}
	
	def getCantidadDeEvaluaciones(){
		lugarSeleccionado.cantidadDeEvaluaciones
	}
}