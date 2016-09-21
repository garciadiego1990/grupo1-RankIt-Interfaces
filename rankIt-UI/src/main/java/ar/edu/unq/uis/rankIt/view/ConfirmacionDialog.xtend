package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.rankIt.appModel.PublicacionAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.HorizontalLayout

class ConfirmacionDialog  extends Dialog<PublicacionAppModel> {
		new(WindowOwner owner, PublicacionAppModel model) {
		super(owner, model)
		title = defaultTitle
	}

	def defaultTitle() {
		"Confirmacion de eliminar"
	}
	
	

	override protected void addActions(Panel actions) {
		var botones = new Panel(actions).layout = new HorizontalLayout
		
		new Button(botones) => [
			caption = "Aceptar"
			onClick [| this.accept ]
			setAsDefault
			disableOnError	
		]

		new Button(botones) => [
			caption = "Cancelar"	
			onClick [| this.cancel ]
		]
	}
	
	// No se si es necesario o si esta bien
	override executeTask() {
		super.executeTask()
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = "¿Desea eliminar la publicación seleccinada?"
	}
	
}