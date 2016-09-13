package ar.edu.unq.uis.rankIt.view.applicationAdminServicios

import org.uqbar.arena.Application
import ar.edu.unq.uis.rankIt.appModel.AdminServiciosAppModel
import ar.edu.unq.uis.rankIt.view.AdminServiciosWindow
import ar.edu.unq.uis.rankIt.dummyData.DummydataAdminPublicaciones

class RankItApplicationAdminServicios extends Application {
	
	override protected createMainWindow() {
		val model = new AdminServiciosAppModel => [
			admin = new DummydataAdminPublicaciones().crearAdminPublicacionesDummy
			publicacionSeleccionada = admin.servicios.get(0)
		]
			new AdminServiciosWindow(this, model) 
	}
	
	def static void main(String[] args) {
		new RankItApplicationAdminServicios().start()
	}

}

