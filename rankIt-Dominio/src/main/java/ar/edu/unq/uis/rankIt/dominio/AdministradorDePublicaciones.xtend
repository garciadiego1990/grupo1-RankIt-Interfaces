
package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
@Observable
class AdministradorDePublicaciones {
	List<Publicacion> servicios
	List<Publicacion> lugares
	 
	new() {
		servicios = new ArrayList<Publicacion>
		lugares = new ArrayList<Publicacion>
	} 
	
	def agregarServicio(Publicacion p) {
		servicios.add(p)
	}
	
	def serviciosInscriptos() {
		servicios.size
	}

	def serviciosHabilitados() {
		servicios.filter[it.estaHabilitado].size
	}

	def serviciosDeshabilitados() {
		serviciosInscriptos - serviciosHabilitados
	}
	
	def borrarServicio(Publicacion p) {
		servicios.remove(p)
	}
	
	def buscarServicio(Publicacion p) {
		return servicios.filter[it.nombre == p.nombre].get(0)
	}
	
	// metodos de lugares
	
	def void agregarLugar(Publicacion p) {
		lugares.add(p)
	}
	
	def int lugaresInscriptos() {
		lugares.size
	}
	
	def int lugaresHabilitados() {
		lugares.filter[it.estaHabilitado].size
	}

	def int lugaresDeshabilitados() {
		lugaresInscriptos - lugaresHabilitados
	}
	
	def void eliminarLugar(Publicacion p) {
		lugares.remove(p)
	}
		
}