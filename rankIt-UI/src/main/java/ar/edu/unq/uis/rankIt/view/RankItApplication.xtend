package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.Application
import ar.edu.unq.uis.rankIt.appModel.MenuAppModel
import ar.edu.unq.uis.rankIt.view.runnable.RankItBootstrap

class RankItApplication extends Application {
	
	val static final RankItBootstrap BOOT = new RankItBootstrap
	
	new() {
		super(BOOT)
	}

	override protected createMainWindow() {
		val model = new MenuAppModel
		new MenuWindow(this, model)
	}

	def static void main(String[] args) {
		new RankItApplication().start()
	}

}
