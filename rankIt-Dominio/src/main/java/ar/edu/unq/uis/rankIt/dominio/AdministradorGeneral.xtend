package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AdministradorGeneral {
	AdministradorDePublicaciones adminPublicaciones
	AdministradorDeUsuarios adminUsuarios
	AdministradorDeCalificaciones adminCalificaciones
	
	
	// metodos de admin de servicios
		
	def agregarServicio(Publicacion p) {
		adminPublicaciones.agregarServicio(p)
	}
	
	def serviciosTotales() {
		adminPublicaciones.serviciosInscriptos
	}

	def serviciosHabilitados() {
		adminPublicaciones.serviciosHabilitados
	}

	def serviciosDeshabilitados() {
		adminPublicaciones.serviciosDeshabilitados
	}
	
	def eliminarServicio(Publicacion p) {
		adminPublicaciones.borrarServicio(p)
	}
	
	def buscarServicio(Publicacion p) {
		adminPublicaciones.buscarServicio(p)
	}
	/* 
	// Métodos de lugares
 
	def agregarLugar(Publicacion p) {
		adminPublicaciones.agregarLugar(p)
	}
	
	def lugaresTotales() {
		adminPublicaciones.lugaresInscriptos
	}
	
	def lugaresHabilitados() {
		adminPublicaciones.lugaresHabilitados
	}
	
	def lugaresDeshabilitados() {
		lugaresTotales - lugaresHabilitados
	}
	
	def eliminarLugar(Publicacion p) {
		adminPublicaciones.borrarLugar(p)
	}
	
	def buscarLugar(Publicacion p) {
		adminPublicaciones.buscarLugar(p)
	}
	
	// Métodos de usuario
	
	def agregarUsuario(Usuario u) {
		adminUsuarios.agregarUsuario(u)
	}

	def usuariosTotales() {
	 	adminUsuarios.usuariosRegistrados
	}
	
	def usuariosActivos() {
		adminUsuarios.usuariosActivos
	}
	
	def usuariosInactivos() {
		adminUsuarios.usuariosInactivos
	}
	
	def usuariosBaneados() {
		adminUsuarios.usuariosBaneados
	}
	
	def eliminarUsuario(Usuario u) {
		adminUsuarios.borrarUsuario(u)
	}
	
	def buscarUsuario(Usuario u) {
		adminUsuarios.buscarUsuario(u)
	}
	
	// metodos de calificaciones
	
	
	def agregarCalificacion(Calificacion c) {
		adminCalificaciones.agregarCalificacion(c)
	}
	def calificacionesTotales() {
		adminCalificaciones.calificacionesRegistradas
	}
	
	def calificacionesOfensivas() {
		adminCalificaciones.calificacionesOfensivas
	}
	
	def eliminarCalificacion(Calificacion c) {
		adminCalificaciones.borrarCalificacion(c)
	}
	
	def buscarCalificacion(Usuario u, Publicacion evaluado) {
		adminCalificaciones.buscarCalificacion(u, evaluado)
	}
	*/
}