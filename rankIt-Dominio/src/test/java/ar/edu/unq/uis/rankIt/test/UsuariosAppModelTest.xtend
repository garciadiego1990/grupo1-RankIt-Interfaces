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
	// Se muestra brevemente el estado de los usuarios en el admin previamente agregados
	def void setUpStadoTest() {
		Assert.assertEquals(usuariosAppModel.getRegistrados, 6)
		Assert.assertEquals(usuariosAppModel.getActivos, 0)
		Assert.assertEquals(usuariosAppModel.getInactivos, 6)
		Assert.assertEquals(usuariosAppModel.getBaneados, 0)
	}
	
	@Test
	// Se crea un nuevo usuario con valores por defecto
	def void crearNuevoUsuarioTest() {
		usuariosAppModel.crearNuevoUsuario
		Assert.assertEquals(usuariosAppModel.getRegistrados, 7)
		Assert.assertEquals(usuariosAppModel.getActivos, 0)
		Assert.assertEquals(usuariosAppModel.getInactivos, 7)
		Assert.assertEquals(usuariosAppModel.getBaneados, 0)
	}
	
	@Test
	// Se elimina un usuario previamente agregado(usuarioPepe)
	def void eliminarUsuarioSeleccionadoTest() {
		usuariosAppModel.usuarioSeleccionado = usuarioPepe
		usuariosAppModel.eliminarUsuarioSeleccionado
		Assert.assertEquals(usuariosAppModel.getRegistrados, 5)
		Assert.assertEquals(usuariosAppModel.getActivos, 0)
		Assert.assertEquals(usuariosAppModel.getInactivos, 5)
		Assert.assertEquals(usuariosAppModel.getBaneados, 0)
	}
	
	@Test
	// Se le setea el estado activo del usuario seleccionado
	def void setUsuarioSeleccionadoActivoTest() {
		usuariosAppModel.usuarioSeleccionado = usuarioPepe
		usuariosAppModel.setUsuarioSeleccionadoActivo(true)
		Assert.assertEquals(usuariosAppModel.getActivos, 1)
		Assert.assertEquals(usuariosAppModel.getInactivos, 5)
	}
	
	@Test
	// Se le setea el estado baneado al usuario seleccionado, al darse esto el usuario pasa a estar inactivo
	def void setUsuarioSeleccionadoBaneadoTest() {
		usuariosAppModel.usuarioSeleccionado = usuarioPepe
		usuariosAppModel.setUsuarioSeleccionadoActivo(true)
		Assert.assertEquals(usuariosAppModel.getActivos, 1)
		usuariosAppModel.setUsuarioSeleccionadoBaneado(true)	
		Assert.assertEquals(usuariosAppModel.getBaneados, 1)
		Assert.assertEquals(usuariosAppModel.getActivos, 0)
	}
	
	@Test
	// devuelve el estado baneado del usuario seleccionado
	def void getUsuarioSeleccionadoBaneadoTest() {
		usuariosAppModel.usuarioSeleccionado = usuarioPepe
		Assert.assertFalse(usuariosAppModel.getUsuarioSeleccionadoBaneado)
	}
	
	@Test
	// 
	def void setNombreABuscarTest() {
		usuariosAppModel.setNombreABuscar("usuarioPepe")
		Assert.assertEquals(usuariosAppModel.nombreABuscar, "usuarioPepe")
	}
	
	@Test
	def void blanquearContraseniaTest() {
		usuariosAppModel.usuarioSeleccionado = usuarioPepe
		usuariosAppModel.blanquearContrasenia()
		Assert.assertEquals(usuariosAppModel.usuarioSeleccionado.contrasenia, "123")
	}
	
	@Test
	// Setea el usuario seleccionado actual
	def void setUsuarioSeleccionadoTest() {
		usuariosAppModel.setUsuarioSeleccionado(usuarioPepe)
		Assert.assertEquals(usuariosAppModel.getUsuarioSeleccionadoActivo, false)
		Assert.assertEquals(usuariosAppModel.getUsuarioSeleccionadoBaneado, false)
	}
	
	
	
	
}
