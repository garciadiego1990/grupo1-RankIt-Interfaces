package clasesMinificadas

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import java.util.List
import java.util.ArrayList

@Accessors
class RankingMinificada {
	PublicacionMinificada evaluado
	Integer ranking
	Integer calificaciones

	new(PublicacionMinificada evaluado, Integer ranking, Integer calificaciones) {
		this.evaluado = evaluado
		this.ranking = ranking
		this.calificaciones = calificaciones
	}

	def static rankingDePublicacionesMinificadas(AdministradorGeneral admin) {
		var List<Publicacion> publicacionesOrdenadas = publicacionesOrdenadasPorPromedioDeCalificaciones(admin)
		val List<RankingMinificada> ranking = new ArrayList<RankingMinificada>

		for (Publicacion each : publicacionesOrdenadas) {
			var int rank = publicacionesOrdenadas.indexOf(each) + 1
			var PublicacionMinificada miniPublicacion = new PublicacionMinificada(each)

			ranking.add = new RankingMinificada(miniPublicacion, rank, each.cantidadDeEvaluaciones)
		}

		return ranking
	}
	
	def static publicacionesOrdenadasPorPromedioDeCalificaciones(AdministradorGeneral admin) {
		var List<Publicacion> publicaciones = new ArrayList<Publicacion>()
		publicaciones.addAll = admin.adminServicios.publicaciones
		publicaciones.addAll = admin.adminLugares.publicaciones
		return publicaciones.sortBy[each|each.ratingPromedio].reverse
	}
	}