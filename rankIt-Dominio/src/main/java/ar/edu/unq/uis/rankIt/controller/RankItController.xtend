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

// Esta como el orto hacer 4 metodos para el post, pero todavia no se
// como aplicar lo del body
//	@Post("/calificaciones/:puntaje/:motivo/:evaluado")
//	def createCalificacion() {
//		response.contentType = "application/json"
//		var Usuario carlitox = new Usuario(evaluado, "123")
//		var Publicacion p1 = new Publicacion(evaluado)
//		adminGeneral.adminCalificaciones.calificaciones.add(new Calificacion(p1, carlitox, Integer.valueOf(puntaje), motivo, 1))
//		ok()
//	}
//	@Post("/calificaciones/:puntaje/:motivo")
//	def createCalificacion() {
//		badRequest('{ "error": "No ingresaste el nombre del evaluado" }')
//
//	}
//
//	@Post("/calificaciones/:puntaje")
//	def createCalificacion() {
//		badRequest('{ "error": "No ingresaste el nombre del evaluado, ni el motivo" }')
//
//	}
//
//	@Post("/calificaciones")
//	def createCalificacion() {
//		badRequest('{ "error": "No ingresaste el nombre del evaluado, ni el motivo, ni el puntaje" }')
//
//	}
}
