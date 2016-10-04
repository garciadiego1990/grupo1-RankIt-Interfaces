package ar.edu.unq.uis.rankIt.usuarioApp

import ar.edu.unq.uis.rankIt.appModel.UsuariosAppModel
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.uis.rankIt.controller.UsuarioController
import ar.edu.unq.uis.rankIt.appModel.ServiciosAppModel
import ar.edu.unq.uis.rankIt.appModel.LugaresAppModel
import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones

class UsuarioApp {
	
	
	
	def static void main(String[] args) {
		var AdministradorGeneral adminGeneral
		var AdministradorDeUsuarios adminUsuarios
		var AdministradorDePublicaciones adminServicios
		var AdministradorDePublicaciones adminLugares
		var UsuariosAppModel usuarioAppModel
		var ServiciosAppModel servicioAppModel
		var LugaresAppModel lugaresAppModel 
	
		ApplicationContext.instance.configureSingleton(typeof(AdministradorGeneral), new AdministradorGeneral)
	
		adminGeneral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral)) as  AdministradorGeneral
		adminUsuarios = adminGeneral.getAdminUsuarios
		adminServicios = adminGeneral.getAdminServicios
		adminLugares = adminGeneral.getAdminLugares
	
		usuarioAppModel = new UsuariosAppModel() 
		usuarioAppModel.admin = adminUsuarios
		
		servicioAppModel = new ServiciosAppModel()
		servicioAppModel.admin = adminServicios
		
		lugaresAppModel = new LugaresAppModel()
		lugaresAppModel.admin = adminLugares
	

    	XTRest.startInstance(new UsuarioController(usuarioAppModel, servicioAppModel, lugaresAppModel), 9000)     
   }
}