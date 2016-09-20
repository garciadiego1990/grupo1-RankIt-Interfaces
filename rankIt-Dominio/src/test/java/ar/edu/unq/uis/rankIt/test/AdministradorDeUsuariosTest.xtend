package ar.edu.unq.uis.rankIt.test

import org.junit.Test
import org.junit.Assert
import ar.edu.unq.uis.rankIt.dominio.Usuario

class AdministradorDeUsuariosTest extends BaseTest {
	
	@Test
	def void agregarUsuarioTest() {
		Assert.assertEquals(adminUsuarios.usuariosTotales, 6)
		var usuarioNicolas = new Usuario("Nicolas", Usuario.contraseniaDefault)
		adminUsuarios.agregarUsuario(usuarioNicolas)
		Assert.assertEquals(adminUsuarios.usuariosTotales, 7)
	}
	
	@Test
	def void usuariosActivosTest() {
		Assert.assertEquals(adminUsuarios.usuariosActivos, 0)
		usuarioPepe.estaActivo = true
		usuarioLuis.estaActivo = true
		Assert.assertEquals(adminUsuarios.usuariosActivos, 2)
	}
	
	@Test
	def void usuariosInactivosTest() {
		Assert.assertEquals(adminUsuarios.usuariosInactivos, 6)
		usuarioPepe.estaActivo = true
		Assert.assertEquals(adminUsuarios.usuariosInactivos, 5)
	}
	
	@Test
	def void usuariosBaneadosTest() {
		Assert.assertEquals(adminUsuarios.usuariosBaneados, 0)
		usuarioPepe.estaBaneado = true
		usuarioLuis.estaBaneado = true
		Assert.assertEquals(adminUsuarios.usuariosBaneados, 2)
	}
	
	@Test
	def void eliminarUsuarioTest() {
		Assert.assertEquals(adminUsuarios.usuariosTotales, 6)
		adminUsuarios.eliminarUsuario(usuarioPepe)
		Assert.assertEquals(adminUsuarios.usuariosTotales, 5)
	}
		
}