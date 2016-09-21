package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class MenuAppModel {
	
	val UsuariosAppModel appModelUsuarios
	val LugaresAppModel appModelLugares
	val ServiciosAppModel appModelServicios
	val CalificacionesAppModel appModelCalificaciones
	
	new() {
		this.appModelUsuarios = AppModelsSingleton.instance.appModelUsuarios
		this.appModelServicios = AppModelsSingleton.instance.appModelServicios
		this.appModelLugares = AppModelsSingleton.instance.appModelLugares
		this.appModelCalificaciones = AppModelsSingleton.instance.appModelCalificaciones
	}
}