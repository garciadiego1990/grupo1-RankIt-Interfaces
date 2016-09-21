package ar.edu.unq.uis.rankIt.test

import org.junit.Test
import org.junit.Assert
import ar.edu.unq.uis.rankIt.dominio.Calificacion

class PublicacionTest extends BaseTest {
		
	@Test 
	def void ratingPromedioTest() {
		Assert.assertEquals(servicioSpeedy.ratingPromedio, 4, 0f)
	}
	
	@Test
	def void ratingPromedioSinCalificacionesTest() {
		servicioSpeedy.eliminarCalificacion(calificacionSpeedyPepe) // elimino la calificacion que ya tenia
		Assert.assertEquals(servicioSpeedy.ratingPromedio, 0, 0f)
	}
	
	@Test
	def void ratingPromedioConCalificacionesTest() {
		var Calificacion calificacionSpeedyPepe9 = new Calificacion(servicioSpeedy, usuarioPepe, 9, "tengo mas megas de los que pago")
		var Calificacion calificacionSpeedyPepe8 = new Calificacion(servicioSpeedy, usuarioPepe, 8, "no se corta nunca")
		servicioSpeedy.agregarCalificacion(calificacionSpeedyPepe9)
		servicioSpeedy.agregarCalificacion(calificacionSpeedyPepe8)
		Assert.assertEquals(servicioSpeedy.ratingPromedio, 7, 0f)
	}
}