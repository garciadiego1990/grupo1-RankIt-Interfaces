package ar.edu.unq.uis.rankIt.test

import org.junit.Test
import org.junit.Assert
import ar.edu.unq.uis.rankIt.dominio.Publicacion

class AdministradorDePublicacionesTest extends BaseTest {
	
	@Test
	def void agregarTest() {
		Assert.assertEquals(adminServicios.inscriptos, 3)
		var servicioNetFilx = new Publicacion("netFilx")
		adminServicios.agregar(servicioNetFilx)
		Assert.assertEquals(adminServicios.inscriptos, 4)
	}
	
	@Test
	def void habilitadosTest() {
		Assert.assertEquals(adminServicios.habilitados, 0)
		servicioSpeedy.estaHabilitado = true
		servicioTelefonica.estaHabilitado = true
		Assert.assertEquals(adminServicios.habilitados, 2)
	}
	
	@Test
	def void deshabilitadosTest() {
		Assert.assertEquals(adminServicios.deshabilitados, 3)
		servicioSpeedy.estaHabilitado = true
		Assert.assertEquals(adminServicios.deshabilitados, 2)
	}
	
	@Test
	def void borrarTest() {
		Assert.assertEquals(adminServicios.inscriptos, 3)
		adminServicios.borrar(servicioSpeedy)
		Assert.assertEquals(adminServicios.inscriptos, 2)
	}
	
	@Test
	def void buscarTest() {
		Assert.assertEquals(adminServicios.buscar(servicioSpeedy).nombre, "Speedy")
		var servicioRoca = new Publicacion("ferrocarrilesRoca")
		Assert.assertEquals(adminServicios.buscar(servicioRoca), null)
	}
		
}