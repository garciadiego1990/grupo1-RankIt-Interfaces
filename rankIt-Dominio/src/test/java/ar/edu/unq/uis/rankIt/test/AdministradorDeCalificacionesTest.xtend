package ar.edu.unq.uis.rankIt.test

import org.junit.Test
import org.junit.Assert
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Usuario
import org.junit.Before
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones

class AdministradorDeCalificacionesTest extends BaseTest {
	
	var Publicacion publicacion1
	var Publicacion publicacion2
	var Publicacion publicacion3
	var Publicacion publicacion4
	var Calificacion calificacion1
	var Calificacion calificacion2
	var AdministradorDeCalificaciones adminCalificaciones
	
	@Before
	override void setUp(){
		publicacion1 = new Publicacion()
		publicacion2 = new Publicacion()
		publicacion3 = new Publicacion()
		publicacion4 = new Publicacion()
		adminCalificaciones = new AdministradorDeCalificaciones()
		calificacion1 = new Calificacion(publicacion1, new Usuario("user", "1234" ), 2, "test")
		calificacion2 = new Calificacion(publicacion2, new Usuario("user", "1234" ), 2, "test")
	}
	
//AGREGAR, ELIMINAR UNA CALIFICACION	
	
	/** Dada una calificación y un administrador de calificaciones, agrego dicha calificación
	 * a través del administrador. Al realizar esta acción, la calificación deberá estar agregada
	 * a la publicación evaluada.
	 * @author ae */
	@Test
	def void testDadaUnaCalificacionLaAgregoATravesDelAdminDeCalificacionesYTesteoSiFueAgregada() {
		Assert.assertFalse(publicacion1.calificaciones.contains(calificacion1))
		adminCalificaciones.agregarCalificacion(calificacion1)
		Assert.assertTrue(publicacion1.calificaciones.contains(calificacion1))
	}
	
	
	/** Dada una calificación y un administrador de calificaciones, borro dicha calificación
	 * a través del administrador. Al realizar esta acción, la calificación deberá estar eliminada
	 * de la publicación que la poseia.
	 * @author ae */
	@Test
	def void testDadaUnaCalificacionLaBorroATravesDelAdminDeCalificacionesYTesteoSiFueBorrada() {
		publicacion1.calificaciones.add(calificacion1)
		Assert.assertTrue(publicacion1.calificaciones.contains(calificacion1))
		adminCalificaciones.eliminarCalificacion(calificacion1)
		Assert.assertFalse(publicacion1.calificaciones.contains(calificacion1))
	}
	
//CONSULTAS CALIFICACIONES
	
	/** Dado un administrador de calificaciones con cuatro publicaciones de las cuales dos contienen
	 * una calificación cada una, cuento la cantidad calificaciones. El administrador debe tener dos
	 * calificaciones.
	 * @author ae */
	@Test
	def void testDadoUnAdministradorDeCalificacionesCuentoLaCantidadDeCalificaciones() {
		//Publicaciones con calificaciones
		adminCalificaciones.servicios.add(publicacion1)
		adminCalificaciones.lugares.add(publicacion2)
		
		//Publicaciones sin calificaciones
		adminCalificaciones.servicios.add(publicacion3)
		adminCalificaciones.lugares.add(publicacion4)
		
		adminCalificaciones.agregarCalificacion(calificacion1)
		adminCalificaciones.agregarCalificacion(calificacion2)

		Assert.assertEquals(adminCalificaciones.calificaciones.size, 2)
	}
	
	
	/** Dado un administrador de calificaciones, inicialmente sin publicaciones, le agrego cuatro
	 *  publicaciones: dos en la lista de servicios y dos en la lista de lugares.
	 *  Luego consulto todas sus publicaciones y compruebo si tiene las 4 insertadas previamente.
	 * @author ae */
	@Test
	def void testDadoUnAdministradorDeCalificacionesLePidoTodasLasPublicacionesYMeLasDevuelve() {
		adminCalificaciones.servicios.add(publicacion1)
		adminCalificaciones.servicios.add(publicacion2)
		adminCalificaciones.lugares.add(publicacion3)
		adminCalificaciones.lugares.add(publicacion4)
		
		Assert.assertEquals(adminCalificaciones.publicaciones.size, 4)
	}
	
}