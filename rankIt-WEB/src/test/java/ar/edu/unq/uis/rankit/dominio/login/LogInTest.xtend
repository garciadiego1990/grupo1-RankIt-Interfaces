package ar.edu.unq.uis.rankit.dominio.login

import org.junit.Test
import static org.junit.Assert.*

import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import ar.edu.unq.uis.rankIt.dominio.Usuario
import org.junit.Before
import ar.edu.unq.uis.rankIt.exceptions.UsuarioNoEncontradoException
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException

class LogInTest {

	var AdministradorDeUsuarios admin
	var LogIn login

	@Before
	def void setUp() {
		this.admin = new AdministradorDeUsuarios()
		this.admin => [
			agregarUsuario = new Usuario("UsuarioControl1Test", Usuario.contraseniaDefault)
			agregarUsuario = new Usuario("UsuarioControl2Test", Usuario.contraseniaDefault)
			agregarUsuario = new Usuario("UsuarioControl3Test", Usuario.contraseniaDefault)
		]

		this.login = new LogIn(this.admin)
	}

	@Test
	def void dadoUnUsuarioRegistradoEnLaAplicacionIntentoLoguearloConUnUsuarioYContraseñaCorrectosYSeLoguea() {
		var Usuario userTest = new Usuario("UsuarioTest", "password")
		this.admin.agregarUsuario = userTest

		assertEquals(this.login.logearUsuario("UsuarioTest", "password"), userTest)
	}

	@Test
	def void intentoLoguearAUnUsuarioQueNoExisteEnLaAplicacionYSeLanzaUnaUsuarioNoEncontradoException() {
		try {
			this.login.logearUsuario("UsuarioTest", "password")
			fail("No se lanzó UsuarioNoEncontradoException")
		} catch (UsuarioNoEncontradoException e) {
			assertTrue(true)
		}
	}

	@Test
	def void dadoUnUsuarioRegistradoEnLaAplicacionIntentoLoguearloConUnUsuarioCorrectoYContraseniaIncorrectaYSeLanzaUnaContraseniaDeUsuarioIncorrectaException() {
		var Usuario userTest = new Usuario("UsuarioTest", "password")
		this.admin.agregarUsuario = userTest
		try {
			this.login.logearUsuario("UsuarioTest", "passwordIncorrecto")
			fail("No se lanzó ContraseniaDeUsuarioIncorrectaException")
		} catch (ContraseniaDeUsuarioIncorrectaException e) {
			assertTrue(true)
		}
	}

}
