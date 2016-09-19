package ar.edu.unq.uis.rankIt.appModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class MenuAppModel {
	
	val UsuariosAppModel usuariosAppModel
	val LugaresAppModel lugaresAppModel
	val ServiciosAppModel serviciosAppModel
	val CalificacionesAppModel calificacionesAppModel
	
	new() {
		this.usuariosAppModel = new UsuariosAppModel
		this.serviciosAppModel = new ServiciosAppModel
		this.lugaresAppModel = new LugaresAppModel
		this.calificacionesAppModel = new CalificacionesAppModel
	}

}