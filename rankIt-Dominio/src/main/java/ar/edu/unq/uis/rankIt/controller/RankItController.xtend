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
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Body
import com.eclipsesource.json.Json
import com.eclipsesource.json.JsonObject
import com.google.gson.Gson

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
	@Get("/calificaciones")
	def getCalificacionesDelUsuario() {
		response.contentType = "application/json"
		ok(adminGeneral.adminCalificaciones.calificaciones.toJson)
	}

	@Delete('/calificaciones')
	def deleteCalificacionById() {
		badRequest('{ "error": "No ingresaste la id de la calificacion" }')
	}

	@Delete('/calificaciones/:id')
	def deleteCalificacionById() {
		response.contentType = "application/json"

		if (!adminGeneral.adminCalificaciones.getCalificaciones.exists [ calificacion |
			calificacion.idCalificacion.equals(Integer.valueOf(id))
		]) {
			badRequest('{ "error": "No existe calificacion con ese id" }')
		} else {
			adminGeneral.adminCalificaciones.eliminarCalificacionPorID(Integer.valueOf(id))
			ok()
		}
	}
	
	// Creo que funciona pero no se como probarlo 
	@Post("/calificaciones")
	def createCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var Calificacion c = body.fromJson(typeof(Calificacion))
			this.adminGeneral.adminCalificaciones.agregarCalificacionBis(c)
			ok()
		} catch (UnrecognizedPropertyException exception) {
			badRequest('{ "error": "No estas completando todos los campos" }')
		}

	}

}
