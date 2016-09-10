package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.Application
import ar.edu.unq.uis.appModel.RankItAppModel
import ar.edu.unq.uis.rankIt.dominio.Administrador

class RankItApplication extends Application {
	
	override protected createMainWindow() {
		val model = new RankItAppModel => [
			admin = new Administrador()
		]
			new RankItComponentizadoWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new RankItApplication().start()
	}
	
}