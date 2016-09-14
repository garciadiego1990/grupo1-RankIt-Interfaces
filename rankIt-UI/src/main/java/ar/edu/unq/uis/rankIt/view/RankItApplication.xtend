package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.Application
import ar.edu.unq.uis.rankIt.appModel.MenuAppModel
import ar.edu.unq.uis.rankIt.dummyData.Dummydata

class RankItApplication extends Application {

	override protected createMainWindow() {
////<<<<<<< HEAD
//		new MenuWindow(this, new MenuAppModel)
////=======
		val model = new MenuAppModel => [
			admin = new Dummydata().crearAdminGeneralDummy()
		]
//
		new MenuWindow(this, model)
////>>>>>>> af44ac69892fec2f44bc06e8424a4af2dc24bb79
	}

	def static void main(String[] args) {
		new RankItApplication().start()
	}

}
