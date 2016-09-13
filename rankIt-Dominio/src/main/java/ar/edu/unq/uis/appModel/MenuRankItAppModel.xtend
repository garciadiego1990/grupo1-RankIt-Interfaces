package ar.edu.unq.uis.appModel

import ar.edu.unq.uis.rankIt.dominio.Administrador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

/** 
 * Clase AppModel para la vista del menú de RankIt, módulo de administador.
 * */
@Accessors
@Observable
class MenuRankItAppModel {
	
	var Administrador administrador
	
	new() {
		this.administrador = new Administrador()
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
		this.administrador.usuariosActivos+" / "+this.administrador.usuariosTotales+" ( "+this.administrador.usuariosBaneados+" )"
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
		this.administrador.serviciosHabilitados+" / "+this.administrador.serviciosTotales
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
		this.administrador.lugaresHabilitados+" / "+this.administrador.lugaresTotales
	}
	
}