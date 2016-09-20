package ar.edu.unq.uis.rankIt.dominio

import java.util.ArrayList
import java.util.LinkedHashSet
import java.util.List
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AdministradorDeCalificaciones {
	
	List<Calificacion> calificaciones = new ArrayList<Calificacion>
	
	//Cargados en el bootsrap
	List<Publicacion> servicios	= new ArrayList<Publicacion>
	List<Publicacion> lugares = new ArrayList<Publicacion>
	
	
	new(){
		this.calificaciones = new ArrayList<Calificacion>
		this.servicios	= new ArrayList<Publicacion>
		this.lugares = new ArrayList<Publicacion>
		this.actualizarListaDeCalificaciones()
	}	
//
//	// TODO: ¿Es necesario este método? La calificación se la tiene que agregar una publicación - Abel
//	def agregarCalificacion(Calificacion c) {
//		calificaciones.add(c)
//	}

	def int totalCalificaciones() {
		calificaciones.size
	}
	
	// Modificado por recomendacion de Abel
	def int calificacionesOfensivas() {
		calificaciones.filter[esOfensiva].size
	}
//	
//	//TODO: Creo que no se usa. Hay un buscador para hacer esto - Abel
//	// Va a haber problemas si no encuentra lo que busca
//	def Calificacion buscarCalificacion(String usuario, String publicacion) {
//		var List<Calificacion> todasLasCalificaciones = this.calificaciones
//		for(Calificacion c: todasLasCalificaciones){
//			if(c.evaluador.equals(usuario) && c.evaluado.equals(publicacion)) return c		
//		}
//	}
	
	def void eliminarCalificacion(Calificacion c){
		//TODO
	}
	
	def Set<String> getNombrePublicaciones(){
		var Set<String> ret = new LinkedHashSet<String>
		
		for(Calificacion c: calificaciones){
			ret.add(c.evaluado.nombre)
		}
		
		return ret 
		
	}	 

//ACTUALIZAR CALIFICACIONES

	/** Actualizo la lista de calificaciones de este administrador.
	 * Este método debe ser llamado explícitamente cada vez que se hace una inserción o eliminación de una {@link Calificacion} o {@link Publicacion}.
	 * @author ae */
	def void actualizarListaDeCalificaciones() {
		this.calificaciones.clear()
		var List<Publicacion> publicaciones = new ArrayList<Publicacion>
		
		publicaciones.addAll(servicios)
		publicaciones.addAll(lugares)
		
		for(Publicacion p : publicaciones){
			this.calificaciones.addAll(p.calificaciones)
		}
	}

}
