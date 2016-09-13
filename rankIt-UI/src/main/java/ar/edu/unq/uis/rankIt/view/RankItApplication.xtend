package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.Application
import ar.edu.unq.uis.rankIt.appModel.MenuAppModel
import ar.edu.unq.uis.rankIt.dummyData.Dummydata

class RankItApplication extends Application {

	override protected createMainWindow() {
		val model = new MenuAppModel => [
			admin = new Dummydata().crearAdminGeneralDummy()
		]

		new MenuWindow(this, model)
	}

	def static void main(String[] args) {
		new RankItApplication().start()
	}

}
