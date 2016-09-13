package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.Administrador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

/** 
 * Clase AppModel para la vista del menú de RankIt, módulo de administador.
 * */
@Accessors
@Observable
class MenuRankItAppModel {
	
	var Administrador admin
	
	new() {
		this.admin = new Administrador()
	}
	
	
	/**
	 * Se responde con las estadisticas de {@link Usuario}s de RankIt.
	 * El valor retornado está compuesto por tres valores numericos:
	 * 	- Cant. de usuarios activos;
	 *  - Cant. de usuarios inactivos;
	 *  - Cant. de usuarios baneados.
	 * 
	 * El valor retonado posee el formato de texto " <activos> / <total> (<baneados>)"
	 */
	def String getEstadisticasUsuarios() {
		this.admin.usuariosActivos+" / "+this.admin.usuariosTotales+" ( "+this.admin.usuariosBaneados+" )"
	}
	
	
	/**
	 * Se responde con las estadisticas de {@link Calificacion}s de RankIt.
	 * El valor retornado está compuesto por dos valores numericos:
TODO * TODO TODO TODO TODO
	 * El valor retonado posee el formato de texto ""
	 */
	def String getEstadisticasCalificaciones() {
		"TODO - Incompleto"
	}
	
	
	/**
	 * Se responde con las estadisticas de {@link Servicio}s de RankIt.
	 * El valor retornado está compuesto por dos valores numericos:
	 *  - Cant. de servicios habilitados;
	 *  - Catn. de servicios totales.
	 * 
	 * El valor retonado posee el formato de texto " <habilitados> / <total> "
	 */
	def String getEstadisticasServicios() {
		this.admin.serviciosHabilitados+" / "+this.admin.serviciosTotales
	}
	
	/**
	 * Se responde con las estadisticas de {@link Lugar}es de RankIt.
	 * El valor retornado está compuesto por dos valores numericos:
	 *  - Cant. de lugares habilitados;
	 *  - Cant. de lugares totales.
	 * 
	 * El valor retonado posee el formato de texto " <habilitados> / <total> "
	 */
	def String getEstadisticasLugares() {
		this.admin.lugaresHabilitados+" / "+this.admin.lugaresTotales
	}
	
}