package ar.edu.unq.uis.rankIt.usuarioApp

import ar.edu.unq.uis.rankIt.appModel.UsuariosAppModel
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.uis.rankIt.controller.UsuarioController

class UsuarioApp {
	
	
	
	def static void main(String[] args) {
		var AdministradorGeneral adminGeneral
		var AdministradorDeUsuarios adminUsuarios
		var UsuariosAppModel usuarioAppModel 
	
		ApplicationContext.instance.configureSingleton(typeof(AdministradorGeneral), new AdministradorGeneral)
	
		adminGeneral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral)) as  AdministradorGeneral
		adminUsuarios = adminGeneral.getAdminUsuarios
	
		usuarioAppModel = new UsuariosAppModel() 
		usuarioAppModel.admin = adminUsuarios
	

    	XTRest.startInstance(new UsuarioController(usuarioAppModel), 9000)     
   }
}