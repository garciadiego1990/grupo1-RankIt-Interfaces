package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.dominio.Administrador
import org.junit.Test
import org.junit.Assert

class AdministradorTest {
		Administrador admin = new Administrador()
	
	@Test
	def void testAgregarServicio(){
		Assert.assertTrue(admin.servicios.length == 0)
		admin.agregarServicio("Servicio Tecnico de PC")
		Assert.assertTrue(admin.getServicios.length == 1)
	}
	
	@Test
	def void testAgregarLugar(){
		Assert.assertTrue(admin.lugares.length == 0)
		admin.agregarLugar("Parque Pereyra")
		Assert.assertTrue(admin.getLugares.length == 1)
	}
 
	@Test 
	def void testEliminarServicio(){
		admin.agregarServicio("Servicio Tecnico de PC")
		admin.eliminarServicio("Servicio Tecnico de PC")
		Assert.assertEquals(admin.servicios.length, 0)
	}
	
	@Test 
	def void testEliminarLugar(){
		admin.agregarLugar("Parque Pereyra")
		Assert.assertTrue(admin.getLugares.length == 1)
		admin.eliminarLugar("Parque Pereyra")
		Assert.assertEquals(admin.lugares.length, 0)
	}
	
}