package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.appModel.UsuariosAppModel
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class UsuariosAppModelTest extends BaseTest {
	UsuariosAppModel usuariosAppModel
	
	@Before
	override void setUp() {
		super.setUp()
		usuariosAppModel = new UsuariosAppModel() 
		usuariosAppModel.admin = adminUsuarios
		
	}
	
	@Test
	def void getUsuariosRegistradosTest() {
		
		Assert.assertEquals(usuariosAppModel.getUsuariosRegistrados, 6)
	}
}