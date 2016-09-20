package ar.edu.unq.uis.rankIt.dominio.buscadores

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils
import ar.edu.unq.uis.rankIt.dominio.Usuario

@Accessors
@Observable
class BuscadorDeUsuarios {
	
	var String patronDeBusqueda
	var List<Usuario> resultados
	var List<Usuario> usuarios

	new(List<Usuario> usuarios) {
		this.usuarios = usuarios
		this.patronDeBusqueda = ""
		this.search()
	}
	
	def setPatronDeBusqueda(String patron) {
		this.patronDeBusqueda = patron.toLowerCase
		this.search()
	}
	
	def void search() {
		this.resultados = usuarios.filter[ usuario |
			usuario.nombre.toLowerCase.matches("(.*)"+this.patronDeBusqueda+"(.*)")
		].toList
		ObservableUtils.firePropertyChanged(this, "resultados")
	}
	
}
