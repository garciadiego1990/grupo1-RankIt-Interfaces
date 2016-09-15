package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministradorGeneral {
	AdministradorDeUsuarios adminUsuarios
	AdministradorDeCalificaciones adminCalificaciones
	AdministradorDePublicaciones adminServicios = new AdministradorDePublicaciones	
	AdministradorDePublicaciones adminLugares = new AdministradorDePublicaciones
	
	
	// Métodos de usuario
//	
//	def agregarUsuario(Usuario u) {
//		adminUsuarios.agregarUsuario(u)
//	}
//
//	def usuariosTotales() {
//	 	adminUsuarios.usuariosRegistrados
//	}
//	
//	def usuariosActivos() {
//		adminUsuarios.usuariosActivos
//	}
//	
//	def usuariosInactivos() {
//		adminUsuarios.usuariosInactivos
//	}
//	
//	def usuariosBaneados() {
//		adminUsuarios.usuariosBaneados
//	}
//	
//	def eliminarUsuario(Usuario u) {
//		adminUsuarios.borrarUsuario(u)
//	}
//	
//	def buscarUsuario(Usuario u) {
//		adminUsuarios.buscarUsuario(u)
//	}
	
	// metodos de calificaciones
	
	
//	def agregarCalificacion(Calificacion c) {
//		adminCalificaciones.agregarCalificacion(c)
//	}
//	def calificacionesTotales() {
//		adminCalificaciones.calificacionesRegistradas
//	}
	
//	def calificacionesOfensivas() {
//		adminCalificaciones.calificacionesOfensivas
//	}
//	
//	def eliminarCalificacion(Calificacion c) {
//		adminCalificaciones.borrarCalificacion(c)
//	}
//	
//	def buscarCalificacion(Usuario u, Publicacion evaluado) {
//		adminCalificaciones.buscarCalificacion(u, evaluado)
//	}
//	*/
}