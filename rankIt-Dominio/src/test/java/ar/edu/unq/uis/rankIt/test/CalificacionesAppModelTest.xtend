package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.appModel.CalificacionesAppModel
import org.junit.Before
import org.junit.Test
import org.junit.Assert

class CalificacionesAppModelTest extends BaseTest {
	CalificacionesAppModel calificacionesAppModel
	
	@Before
	override void setUp() {
		super.setUp()
		calificacionesAppModel = new CalificacionesAppModel() 
		calificacionesAppModel.admin = adminCalificaciones
	}
	
	
	@Test
	def void getPublicacionesTest() {
		calificacionesAppModel.admin.servicios.add(servicioSpeedy)
		calificacionesAppModel.admin.servicios.add(servicioTelefonica)
		calificacionesAppModel.admin.lugares.add(lugarEasy)
		calificacionesAppModel.admin.lugares.add(lugarAltoAvellaneda)
		Assert.assertEquals(calificacionesAppModel.getPublicaciones.size, 4)
	}
	
	@Test
	def void getNombreUsuarioTest() {
		calificacionesAppModel.calificacionSeleccionada = calificacionSpeedyPepe
		Assert.assertEquals(calificacionesAppModel.getNombreUsuario, "Pepe")
	}
	
	@Test
	def void getNombrePublicacionTest() {
		calificacionesAppModel.calificacionSeleccionada = calificacionSpeedyPepe
		Assert.assertEquals(calificacionesAppModel.getNombrePublicacion, "Speedy")
	}
	
	@Test
	def void getPuntajeTest() {
		calificacionesAppModel.calificacionSeleccionada = calificacionSpeedyPepe
		Assert.assertEquals(calificacionesAppModel.getPuntaje, 4)
	}
	
	@Test
	def void getDetalleTest() {
		calificacionesAppModel.calificacionSeleccionada = calificacionSpeedyPepe
		Assert.assertEquals(calificacionesAppModel.getDetalle, "es malisimo")
	}
	
	@Test
	def void setCalificacionSeleccionadaTest() {
		calificacionesAppModel.setCalificacionSeleccionada(calificacionSpeedyPepe)
		Assert.assertEquals(calificacionesAppModel.getNombrePublicacion, "Speedy")
		Assert.assertEquals(calificacionesAppModel.getNombreUsuario, "Pepe")
		Assert.assertEquals(calificacionesAppModel.getDetalle, "es malisimo")
		Assert.assertEquals(calificacionesAppModel.getPuntaje, 4)
		Assert.assertEquals(calificacionesAppModel.getOfensivas, 0)
		Assert.assertEquals(calificacionesAppModel.getCalificacionOfensiva, false)
	}
	
	@Test(expected=RuntimeException)
	def void crearNuevaCalificacionSinPublicacionSeleccionadaTest() {
		calificacionesAppModel.crearNuevaCalificacion()
	}
	
	@Test
	def void crearNuevaCalificacionConPublicacionSeleccionadaTest() {
		calificacionesAppModel.setCalificacionSeleccionada(calificacionSpeedyPepe)
		calificacionesAppModel.crearNuevaCalificacion()
		Assert.assertEquals(calificacionSpeedyPepe.evaluado.calificaciones.get(0), calificacionSpeedyPepe)
		Assert.assertEquals(calificacionesAppModel.ofensivas, 0)
		// Es 2 porque en el "BaseTest" Speedy ya tiene una calificacion pre cargada
		Assert.assertEquals(calificacionSpeedyPepe.evaluado.calificaciones.size, 2)		
	}
	
	
	@Test
	def void eliminarCalificacionSeleccionadaTest() {
		calificacionesAppModel.admin.calificaciones.add(calificacionSpeedyPepe)
		Assert.assertEquals(calificacionesAppModel.admin.totalCalificaciones,1)
		calificacionesAppModel.setCalificacionSeleccionada(calificacionSpeedyPepe)
		calificacionesAppModel.eliminarCalificacionSeleccionada()
		Assert.assertEquals(calificacionesAppModel.admin.totalCalificaciones,0)
		// Assert.assertEquals(calificacionesAppModel.ofensivas, 0)
		//Assert.assertEquals(calificacionesAppModel.registradas,0)
		
	}
		
}