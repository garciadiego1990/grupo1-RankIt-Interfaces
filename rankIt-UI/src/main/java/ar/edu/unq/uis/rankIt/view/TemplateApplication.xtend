package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.Application
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios

class TemplateApplication extends Application {
	
	override protected createMainWindow() {
		new AdministradorUsuariosWindow(this, new AdministradorDeUsuarios)
	}
	
	def static void main(String[] args) {
		new TemplateApplication().start
	}
}