package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.appModel.LugaresAppModel
import org.junit.Before
import org.junit.Test
import org.joda.time.DateTime
import org.junit.Assert

class PublicacionAppModelTest extends BaseTest {
	LugaresAppModel lugaresAppModel
	
	@Before
	override void setUp() {
		super.setUp()
		lugaresAppModel = new LugaresAppModel() 
		lugaresAppModel.admin = adminLugares 
		//new AdministradorDePublicaciones()
	}
	
	@Test
	def void getFechaDeRegistroTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getFechaDeRegistro().getYear, 2016)
		// falta testear el dia y el mes
	}
	
	@Test
	def void getCantidadDeCalificaciones() {
		Assert.assertEquals(lugaresAppModel.getCantidadDeCalificaciones, 0) 
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getCantidadDeCalificaciones, 1)
	}
	
	@Test
	def void estaHabilitadoTest() { 
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.estaHabilitado, false)
		lugarEasy.estaHabilitado = true
		Assert.assertEquals(lugaresAppModel.estaHabilitado, true)
	}
	
	@Test
	def void getCantidadDeCalificacionesTest() { 
		Assert.assertEquals(lugaresAppModel.getCantidadDeCalificaciones, 0)
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getCantidadDeCalificaciones, 1)
	}
	
	@Test
	def void getRatingPromedioTest() { 
		Assert.assertEquals(lugaresAppModel.getRatingPromedio, 0, 0)
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getRatingPromedio, 8, 0)
	}
	
	@Test
	def void setPublicacionSeleccionadaTest() {
		lugaresAppModel.setPublicacionSeleccionada(lugarEasy)
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.publicacionSeleccionada, lugarEasy)
		Assert.assertEquals(lugaresAppModel.getNombre, "Easy")
		Assert.assertEquals(lugaresAppModel.getRatingPromedio, 8, 0f)
		Assert.assertEquals(lugaresAppModel.getCantidadDeCalificaciones, 1)
		Assert.assertEquals(lugaresAppModel.getPublicacionHabilitada, false)
	}
	
	@Test
	def void crearNuevaPublicacionTest() {
		Assert.assertEquals(lugaresAppModel.admin.todo.size, 3)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesRegistradas, 3)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 0)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 3)
		lugaresAppModel.crearNuevaPublicacion()
		Assert.assertEquals(lugaresAppModel.admin.todo.size, 4)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesRegistradas, 4)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 0)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 4)
	}
	
	@Test
	def void eliminarPublicacionSeleccionadaTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.admin.todo.size, 3)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesRegistradas, 3)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 0)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 3)
		lugaresAppModel.eliminarPublicacionSeleccionada()
		Assert.assertEquals(lugaresAppModel.admin.todo.size, 2)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesRegistradas, 2)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 0)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 2)
	}
	
	@Test
	def void setPublicacionSeleccionadaHabilitadoTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 0)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 3)
		lugaresAppModel.setPublicacionSeleccionadaHabilitado(true)
		Assert.assertEquals(lugaresAppModel.publicacionSeleccionada.estaHabilitado, true)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 1)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 2)
	}
	
	@Test
	def void getCantidadPublicacionesRegistradasTest() {
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesRegistradas, 3)
	}
	
	@Test
	def void getCantidadPublicacionesHabilitadasTest() {
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 0)
	}
	
	@Test
	def void getCantidadPublicacionesDeshabilitadasTest() {
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 3)
	}
	
	
	@Test
	def void getPublicacionHabilitadaTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getPublicacionHabilitada, false)
	}
	
	@Test
	def void setPublicacionHabilitadaTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getPublicacionHabilitada, false)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 0)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 3)
		lugaresAppModel.setPublicacionHabilitada(true)
		Assert.assertEquals(lugaresAppModel.getPublicacionHabilitada, true)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesHabilitadas, 1)
		Assert.assertEquals(lugaresAppModel.getCantidadPublicacionesDeshabilitadas, 2)
	}
	
	@Test
	def void setNombreDePublicacionBuscadaTest() {
		lugaresAppModel.setNombreDePublicacionBuscada("DiarioOle")
		Assert.assertEquals(lugaresAppModel.nombreDePublicacionBuscada, "DiarioOle")
		Assert.assertEquals(lugaresAppModel.buscador.nombrePublicacionABuscar, "DiarioOle")
		//Assert.assertTrue(lugaresAppModel.buscador.publicaciones.contains("DiarioOle"))
	}
	
}