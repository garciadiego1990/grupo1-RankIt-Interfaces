package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministradorGeneral {
	AdministradorDeUsuarios adminUsuarios
	AdministradorDeCalificaciones adminCalificaciones
	AdministradorDePublicaciones adminServicios	
	AdministradorDePublicaciones adminLugares
	
	new(){
		this.adminUsuarios = new AdministradorDeUsuarios
		this.adminCalificaciones = new AdministradorDeCalificaciones
		
		this.adminServicios = new AdministradorDePublicaciones
		this.adminServicios.tipo = "SERVICIO"
		
		this.adminLugares = new AdministradorDePublicaciones
		this.adminLugares.tipo = "LUGAR"
	}
}