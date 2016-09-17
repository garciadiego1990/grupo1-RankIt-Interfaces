package ar.edu.unq.uis.rankIt.appModel

import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral

class LugaresAppModel extends PublicacionAppModel {
	
	/** Obtengo desde el {@link ApplicationContext} el {@link AdministradorDeLugares}.
	 * @author ae */
	override getRepoPublicaciones() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		adminGral.adminLugares
	}
	
}