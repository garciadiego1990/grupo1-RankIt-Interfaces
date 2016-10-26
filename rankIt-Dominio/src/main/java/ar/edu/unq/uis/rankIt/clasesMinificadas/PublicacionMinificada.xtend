package ar.edu.unq.uis.rankIt.clasesMinificadas

import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import java.util.List
import java.util.ArrayList

@Accessors
class PublicacionMinificada {
	Integer id
	String tipo
	String nombre

	new(Publicacion publicacion) {
		this.id = publicacion.id
		this.tipo = publicacion.tipo
		this.nombre = publicacion.nombre
	}

	/** Dado un administrador general se retorna un lista de mini-publicaciones de todas las publicaciones registradas en
	 * la aplicación*/
	def static todasLasPublicaciones(AdministradorGeneral admin) {
		var List<PublicacionMinificada> miniPublicaciones = new ArrayList<PublicacionMinificada>
		miniPublicaciones.addAll = publicaciones(admin.adminServicios.publicaciones)
		miniPublicaciones.addAll = publicaciones(admin.adminLugares.publicaciones)
		return miniPublicaciones
	}

	/** Dada una lista de publicaciones se retorna una nueva lista que contiene todas las publicaciones dadas convertidas
	 * en formato mini-publicación*/
	def static publicaciones(List<Publicacion> publicaciones) {
		val List<PublicacionMinificada> miniPublicaciones = new ArrayList<PublicacionMinificada>
		publicaciones.forEach[each|miniPublicaciones.add = new PublicacionMinificada(each)]
		return miniPublicaciones
	}
}