package ar.edu.unq.uis.rankIt.view.runnable

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral

class BootstrapRankit  extends CollectionBasedBootstrap {
	
	new(){
		ApplicationContext.instance => [
			configureSingleton(typeof(AdministradorGeneral), new AdministradorGeneral)
			this.adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral)) as AdministradorGeneral
		]
	}
	
	override run() {
		this.cargarServicios()
		this.cargarLugares()
		this.cargarCalificaciones()
		this.cargarUsuarios()
	}
	 
	def cargarServicios() {
		 
		adminGral.adminServicios => [
			it.agregar(servicioSpeedy)
			it.agregar(servicioMulticanal)
			it.agregar(servicioTelefonica)
			it.agregar(servicioFibertel)
		]	
	}
	
	def cargarLugares() {
		
		adminGral.adminLugares => [
			calificacion1.esOfensiva = true
			it.agregar(Quilmes)
			it.agregar(Berazategui)
			it.agregar(Ezpeleta)
		]
	}
	
	/** Con este método creo referencias de todas las listas de {@link Publicacion}es en {@link AdministradorDeCalificaciones}.
	 * NOTA: Referencio a dichas listas en vez de copiarlas a una lista nueva en {@link AdministradorDeCalificaciones}. Esto tiene
	 * 		la ventaja de que en caso de crearse una nueva {@link Publicacion}, como estoy referenciando a la lista que la contiene,
	 * 		también podré acceder a ella desde el {@link AdministradorDeCalificaciones}. 
	 * @author ae */
	def cargarCalificaciones() {
		adminGral.adminCalificaciones => [
			it.servicios = adminGral.adminServicios.publicaciones
			it.lugares	 = adminGral.adminLugares.publicaciones
			it.actualizarListaDeCalificaciones
		]	
	}
	
	def cargarUsuarios() {
		 
		adminGral.adminUsuarios => [
			agregarUsuario(usuarioPepe)
			agregarUsuario(usuarioLuis)
			agregarUsuario(usuarioMarcos) 
		]	
	}
	
	var servicioFibertel = new Publicacion("Fibertel")
	var servicioSpeedy = new Publicacion("Speedy")
	var servicioMulticanal = new Publicacion("Multicanal")
	var servicioTelefonica = new Publicacion("Telefonica")
	
	var Quilmes = new Publicacion("Quilmes")

	var Berazategui = new Publicacion("Berazategui")
	
	var Ezpeleta = new Publicacion("Ezpeleta")
	
	var usuarioPepe = new Usuario("pepe", Usuario.contraseniaDefault)
	var usuarioLuis = new Usuario("Luis", Usuario.contraseniaDefault)
	var usuarioMarcos = new Usuario("Marcos", Usuario.contraseniaDefault)
	
	var calificacion1 = new Calificacion(Quilmes, usuarioPepe, 5, "Prueba1")
	var calificacion2 = new Calificacion(Ezpeleta, usuarioLuis, 6, "Prueba2")
	var calificacion3 = new Calificacion(Berazategui, usuarioMarcos, 7, "Prueba3")
	var calificacion4 = new Calificacion(servicioSpeedy, usuarioPepe, 5, "Prueba1")
	var calificacion5 = new Calificacion(servicioMulticanal, usuarioLuis, 0, "Prueba2")
	var calificacion6 = new Calificacion(servicioTelefonica, usuarioMarcos, 7, "Prueba3")
	
	var AdministradorGeneral adminGral

}