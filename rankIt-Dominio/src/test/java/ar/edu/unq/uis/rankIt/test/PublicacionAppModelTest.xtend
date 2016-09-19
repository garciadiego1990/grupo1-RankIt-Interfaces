package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.appModel.LugaresAppModel
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones

class PublicacionAppModelTest extends BaseTest {
	LugaresAppModel lugaresAppModel
	
	@Before
	override void setUp() {
		super.setUp()
		lugaresAppModel = new LugaresAppModel() 
		lugaresAppModel.admin = new AdministradorDePublicaciones()
	}
	
	@Test
	def void getCantidadDeCalificaciones() {
		Assert.assertEquals(lugaresAppModel.getCantidadDeCalificaciones, 0)
	}
	
	
}