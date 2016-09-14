package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.appModel.MenuRankItAppModel
import ar.edu.unq.uis.rankIt.dominio.Administrador
import org.uqbar.arena.Application

class RankItApplication extends Application {

	override protected createMainWindow() {
		new MenuWindow(this, new MenuRankItAppModel)
	}

	def static void main(String[] args) {
		new RankItApplication().start()
	}

}
