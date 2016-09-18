package ar.edu.unq.uis.rankIt.appModel

import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral

class ServiciosAppModel extends PublicacionAppModel {
	
	override getRepoPublicaciones() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		adminGral.adminServicios
	}
	
}