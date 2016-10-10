package ar.edu.unq.uis.rankIt.controller

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import ar.edu.unq.uis.rankIt.dominio.Calificacion
//import ar.edu.unq.uis.rankIt.dominio.Publicacion
//import ar.edu.unq.uis.rankIt.dominio.Usuario
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Body
import ar.edu.unq.uis.rankIt.clasesMinificadas.CalificacionMinificada
import ar.edu.unq.uis.rankIt.exceptions.NoIngresaIDCalificacion
import ar.edu.unq.uis.rankIt.exceptions.NoExisteCalificacionConID
import ar.edu.unq.uis.rankIt.exceptions.CalificacionSinCompletarCorrectamente

@Controller
class RankItController {
	extension JSONUtils = new JSONUtils

	AdministradorGeneral adminGeneral

	new(AdministradorGeneral admin) {
		adminGeneral = admin
	}

///////////////////////////////////////////////////////////////////////
/////////////////// CALIFICACIONES ///////////////////////////////////
/////////////////////////////////////////////////////////////////////
	
	@Get("/calificaciones/")
	def getCalificacionesDelUsuario(String nombre) {
		response.contentType = "application/json"
		ok(adminGeneral.adminCalificaciones.getCalificacionesDeUsuario(nombre).toJson)
	}
/* 
	@Delete('/calificaciones')
	def deleteCalificacionById() {
		badRequest('{ "error": "No ingresaste la id de la calificacion" }')
	}

	@Delete("/calificaciones")
	def deleteCalificacionById(String id) {
		response.contentType = "application/json"

		if (!adminGeneral.adminCalificaciones.getCalificaciones.exists [ calificacion |
			calificacion.idCalificacion.equals(Integer.valueOf(id))
		]) {
			notFound('{ "error": "No existe calificacion con ese id" }')
		} else {
			adminGeneral.adminCalificaciones.eliminarCalificacionPorID(Integer.valueOf(id))
			ok()
		}
	}
*/	
	
	@Delete("/calificaciones")
	def deleteCalificacionById(String id) {
		response.contentType = "application/json"
		try {
			adminGeneral.adminCalificaciones.eliminarCalificacionPorID(Integer.valueOf(id))
			ok()
		} catch (NoIngresaIDCalificacion e) {
			badRequest('{"error": "No ingresaste la id de la calificacion"}')
		} catch (NoExisteCalificacionConID e) {
			notFound('{"error": "No existe calificacion con ese id"}')
		}
	}
	
	@Post("/calificaciones")
	def createCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var CalificacionMinificada c = body.fromJson(typeof(CalificacionMinificada))
			this.adminGeneral.adminCalificaciones.agregarCalificacionBis(c.convertir)
			ok()
		} catch (CalificacionSinCompletarCorrectamente e) {
			badRequest('{ "error": "No estas completando todos los campos" }')
		}

	}
/* 	// No tengo la mas puta idea de como se hace
	@Put("/calificaciones")
	def editarCalificacion(@Body String body) {
		response.contentType = "application/json"


	}
*/
}
