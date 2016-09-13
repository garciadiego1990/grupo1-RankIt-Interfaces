package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.dominio.Administrador

import ar.edu.unq.uis.rankIt.dominio.AdministradorCalificaciones
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import org.junit.Before
import org.junit.Assert
import org.junit.Test


class AdministradorCalificacionesTest {
	/* 
	var Administrador admin = new Administrador
	var AdministradorCalificaciones adminC = new AdministradorCalificaciones(admin)
	
	//@Before
	def void setUp() {
		var Calificacion c1 = new Calificacion
		var Calificacion c2 = new Calificacion
		var Calificacion c3 = new Calificacion

		var Publicacion p1 = new Publicacion("p1")
		var Publicacion p2 = new Publicacion("p2")
		var Publicacion p3 = new Publicacion("p3")
		var Publicacion p4 = new Publicacion("p4")

		c1.setEsOfensiva(true)
		c2.setEsOfensiva(true)
		p1.calificaciones.add(c1)
		p1.calificaciones.add(c2)
		p2.calificaciones.add(c2)
		p2.calificaciones.add(c3)
		p3.calificaciones.add(c1)
		p4.calificaciones.add(c1)
		p4.calificaciones.add(c2)
		p4.calificaciones.add(c3)
		adminC.admin.servicios.add(p1)
		adminC.admin.servicios.add(p2)
		adminC.admin.servicios.add(p3)
		adminC.admin.lugares.add(p4)
	}

	@Test
	def void testTotalDeEvaluaciones() {
		//adminC.calificacionesDeLugaresYServicios
		setUp
		Assert.assertTrue(adminC.totalDeEvaluaciones == 0)
	}
/* 
	@Test
	def void testCantidadCalificacionesOfensiva() {
		setUp()
		Assert.assertTrue(adminC.calificacionesOfensivas == 6)
	}
*/

}
