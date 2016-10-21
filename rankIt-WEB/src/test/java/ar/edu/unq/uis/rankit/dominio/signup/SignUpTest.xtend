package ar.edu.unq.uis.rankit.dominio.signup

import org.junit.Test
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import org.junit.Before
import static org.junit.Assert.*
import ar.edu.unq.uis.rankIt.exceptions.NombreDeUsuarioInvalidoException

class SignUpTest {
	
	var AdministradorDeUsuarios admin
	var SignUp signup
	
	@Before
	def void setUp(){
		this.admin = new AdministradorDeUsuarios()
		this.admin.agregarUsuario(new Usuario("UsuarioControl1", "9999"))
		this.admin.agregarUsuario(new Usuario("UsuarioControl2", "9999"))
		this.admin.agregarUsuario(new Usuario("UsuarioControl3", "9999"))
		this.signup = new SignUp(this.admin)
	}
	
	@Test
	def void dadoUnNombreDeUsuarioYContraseñaIntentoRegistrarloYLoRegistroEnLaAplicacion() {
		var Usuario usuarioNuevo =
		this.signup.registrarUsuario("NuevoUsuarioTest", "9999")
		
		assertTrue(this.admin.usuarios.contains(usuarioNuevo))
	}
	
	@Test
	def void dadoUnNombreDeUsuarioQueYaEstaSiendoUtilizadoPorOtroUsuarioEnLaAplicaiconIntentoRegistrarloYLanzaNombreDeUsuarioInvalidoException() {
		try {
			this.signup.registrarUsuario("UsuarioControl1", "9999")
			fail("Nunca de lanzo la excepción NombreDeUsuarioInvalidoException")
		}
		catch(NombreDeUsuarioInvalidoException e) {
			assertTrue(true)
		}
	}
	
	@Test
	def void dadoUnNombreDeUsuarioVacioIntentoRegistrarloYLanzaNombreDeUsuarioInvalidoException() {
		try {
			this.signup.registrarUsuario("", "9999")
			fail("Nunca de lanzo la excepción NombreDeUsuarioInvalidoException")
		}
		catch(NombreDeUsuarioInvalidoException e) {
			assertTrue(true)
		}
	}
	
}