package ar.edu.unq.uis.rankIt.view.runnable

import org.uqbar.arena.Application
import ar.edu.unq.uis.rankIt.appModel.MenuAppModel
import ar.edu.unq.uis.rankIt.bootstrap.BootstrapRankit

class RankItApplication extends Application {
	
	val static final BootstrapRankit BOOT = new BootstrapRankit
	
	new() {
		super(BOOT)
	}

	override protected createMainWindow() {
		val model = new MenuAppModel
		new ar.edu.unq.uis.rankIt.view.MenuWindow(this, model)
	}

	def static void main(String[] args) {
		new RankItApplication().start()
	}

}
