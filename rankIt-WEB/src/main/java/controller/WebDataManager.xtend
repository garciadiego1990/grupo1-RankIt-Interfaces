package controller

import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankit.dominio.login.LogIn
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankit.dominio.signup.SignUp
import java.util.ArrayList
import java.util.List
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.exceptions.CalificacionCompletadaIncorrectamenteException
import clasesMinificadas.RankingMinificada
import clasesMinificadas.PublicacionMinificada

class WebDataManager {
	
	AdministradorGeneral adminGral
	LogIn logger
	SignUp signer
	
	new() {
		this.adminGral = this.getAdminGeneral()
		this.logger = new LogIn(adminGral.adminUsuarios)
		this.signer = new SignUp(adminGral.adminUsuarios)
	}
	
//	/** @author ae */
//	def Usuario loguearUsuario(LogInRequest request) {
//		var user = this.logger.validarUsuario(request.usuario, request.password)
//		return user
//	}
//	
//	/** @author ae */
//	def void registrarUsuario(SignInRequest request) {
//		this.signer.registrarUsuario(request.usuario, request.password)
//	}
//	
//	
//	/** @author ae */
//	def getEvaluados() {
//		var List<PublicacionMini> miniPublicaciones = new ArrayList<PublicacionMini>
//		for(Publicacion each: this.publicaciones())
//			miniPublicaciones.add = this.toPublicacionMini(each)
//		return miniPublicaciones
//	}
//	
//	
//	//TODO: no valido si las publicaciones estan habilitadas
//	/** @author ae */
//	def getRankingDePublicaciones() {
//		var List<Publicacion> publicacionesOrdenadas = this.ordenarPorPromedioDeCalificaciones(this.publicaciones())
//		val List<RankingMini> ranking = new ArrayList<RankingMini>
//
//		for (Publicacion each : publicacionesOrdenadas) {
//			var Integer rank = publicacionesOrdenadas.indexOf(each) + 1
//			var publicacionMini = this.toPublicacionMini(each)
//			ranking.add = this.toRankingMini(publicacionMini, rank, each.cantidadDeEvaluaciones)
//		}
//		return ranking
//	}
	
	
	/** Se responde con la lista de {@link RankingMini} ordenada filtrada por los parámetros dados.
	 * @author ae */
	def getRankingFilteredBy(String nombre, String tipo, String calificaciones, String ranking) {
		var filteredRankingList = new ArrayList<RankingMinificada>()
		
		var filter = new ParameterFilter()
		var PublicacionMinificada evaluado
		var Integer cal = filter.toInt(calificaciones)
		var Integer rank = filter.toInt(ranking)
		var boolean superaLosFiltros		

		for(RankingMinificada each : RankingMinificada.rankingDePublicacionesMinificadas(this.adminGral)) {
			evaluado = each.evaluado

			superaLosFiltros = 	filter.match(evaluado.nombre, nombre)				&&
								filter.match(evaluado.tipo, tipo)					&&
								filter.isGreaterOrEquals(each.calificaciones, cal)	&&
								filter.isLowerOrEquals(each.ranking, rank)		
			if(superaLosFiltros)
				filteredRankingList.add(each)
		}
		return filteredRankingList
	}
	
	
//	/** @author ae */
//	def getCalificacionesDelUsuarioConId(Integer idUsuario) {
//		var calificacionesDelUsuario = this.adminGral.adminCalificaciones.getCalificacionesDeUsuario(idUsuario)
//		var calificacionesMini = new ArrayList<CalificacionMini>()
//		for(Calificacion each: calificacionesDelUsuario)
//			calificacionesMini.add(this.toCalificacionMini(each))
//		return calificacionesMini
//	}
//
//
//	def createCalificacion(CreateCalificacionRequest request) {
//		//TODO: var evaluador = this.adminGeneral.adminUsuarios.buscarUsuarioPorId(request.idUsuario)
//		var evaluador = this.adminGeneral.adminUsuarios.buscarUsuarioPorNombre(request.evaluador)
//		
//		if(request.detalle != "" && request.puntaje != null) {
//			var evaluado = this.adminGeneral.adminServicios.buscarPublicacionPorNombre(request.evaluado)
//			if(evaluado==null)
//				evaluado= this.adminGeneral.adminLugares.buscarPublicacionPorNombre(request.evaluado)
//			//TODO: esta validacion estaria bueno hacerla en otro lado
//			if(evaluado != null && evaluador != null) {
//				var nuevaCalificacion = new Calificacion(evaluado, evaluador, request.puntaje, request.detalle)
//				this.adminGral.adminCalificaciones.agregarCalificacion(nuevaCalificacion)
//				return nuevaCalificacion.id
//			}
//		}
//		throw new CalificacionCompletadaIncorrectamenteException()
//	}
//	
//	
//	/** @author ae */
//	def deleteCalificacion(Integer idCalificacion) {
//		this.adminGral.adminCalificaciones.eliminarCalificacionPorID(idCalificacion)
//	}
//
//	//TODO: no esta validando nada cuando se ingresan parametros erroneos.
//	/** @author ae */
//	def editCalificacion(EditCalificacionRequest request) {
//		var calificacionEncontrada = this.adminGeneral.adminCalificaciones.getCalificacionConId(request.id)
//		calificacionEncontrada => [
//			it.detalle = request.detalle
//			it.puntaje = request.puntaje
//		]
//	}
//
//	/** @return todas las publicaciones de la aplicación.
//	 * @author ae */
//	def publicaciones() {
//		val List<Publicacion> publicaciones = new ArrayList<Publicacion>
//		publicaciones.addAll = adminGral.adminServicios.publicaciones
//		publicaciones.addAll = adminGral.adminLugares.publicaciones
//		return publicaciones
//	}
//
//	/** Dada una lista de {@link Publicacion}es se retorna la misma lista ordenada por su promedio de 
//	 * calificaciones.
//	 * La lista estará ordenada de mayor a menor promedio, estando en las primeras ubicaciones aquellas
//	 * publicaciones de mayor promedio.
//	 * @return todas las publicaciones de la aplicación ordenadas por promedio de calificaciones.
//	 * @author ae */
//	def ordenarPorPromedioDeCalificaciones(List<Publicacion> publicaciones) {
//		return publicaciones.sortBy[each|each.ratingPromedio].reverse
//	}
//
////TO MINIS:
//
//	/** Dada una {@link PublicacionMini}, su posición en el ranking y su cantidad de calificaciones,
//	 *  se retorna un {@link RankingMini} de la publicacion.
//	 * @author ae */
//	def toRankingMini(PublicacionMini miniPublicacion, Integer ranking, Integer cantEvaluaciones) {
//		var mini = new RankingMini()
//		mini.evaluado = miniPublicacion
//		mini.ranking = ranking
//		mini.calificaciones = cantEvaluaciones
//		return mini
//	}
//	
//		
//	/** Dada una {@link Publicacion} se retorna una {@link PublicacionMini} de la misma.
//	 * @author ae */
//	def toPublicacionMini(Publicacion publicacion) {
//		var mini = new PublicacionMini
//		mini.id = publicacion.id
//		mini.tipo = publicacion.tipo
//		mini.nombre = publicacion.nombre
//		return mini
//	}
//	
//	
//	/** Dada una {@link Calificacion} se retorna una {@link CalificacionMini} de la misma.
//	 * @author ae */
//	def toCalificacionMini(Calificacion calificacion) {
//		//TODO: hay cosas repetidas acá que habría que sacar
//		var mini = new CalificacionMini()
//		mini.detalle = calificacion.detalle
//		mini.puntaje = calificacion.puntaje
//		mini.evaluado = calificacion.evaluado.nombre
//		mini.evaluador = calificacion.evaluador.nombre
//		mini.id = calificacion.id
//		mini.tipo = calificacion.evaluado.tipo
//		mini.ratingPromedio = calificacion.evaluado.ratingPromedio
//		return mini
//	}	
	
	
//CARGO EL APPLICATION CONTEXT

