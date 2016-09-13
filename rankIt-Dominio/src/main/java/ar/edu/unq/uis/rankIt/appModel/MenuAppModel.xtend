package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral

/** 
 * Clase AppModel para la vista del menú de RankIt, módulo de administador.
 * */
@Accessors
@Observable
class MenuAppModel {
	
	AdministradorGeneral admin
	
	/*  
	def String getEstadisticasUsuarios() {
		this.admin.usuariosActivos+" / "+this.administrador.usuariosTotales+" ( "+this.administrador.usuariosBaneados+" )"
	}
	

	def String getEstadisticasCalificaciones() {
		"TODO - Incompleto"
	}
	
	 
	def String getEstadisticasServicios() {
		this.administrador.serviciosHabilitados+" / "+this.administrador.serviciosTotales
	}
	
	
	def String getEstadisticasLugares() {
		this.administrador.lugaresHabilitados+" / "+this.administrador.lugaresTotales
	}
	*/
}