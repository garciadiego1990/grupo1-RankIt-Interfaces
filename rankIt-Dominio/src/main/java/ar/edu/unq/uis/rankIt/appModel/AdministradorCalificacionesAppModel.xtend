package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones

@Accessors
@Observable
class AdministradorCalificacionesAppModel {
	AdministradorDeCalificaciones admin
	
	
	new(AdministradorDeCalificaciones admin) {
		this.admin = admin
	}
}