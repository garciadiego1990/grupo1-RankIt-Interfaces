package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.Application
import ar.edu.unq.uis.appModel.MenuRankItAppModel
import ar.edu.unq.uis.rankIt.dominio.Administrador

class RankItApplication extends Application {
	
	override protected createMainWindow() {
		//MenuRankItAppModel
		val model = new MenuRankItAppModel => [
			admin = new Administrador()
		]
		
		new RankItComponentizadoWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new RankItApplication().start()
	}
	
}