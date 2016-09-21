package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.HorizontalLayout

class ConfirmacionDialog<T>  extends Dialog<T> {
	
	var mensajeAConfirmar = ""
	
	new(WindowOwner owner, T model, String msj) {
		super(owner, model)
		this.title = defaultTitle
		this.mensajeAConfirmar = msj
	}

	def defaultTitle() {
		"Confirme la operación"
	}
	
	def void setMensajeAConfirmar(String msj) {
		this.mensajeAConfirmar = msj
	}
	
	override createContents(Panel mainPanel) {
		this.createFormPanel(mainPanel)
		this.addActions(mainPanel)
	}

	override protected void addActions(Panel actions) {
		var botones = new Panel(actions).layout = new HorizontalLayout
		
		new Button(botones) => [
			caption = "Aceptar"
			onClick [| this.accept ]
		]

		new Button(botones) => [
			caption = "Cancelar"	
			onClick [| this.cancel ]
		]
	}

	override executeTask() {
		super.executeTask()
	}
	
	override protected createFormPanel(Panel mainPanel) {
		new Label(mainPanel).text = this.mensajeAConfirmar
	}
	
}