	def AdministradorGeneral getAdminGeneral() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		return adminGral
	}
	



	def static void main(String[] s) {
		var f = new ParameterFilter()
		println(f.match(1, null))
		println(f.match("", null))
		println(f.match("", "d"))
		println(f.match("d", ""))
		println(f.match("hola", "hola"))
		println(f.match(1,2))
		println(f.match(1,1))
		println(f.toInt(null))
		println(f.toInt("1"))
		println(f.toInt("a"))
	}
}


/** Herramienta de filtrado de parámetros en un request http.
 * Retorna true si:
 	- el 2do parametro es comparable con el 1ro o;
 	- si alguno de ellos es null.
 * PRECONDICIÓN: El 1er parámetro NO es null.
 */
class ParameterFilter {
	
	new() {}
	
	def boolean match(String str1, String str2){
		if(str2!=null) 
			return str1.toLowerCase.matches("(.*)"+str2.toLowerCase+"(.*)")
		else
			return true;
	}
	
	def boolean match(Integer int1, Integer int2){
		if(int2!=null) 
			return int1.equals(int2)
		else
			return true;
	}
	
	def boolean isLowerOrEquals(Integer int1, Integer int2){
		if(int2!=null) 
			return int1 <= int2
		else
			return true;
	}
	
	def boolean isGreaterOrEquals(Integer int1, Integer int2){
		if(int2!=null) 
			return int1 >= int2
		else
			return true;
	}
	
	/** Retorna el valor entero del string dado como parametro.
	 * En caso de en la conversión se lanze una {@link NumberFormatException} se retorna null. */
	def toInt(String str) {
		try {
			return Integer.valueOf(str)
		}
		catch(NumberFormatException e) {
			return null
		}
	}
}