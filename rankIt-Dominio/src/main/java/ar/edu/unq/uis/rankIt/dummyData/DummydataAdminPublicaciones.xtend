package ar.edu.unq.uis.rankIt.dummyData

import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import ar.edu.unq.uis.rankIt.dominio.Publicacion

class DummydataAdminPublicaciones {
	
	
	def crearAdminPublicacionesDummy() {
		new AdministradorDePublicaciones => [
			agregarServicio(new Publicacion("Speedy"))
			agregarServicio(new Publicacion("servicio1"))
			agregarServicio(new Publicacion("servicio2")) 
		]
	}
}