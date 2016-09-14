package ar.edu.unq.uis.rankIt.appModel

import org.uqbar.commons.model.Search
import ar.edu.unq.uis.rankIt.dominio.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class BuscadorDeUsuarios extends Search<Usuario>{
	
	//selected
	
	//results
	
	var String nombreUsuarioABuscar
	var List<Usuario> usuarios
	
	private new(Class<Usuario> entityType) {
		super(entityType)
	}
	
	new(Class<Usuario> entityType, List<Usuario> usuarios) {
		this(entityType)
		this.usuarios = usuarios
		this.nombreUsuarioABuscar = ""
		this.search()
	}
	
	def setNombreUsuarioABuscar(String nombre) {
		this.nombreUsuarioABuscar = nombre
		this.search()
	}
	
	
	override clear() {
		// No necesita ser implementado
	}
	
	override protected doSearch() {
		if(this.nombreUsuarioABuscar == "" )
			return this.usuarios
		else
			return this.usuarios.filter[ usuario | usuario.nombre.matches("(.*)"+nombreUsuarioABuscar+"(.*)")].toList
	}
	
	override removeSelected() {
		// No necesita ser implementado
	}
	
}