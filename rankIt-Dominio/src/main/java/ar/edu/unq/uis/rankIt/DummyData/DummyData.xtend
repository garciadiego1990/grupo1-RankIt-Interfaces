package ar.edu.unq.uis.rankIt.DummyData

import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class DummyData {

	var AdministradorGeneral adminGral

	new() {

		adminGral = new AdministradorGeneral
		
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
		
		adminGral.adminUsuarios.agregarUsuario(usuarioPepe)
		adminGral.adminUsuarios.agregarUsuario(usuarioMarcos)
		adminGral.adminUsuarios.agregarUsuario(usuarioLuis)

		var calificacion1 = new Calificacion(Quilmes, usuarioPepe, 5, "Prueba1",1)
		var calificacion2 = new Calificacion(Ezpeleta, usuarioLuis, 6, "Prueba2",2)
		var calificacion3 = new Calificacion(Berazategui, usuarioMarcos, 7, "Prueba3",3)
		var calificacion4 = new Calificacion(servicioSpeedy, usuarioPepe, 5, "Prueba1",4)
		var calificacion5 = new Calificacion(servicioMulticanal, usuarioLuis, 0, "Prueba2",5)
		var calificacion6 = new Calificacion(servicioTelefonica, usuarioMarcos, 7, "Prueba3",6)
		var calificacion7 = new Calificacion(Quilmes, usuarioPepe, 5, "Prueba1",7)
		var calificacion8 = new Calificacion(Ezpeleta, usuarioPepe, 6, "Prueba2",8)
		var calificacion9 = new Calificacion(Berazategui, usuarioPepe, 7, "Prueba3",9)
		var calificacion10 = new Calificacion(servicioSpeedy, usuarioPepe, 5, "Prueba1",10)
		var calificacion11 = new Calificacion(servicioMulticanal, usuarioLuis, 0, "Prueba2",11)
		var calificacion12 = new Calificacion(servicioTelefonica, usuarioMarcos, 7, "Prueba3",12)

		adminGral.adminServicios.agregar(servicioSpeedy)
		adminGral.adminServicios.agregar(servicioMulticanal)
		adminGral.adminServicios.agregar(servicioTelefonica)
		adminGral.adminServicios.agregar(servicioFibertel)

		adminGral.adminLugares.agregar(Quilmes)
		calificacion1.esOfensiva = true
		adminGral.adminLugares.agregar(Berazategui)
		adminGral.adminLugares.agregar(Ezpeleta)

		adminGral.adminCalificaciones.servicios = adminGral.adminServicios.publicaciones
		adminGral.adminCalificaciones.lugares = adminGral.adminLugares.publicaciones

		calificacion1.fecha = new DateTime(2005, 1, 1, 0, 0)
		calificacion2.fecha = new DateTime(2005, 2, 2, 0, 0)
		calificacion3.fecha = new DateTime(2005, 3, 3, 0, 0)
		calificacion4.fecha = new DateTime(2005, 4, 4, 0, 0)
		calificacion5.fecha = new DateTime(2005, 5, 5, 0, 0)
		calificacion6.fecha = new DateTime(2005, 6, 6, 0, 0)
		calificacion7.fecha = new DateTime(2005, 7, 7, 0, 0)
		calificacion8.fecha = new DateTime(2005, 8, 8, 0, 0)
		calificacion9.fecha = new DateTime(2005, 9, 9, 0, 0)
		calificacion10.fecha = new DateTime(2005, 10, 10, 0, 0)
		calificacion11.fecha = new DateTime(2005, 11, 11, 0, 0)
		calificacion12.fecha = new DateTime(2005, 12, 12, 0, 0)

//		adminGral.adminCalificaciones.agregarCalificacion(calificacion1)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion2)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion3)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion4)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion5)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion6)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion7)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion8)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion9)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion10)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion11)
//		adminGral.adminCalificaciones.agregarCalificacion(calificacion12)

		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion1)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion2)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion3)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion4)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion5)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion6)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion7)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion8)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion9)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion10)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion11)
		adminGral.adminCalificaciones.agregarCalificacionBis(calificacion12)

	}
}
