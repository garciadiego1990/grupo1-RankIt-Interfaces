package ar.edu.unq.uis.rankIt.dummyData

import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import ar.edu.unq.uis.rankIt.dominio.Publicacion

class Dummydata {
	
	def crearAdminGeneralDummy() {
		new AdministradorGeneral => [
			adminPublicaciones = crearAdminPublicaciones() 
		]
	}
	 
	def crearAdminPublicaciones() {
		 
		new AdministradorDePublicaciones => [
			agregarServicio(new Publicacion())
			agregarServicio(new Publicacion())
			agregarServicio(new Publicacion()) 
		]
		 
		
	}
	
	
	
}