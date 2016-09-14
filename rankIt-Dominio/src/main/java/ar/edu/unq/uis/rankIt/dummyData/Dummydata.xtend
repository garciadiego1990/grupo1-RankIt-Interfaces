package ar.edu.unq.uis.rankIt.dummyData

import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.AdministradorDePublicaciones
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Usuario

class Dummydata {
	
	def crearAdminGeneralDummy() {
		new AdministradorGeneral => [
			adminPublicaciones = crearAdminPublicaciones()
			adminCalificaciones = crearAdminCalificaciones()
			adminUsuarios = crearAdminUsuarios() 
		]
	}
	 
	def crearAdminPublicaciones() {
		 
		new AdministradorDePublicaciones => [
			agregarServicio(servicioSpeddy)
			agregarServicio(servicioMulticanal)
			agregarServicio(servicioTelefonica)
			agregarLugar(Quilmes)
			agregarLugar(Berazategui)
			agregarLugar(Ezpeleta) 
		]	
	}
	
	def crearAdminCalificaciones() {
		 
		new AdministradorDeCalificaciones => [
			agregarCalificacion(calificacion1)
			agregarCalificacion(calificacion2)
			agregarCalificacion(calificacion3) 
		]	
	}
	
	def crearAdminUsuarios() {
		 
		new AdministradorDeUsuarios => [
			agregarUsuario(usuarioPepe)
			agregarUsuario(usuarioLuis)
			agregarUsuario(usuarioMarcos) 
		]	
	}
	
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
	
	
}