package ar.edu.unq.uis.rankIt.appModel

import org.uqbar.commons.model.Search
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class BuscadorDeLugares extends Search<Publicacion>{
	
	//selected
	
	//results
	
	var String nombreLugarABuscar
	var List<Publicacion> lugares
	
	private new(Class<Publicacion> entityType) {
		super(entityType)
	}
	
	new(Class<Publicacion> entityType, List<Publicacion> lugares) {
		this(entityType)
		this.lugares = lugares
		this.nombreLugarABuscar = ""
		this.search()
	}
	
	def setNombreLugarABuscar(String nombre) {
		this.nombreLugarABuscar = nombre
		this.search()
	}
	
	
	override clear() {
		// No necesita ser implementado
	}
	
	override protected doSearch() {
		if(this.nombreLugarABuscar == "" )
			return this.lugares
		else
			return this.lugares.filter[ lugar | lugar.nombre.matches("(.*)"+nombreLugarABuscar+"(.*)")].toList
	}
	
	override removeSelected() {
		// No necesita ser implementado
	}
}