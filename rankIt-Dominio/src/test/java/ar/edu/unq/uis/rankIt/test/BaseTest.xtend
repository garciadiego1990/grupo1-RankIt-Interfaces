package ar.edu.unq.uis.rankIt.test

import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Usuario
import org.junit.Before
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.ApplicationContext

@Accessors
class BaseTest {
	AdministradorGeneral adminGeneral
	AdministradorDePublicaciones adminServicios
	AdministradorDePublicaciones adminLugares
	AdministradorDeCalificaciones adminCalificaciones
	AdministradorDeUsuarios adminUsuarios
	Publicacion servicioSpeedy
	Publicacion servicioTelefonica
	Publicacion servicioMetrogas
	Publicacion lugarEasy
	Publicacion lugarAltoAvellaneda
	Publicacion lugarTecnopolis
	Calificacion calificacionSpeedyPepe
	Calificacion calificacionTelefonicaLuis
	Calificacion calificacionMetrogasJuan
	Calificacion calificacionEasyMarcos
	Calificacion calificacionAltoAvellanedaMatias
	Calificacion calificacionTecnopolisGerman 
	Usuario usuarioPepe
	Usuario usuarioLuis
	Usuario usuarioJuan
	Usuario usuarioMarcos
	Usuario usuarioMatias
	Usuario usuarioGerman
	
	
	@Before
	def void setUp() {
		
		ApplicationContext.instance.configureSingleton(typeof(AdministradorGeneral), new AdministradorGeneral)
		
		adminGeneral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral)) as  AdministradorGeneral
		adminServicios = adminGeneral.getAdminServicios
		adminLugares = adminGeneral.getAdminLugares
		adminUsuarios = adminGeneral.getAdminUsuarios
		adminCalificaciones = adminGeneral.getAdminCalificaciones
		
		usuarioPepe = new Usuario("Pepe")
		usuarioLuis = new Usuario("Luis")
		usuarioJuan = new Usuario("Juan")
		usuarioMarcos = new Usuario("Marcos")
		usuarioMatias = new Usuario("Matias")
		usuarioGerman = new Usuario("German")
		
		servicioSpeedy = new Publicacion("Speedy")
		servicioTelefonica = new Publicacion("Telefonica")
		servicioMetrogas = new Publicacion("Metrogas")
		
		lugarEasy = new Publicacion("Easy")
		lugarAltoAvellaneda = new Publicacion("AltoAvellaneda")
		lugarTecnopolis = new Publicacion("Tecnopolis")
		
		calificacionSpeedyPepe = new Calificacion
		calificacionSpeedyPepe.calificar(4, usuarioPepe, servicioSpeedy, "es una bazofia")
		calificacionTelefonicaLuis = new Calificacion
		calificacionTelefonicaLuis.calificar(5, usuarioLuis, servicioTelefonica, "no tengo tono")
		calificacionMetrogasJuan = new Calificacion
		calificacionMetrogasJuan.calificar(3, usuarioJuan, servicioMetrogas, "es carisimo, hdp")
		calificacionEasyMarcos = new Calificacion
		calificacionEasyMarcos.calificar(8, usuarioMarcos, lugarEasy, "bunas ofertas y atencion")
		calificacionAltoAvellanedaMatias = new Calificacion
		calificacionAltoAvellanedaMatias.calificar(6, usuarioMatias, lugarAltoAvellaneda, "mi jermu se engancha con la vidriera y no vuelvo a casa mas. No voy mas!!")
		calificacionTecnopolisGerman = new Calificacion
		calificacionTecnopolisGerman.calificar(8, usuarioGerman, lugarTecnopolis, "esta muy bueno")
		
		lugarEasy.agregarCalificacion(calificacionEasyMarcos)
		lugarAltoAvellaneda.agregarCalificacion(calificacionAltoAvellanedaMatias)
		lugarTecnopolis.agregarCalificacion(calificacionTecnopolisGerman)
		
		servicioSpeedy.agregarCalificacion(calificacionSpeedyPepe)
		servicioTelefonica.agregarCalificacion(calificacionTelefonicaLuis)
		servicioMetrogas.agregarCalificacion(calificacionMetrogasJuan)
		
		adminServicios.agregar(servicioSpeedy)
		adminServicios.agregar(servicioTelefonica)
		adminServicios.agregar(servicioMetrogas)
		
		adminLugares.agregar(lugarEasy)
		adminLugares.agregar(lugarAltoAvellaneda)
		adminLugares.agregar(lugarTecnopolis)
		
		adminUsuarios.agregarUsuario(usuarioPepe)
		adminUsuarios.agregarUsuario(usuarioLuis)
		adminUsuarios.agregarUsuario(usuarioJuan)
		adminUsuarios.agregarUsuario(usuarioMarcos)
		adminUsuarios.agregarUsuario(usuarioMatias)
		adminUsuarios.agregarUsuario(usuarioGerman)
		
		adminCalificaciones.agregarCalificacion(calificacionSpeedyPepe)
		adminCalificaciones.agregarCalificacion(calificacionTelefonicaLuis)
		adminCalificaciones.agregarCalificacion(calificacionMetrogasJuan) 
		adminCalificaciones.agregarCalificacion(calificacionEasyMarcos)
		adminCalificaciones.agregarCalificacion(calificacionAltoAvellanedaMatias)
		adminCalificaciones.agregarCalificacion(calificacionTecnopolisGerman)   
		
		adminGeneral.adminUsuarios = adminUsuarios
		adminGeneral.adminCalificaciones = adminCalificaciones
		adminGeneral.adminServicios = adminServicios
		adminGeneral.adminLugares = adminLugares
	}
		
}