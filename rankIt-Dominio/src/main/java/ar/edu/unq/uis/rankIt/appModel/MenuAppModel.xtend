package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class MenuAppModel {
	
	AdministradorGeneral admin
	
	
	
	
	def int getServiciosInscriptos() {
		return admin.serviciosTotales()
	}
	
	def int getLugaresInscriptos(){
		admin.lugaresTotales
	}
	
	
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