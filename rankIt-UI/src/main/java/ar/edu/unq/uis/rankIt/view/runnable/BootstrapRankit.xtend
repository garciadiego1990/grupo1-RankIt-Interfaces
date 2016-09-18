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
			agregar(servicioSpeddy)
			agregar(servicioMulticanal)
			agregar(servicioTelefonica)
			agregar(servicioFibertel)
		]	
	}
	
	def cargarLugares() {
		
		adminGral.adminLugares => [
			calificacion1.puntaje = 5
			calificacion2.puntaje = 8
			Quilmes.calificaciones.add(calificacion1)
			Berazategui.calificaciones.add(calificacion2)
			agregar(Quilmes)
			agregar(Berazategui)
			agregar(Ezpeleta)
		]
	}
	
	def cargarCalificaciones() {
		adminGral.adminCalificaciones => [
//			calificacion1.calificar(5, usuarioPepe, Quilmes)
//			calificacion2.calificar(6, usuarioLuis, Ezpeleta)
//			calificacion3.calificar(7, usuarioMarcos, Berazategui)
			calificacion1.calificar(5, usuarioPepe, Quilmes, "Prueba1")
			calificacion1.esOfensiva = true
			calificacion2.calificar(6, usuarioLuis, Ezpeleta, "Prueba2")
			calificacion3.calificar(7, usuarioMarcos, Berazategui, "Prueba3")

			agregarCalificacion(calificacion1)
			agregarCalificacion(calificacion2)
			agregarCalificacion(calificacion3) 
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
	var servicioSpeddy = new Publicacion("Speedy")
	var servicioMulticanal = new Publicacion("Multicanal")
	var servicioTelefonica = new Publicacion("Telefonica")
	
	var Quilmes = new Publicacion("Quilmes")

	var Berazategui = new Publicacion("Berazategui")
	
	var Ezpeleta = new Publicacion("Ezpeleta")
	
	var calificacion1 = new Calificacion()
	var calificacion2 = new Calificacion()
	var calificacion3 = new Calificacion()
	
	var usuarioPepe = new Usuario("pepe")
	var usuarioLuis = new Usuario("Luis")
	var usuarioMarcos = new Usuario("Marcos")
	
	var AdministradorGeneral adminGral
	
	
}