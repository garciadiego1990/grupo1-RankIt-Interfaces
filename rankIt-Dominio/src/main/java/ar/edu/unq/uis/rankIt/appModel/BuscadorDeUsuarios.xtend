package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.Usuario
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class BuscadorDeUsuarios {
	
	var String patronDeBusqueda
	var List<Usuario> resultados
	var List<Usuario> usuarios
		

	new(Class<Usuario> entityType, List<Usuario> usuarios) {
		this.usuarios = usuarios
		this.patronDeBusqueda = ""
		this.search()
	}
	
	def setPatronDeBusqueda(String patron) {
		this.patronDeBusqueda = patron
		this.search()
	}
	
	def void search() {
		if(this.patronDeBusqueda == "" )
			this.resultados = this.usuarios
		else
			this.resultados = this.usuarios.filter[ usuario | usuario.nombre.matches("(.*)"+patronDeBusqueda+"(.*)")].toList
		
		ObservableUtils.firePropertyChanged(this, "resultados")
	}
	
}