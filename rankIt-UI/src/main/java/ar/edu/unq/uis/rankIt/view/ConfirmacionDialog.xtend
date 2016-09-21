package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.rankIt.appModel.PublicacionAppModel
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button


class ConfirmacionDialog  extends TransactionalDialog<PublicacionAppModel> {
		new(WindowOwner owner, PublicacionAppModel model) {
		super(owner, model)
		title = defaultTitle
	}

	def defaultTitle() {
		"Confirmacion de eliminar"
	}
	
	

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|modelObject.eliminarPublicacionSeleccionada]
			setAsDefault
			disableOnError	
		]

		new Button(actions) => [
			caption = "Cancelar"	
			onClick [|
				this.close
			]
		]
	}
	
	// No se si es necesario o si esta bien
	override executeTask() {
		super.executeTask()
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}