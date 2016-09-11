package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.Application
import ar.edu.unq.uis.appModel.MenuRankItAppModel
import ar.edu.unq.uis.rankIt.dominio.Administrador
import ar.edu.unq.uis.appModel.RankItAppModel
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral

class RankItApplication extends Application {
	
	override protected createMainWindow() {
		//MenuRankItAppModel
		val model = new RankItAppModel => [
			admin = new AdministradorGeneral()
		]
		new RankItComponentizadoWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new RankItApplication().start()
	}
	
}