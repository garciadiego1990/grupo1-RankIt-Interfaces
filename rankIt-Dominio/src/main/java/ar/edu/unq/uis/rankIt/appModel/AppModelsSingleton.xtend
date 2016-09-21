package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AppModelsSingleton {
	
	public val static instance = new AppModelsSingleton()
	
	val UsuariosAppModel appModelUsuarios = new UsuariosAppModel()
	val LugaresAppModel appModelLugares = new LugaresAppModel()
	val ServiciosAppModel appModelServicios = new ServiciosAppModel()
	val CalificacionesAppModel appModelCalificaciones = new CalificacionesAppModel()
	
}