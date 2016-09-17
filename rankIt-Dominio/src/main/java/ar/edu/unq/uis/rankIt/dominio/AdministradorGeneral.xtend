package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministradorGeneral {
	AdministradorDeUsuarios adminUsuarios = new AdministradorDeUsuarios
	AdministradorDeCalificaciones adminCalificaciones = new AdministradorDeCalificaciones
	AdministradorDePublicaciones adminServicios = new AdministradorDePublicaciones	
	AdministradorDePublicaciones adminLugares = new AdministradorDePublicaciones
	
}