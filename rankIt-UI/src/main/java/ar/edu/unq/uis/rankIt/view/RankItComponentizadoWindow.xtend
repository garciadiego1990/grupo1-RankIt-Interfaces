package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.appModel.RankItAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label

class RankItComponentizadoWindow extends SimpleWindow<RankItAppModel> {
	
	new(WindowOwner parent, RankItAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Rank-It"
		
		new Titulo(mainPanel, "Rank/It! Modulo de administracion", 20)
		mainPanel.layout = new VerticalLayout

		
		new Label(mainPanel) => [
			text = "Desde este módulo vas a poder gestionar los datos y opciones de la aplicacion"
			setHeight(50)
		]
		new Label(mainPanel)=> [
			text = "Como sos una persona de confianza vas a tener acceso a todo!"
			setHeight(50)
		]
		new Label(mainPanel)=> [
			text = "Siempre acordate: 'con un gran poder viene una gran responsabilidad'"
			setHeight(50)
		]

		//Agregamos el contenido
		val Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new HorizontalLayout()
		this.crearListadoDeAdmins(contentPanel)
	}
	
	def crearListadoDeAdmins(Panel owner) {
		//val Panel panelDeListadoDeMaterias = new Panel(owner)
			
		new Button(owner) =>[
			caption = "Adm. Usuarios"
			//onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
		]
		
		new Button(owner) =>[
			caption = "Adm. Calificaciones"
			//onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
		] 
		
		new Button(owner) =>[
			caption = "Adm. Servicios"
			//onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
		] 
		
		new Button(owner) =>[
			caption = "Adm. Lugares"
			//onClick [ | new NuevaMateriaWindow(this, this.modelObject.carrera).open ]
		]  
	}
	
}