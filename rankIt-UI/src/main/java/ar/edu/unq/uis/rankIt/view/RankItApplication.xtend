package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.appModel.MenuRankItAppModel
import ar.edu.unq.uis.rankIt.dominio.Administrador
import org.uqbar.arena.Application

class RankItApplication extends Application {

	override protected createMainWindow() {
		val model = new MenuRankItAppModel => [
			admin = new Administrador()
		]

		new MenuWindow(this, model)
	}

	def static void main(String[] args) {
		new RankItApplication().start()
	}

}
