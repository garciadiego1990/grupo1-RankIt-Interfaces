package ar.edu.unq.uis.rankIt.usuarioApp

import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.uis.rankIt.controller.ControllerManager
import ar.edu.unq.uis.rankIt.bootstrap.BootstrapRankit

class RankItApp {

	def static void main(String[] args) {

		var bootstrap = new BootstrapRankit()
		bootstrap.run()
		
		XTRest.startInstance(new ControllerManager(), 9000)
	}
}
