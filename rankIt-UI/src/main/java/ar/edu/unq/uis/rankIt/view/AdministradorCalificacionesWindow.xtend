package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.rankIt.appModel.AdministradorCalificacionesAppModel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel

class AdministradorCalificacionesWindow extends Dialog<AdministradorCalificacionesAppModel>{
	
	new(WindowOwner owner, AdministradorDeCalificaciones model) {
		super(owner, new AdministradorCalificacionesAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
}