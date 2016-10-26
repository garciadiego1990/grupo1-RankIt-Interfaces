package controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import ar.edu.unq.uis.rankIt.exceptions.UsuarioNoEncontradoException
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException
import ar.edu.unq.uis.rankit.dominio.login.LogIn
import org.uqbar.xtrest.api.annotation.Put
import ar.edu.unq.uis.rankit.dominio.signup.SignUp
import ar.edu.unq.uis.rankIt.exceptions.NombreDeUsuarioInvalidoException
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.xtrest.api.annotation.Delete
import ar.edu.unq.uis.rankIt.exceptions.IdDeCalificacionInvalidoException
import ar.edu.unq.uis.rankIt.exceptions.IdDeCalificacionInexistenteException
import clasesMinificadas.CalificacionMinificada
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.exceptions.CalificacionCompletadaIncorrectamenteException
import clasesMinificadas.PublicacionMinificada
import clasesMinificadas.RankingMinificada
import clasesMinificadas.DatosUsuario

@Controller
class ControllerManager {
	extension JSONUtils = new JSONUtils

	val AdministradorGeneral admin
	var LogIn loguer
	var SignUp signer

	new() {
		this.admin = this.getAdminGeneral()
		this.loguer = new LogIn(this.admin.adminUsuarios)
		this.signer = new SignUp(this.admin.adminUsuarios)
	}

	/////////////////////////////////////////////////////////////////////
	////////////////////////// USUARIOS ////////////////////////////////
	///////////////////////////////////////////////////////////////////
	
	@Post("/usuarios")
	def signIn(@Body String body) {
		response.contentType = "application/json"
		try {
			var DatosUsuario datos = body.fromJson(typeof(DatosUsuario))
			var usuario = this.loguer.logearUsuario(datos.usuario, datos.password)
			ok('{"id":' + usuario.id.toJson + '}')
		} catch (UsuarioNoEncontradoException ex) {
			notFound('{}')
		} catch (ContraseniaDeUsuarioIncorrectaException ex) {
			// tendria que ser un unauthorized (error 401) no lo implementaron ellos
			badRequest('{}')
		}
	}

	@Put("/usuarios")
	def signUp(@Body String body) {
		response.contentType = "application/json"

		try {
			var DatosUsuario datos = body.fromJson(typeof(DatosUsuario))
			this.signer.registrarUsuario(datos.usuario, datos.password)
			ok()
		} catch (NombreDeUsuarioInvalidoException ex) {
			badRequest('{}')
		}
	}

	// /////////////////////////////////////////////////////////////////////
	// ///////////////////////// EVALUADOS ////////////////////////////////
	// ///////////////////////////////////////////////////////////////////
	@Get("/evaluados")
	def getEvaluados() {
		response.contentType = "application/json"
		var miniPublicaciones = PublicacionMinificada.todasLasPublicaciones(this.admin)
		ok(miniPublicaciones.toJson)
	}

	// /////////////////////////////////////////////////////////////////////
	// /////////////////////////// RANKING ////////////////////////////////
	// ///////////////////////////////////////////////////////////////////
	
	// Devuelve los lugares y servicios con nombre, de tipo, con igual o mayor cantidad de calificaciones y ranking
	@Get("/ranking")
	def getEvaluados(String nombre, String tipo, String calificaciones, String ranking) {
		response.contentType = "application/json"
		try {
			ok(RankingMinificada.rankingDePublicacionesMinificadas(this.admin).toJson)
		} catch (NumberFormatException ex) {
			badRequest('{ "error": "El id debe ser un numero entero" }')
		}
	}

	///////////////////////////////////////////////////////////////////////
	/////////////////////////// CALIFICACIONES ///////////////////////////
	/////////////////////////////////////////////////////////////////////
	
	@Get("/calificaciones")
	def getCalificacionesDelUsuario(String id) {
		response.contentType = "application/json"
		var calificacionesDelUsuario = adminGeneral.adminCalificaciones.getCalificacionesDeUsuario(Integer.valueOf(id))
		var calificacionesMini = CalificacionMinificada.generarCalificacionesMinificadas(calificacionesDelUsuario)
		ok(calificacionesMini.toJson)
	}

	@Delete("/calificaciones")
	def deleteCalificacionById(String id) {
		response.contentType = "application/json"
		try {
			adminGeneral.adminCalificaciones.eliminarCalificacionPorID(Integer.valueOf(id))
			ok()
		} catch (IdDeCalificacionInvalidoException e) {
			badRequest('{"error": "No ingresaste la id de la calificacion"}')
		} catch (IdDeCalificacionInexistenteException e) {
			notFound('{"error": "No existe calificacion con ese id"}')
		}
	}

	@Post("/calificaciones")
	def createCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var CalificacionMinificada c = body.fromJson(typeof(CalificacionMinificada))
			var evaluador = this.adminGeneral.adminUsuarios.buscarUsuarioPorNombre(c.evaluador)
			var evaluado = this.adminGeneral.adminServicios.buscarPublicacionPorNombre(c.evaluado)
			if(evaluado == null) evaluado = this.adminGeneral.adminLugares.buscarPublicacionPorNombre(c.evaluado)
			var nuevaCalificacion = new Calificacion(evaluado, evaluador, c.puntaje, c.detalle)
			var idRet = this.adminGeneral.adminCalificaciones.agregarCalificacion(nuevaCalificacion)
			// ok('{"id":'+idRet.toJson+',"tipo":'+nuevaCalificacion.tipo.toJson+'}')
			ok(
				'{"id":' + idRet.toJson + ',"tipo":' + nuevaCalificacion.tipo.toJson + ',"ratingPromedio":' +
					c.ratingPromedio + '}')
		} catch (CalificacionCompletadaIncorrectamenteException e) {
			badRequest('{}')
		}
	}

	@Put("/calificaciones")
	def editarCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			val CalificacionMinificada c = body.fromJson(typeof(CalificacionMinificada))
			var calificacionEncontrada = this.adminGeneral.adminCalificaciones.getCalificacionConId(c.id)
			calificacionEncontrada => [
				it.detalle = c.detalle
				it.puntaje = c.puntaje
			]
			ok()
		} catch (CalificacionCompletadaIncorrectamenteException e) {
			badRequest('{}')
		} catch (IdDeCalificacionInexistenteException e) {
			notFound('{}')
		}

	}

//CARGO EL APPLICATION CONTEXT
	def AdministradorGeneral getAdminGeneral() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		return adminGral
	}
}
