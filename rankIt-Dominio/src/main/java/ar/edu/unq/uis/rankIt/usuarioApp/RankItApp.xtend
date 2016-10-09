package ar.edu.unq.uis.rankIt.usuarioApp

import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.uis.rankIt.controller.RankItController
import ar.edu.unq.uis.rankIt.DummyData.DummyData

class RankItApp {
	def static void main(String[] args) {

		XTRest.startInstance(new RankItController(new DummyData().adminGral), 9000)

//		var AdministradorGeneral admin = new AdministradorGeneral
//		var Usuario carlitox = new Usuario("carlitox", "123")
//		var Usuario alejo = new Usuario("alejo", "456")
//		var Publicacion p1 = new Publicacion("Lavanderia")
//		var Publicacion p2 = new Publicacion("Parque Pereyra-Iraola")
//		admin.adminCalificaciones.calificaciones.add(new Calificacion(p1, carlitox, 5, "Muy bueno", 1))
//		admin.adminCalificaciones.calificaciones.add(new Calificacion(p2, alejo, 4, "Muy malo", 2))
//		XTRest.startInstance(new RankItController(admin), 9000)
	}
}
