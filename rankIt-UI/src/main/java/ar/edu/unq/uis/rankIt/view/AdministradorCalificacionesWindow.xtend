package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.uis.rankIt.appModel.CalificacionesAppModel

class AdministradorCalificacionesWindow extends Dialog<CalificacionesAppModel>{
	
	new(WindowOwner owner, AdministradorDeCalificaciones model) {
		super(owner, new CalificacionesAppModel(model))
	}
	
	override protected createFormPanel(Panel mainPanel) {
	}
	
}