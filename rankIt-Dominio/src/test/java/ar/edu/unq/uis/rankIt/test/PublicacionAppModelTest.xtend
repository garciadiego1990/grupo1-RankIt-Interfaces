package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.appModel.LugaresAppModel
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.joda.time.DateTime

class PublicacionAppModelTest extends BaseTest {
	LugaresAppModel lugaresAppModel
	
	@Before
	override void setUp() {
		super.setUp()
		lugaresAppModel = new LugaresAppModel() 
		lugaresAppModel.admin = adminLugares 
	}
	 
	@Test
	def void getFechaDeRegistroTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.getFechaDeRegistro().getYear, new DateTime().getYear)
		Assert.assertEquals(lugaresAppModel.getFechaDeRegistro().getMonthOfYear, new DateTime().getMonthOfYear)
		Assert.assertEquals(lugaresAppModel.getFechaDeRegistro().getDayOfMonth, new DateTime().getDayOfMonth)
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
		Assert.assertEquals(lugaresAppModel.inscriptos, 3)
		Assert.assertEquals(lugaresAppModel.habilitados, 0)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 3)
		lugaresAppModel.crearNuevaPublicacion()
		Assert.assertEquals(lugaresAppModel.inscriptos, 4)
		Assert.assertEquals(lugaresAppModel.habilitados, 0)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 4)
	}
	
	@Test
	def void eliminarPublicacionSeleccionadaTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.inscriptos, 3)
		Assert.assertEquals(lugaresAppModel.habilitados, 0)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 3)
		lugaresAppModel.eliminarPublicacionSeleccionada()
		Assert.assertEquals(lugaresAppModel.inscriptos, 2)
		Assert.assertEquals(lugaresAppModel.habilitados, 0)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 2)
	}
	
	@Test
	def void setPublicacionSeleccionadaHabilitadoTest() {
		lugaresAppModel.publicacionSeleccionada = lugarEasy
		Assert.assertEquals(lugaresAppModel.habilitados, 0)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 3)
		lugaresAppModel.setPublicacionSeleccionadaHabilitado(true)
		Assert.assertEquals(lugaresAppModel.publicacionSeleccionada.estaHabilitado, true)
		Assert.assertEquals(lugaresAppModel.habilitados, 1)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 2)
	}
	
	@Test
	def void inscriptosTest() {
		Assert.assertEquals(lugaresAppModel.inscriptos, 3)
	}
	
	@Test
	def void habilitadosTest() {
		Assert.assertEquals(lugaresAppModel.habilitados, 0)
	}
	
	@Test
	def void inhabilitadosTest() {
		Assert.assertEquals(lugaresAppModel.inhabilitados, 3)
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
		Assert.assertEquals(lugaresAppModel.habilitados, 0)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 3)
		lugaresAppModel.setPublicacionHabilitada(true)
		Assert.assertEquals(lugaresAppModel.getPublicacionHabilitada, true)
		Assert.assertEquals(lugaresAppModel.habilitados, 1)
		Assert.assertEquals(lugaresAppModel.inhabilitados, 2)
	}
	 
	@Test
	def void setNombreDePublicacionBuscadaTest() {
		lugaresAppModel.setNombreDePublicacionBuscada("DiarioOle")
		Assert.assertEquals(lugaresAppModel.nombreDePublicacionBuscada, "DiarioOle")
		Assert.assertEquals(lugaresAppModel.buscador.nombrePublicacionABuscar, "diarioole")
	}
	
		
}