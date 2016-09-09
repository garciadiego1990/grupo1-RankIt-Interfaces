package ar.edu.unq.uis.rankIt.test

import org.junit.Test
import org.junit.Assert
import ar.edu.unq.uis.appModel.AdminCalificacionesAppModel
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Publicacion


class AdminCalificacionesAppModelTest {
	var AdminCalificacionesAppModel appM = new AdminCalificacionesAppModel()
	
	Calificacion c1 = new Calificacion
	Calificacion c2 = new Calificacion
	Calificacion c3 = new Calificacion
	
	Publicacion p1 = new Publicacion("p1")
	Publicacion p2 = new Publicacion("p2")
	Publicacion p3 = new Publicacion("p3")
	Publicacion p4 = new Publicacion("p4")
	
	def void setUp(){
		p1.calificaciones.add(c1)
		p1.calificaciones.add(c2)
		p2.calificaciones.add(c2)
		p2.calificaciones.add(c3)
		p3.calificaciones.add(c1)
		p4.calificaciones.add(c1)
		p4.calificaciones.add(c2)
		p4.calificaciones.add(c3)
		appM.admin.servicios.add(p1)
		appM.admin.servicios.add(p2)
		appM.admin.servicios.add(p3)
		appM.admin.lugares.add(p4)
	}

	
	@Test
	def void testAgregarServicio(){
		Assert.assertTrue(appM.todasLasCalificaciones.size ==0)
		setUp()
		appM.lugaresYServicios
		Assert.assertTrue(appM.todasLasCalificaciones.size ==8)
	}
}
