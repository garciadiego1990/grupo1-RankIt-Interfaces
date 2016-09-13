package ar.edu.unq.uis.rankIt.appModel

import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class RankItAppModel {
	AdministradorGeneral admin
	int inscriptos
	int habilitados
	
	new(AdministradorGeneral admin) {
		this.admin = admin
	}
	
	def void setInscriptos() {
		inscriptos = admin.serviciosTotales
	}
	
	def int getInscriptos() {
		return inscriptos
	}
	
	def int getHabilitados() {
		return habilitados
	}
	
	def void setHabilitados() {
		habilitados = admin.serviciosHabilitados
	}
	
	
}