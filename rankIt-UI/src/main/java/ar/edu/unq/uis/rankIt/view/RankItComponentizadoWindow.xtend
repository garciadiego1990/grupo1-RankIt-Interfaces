package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.appModel.MenuRankItAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.HorizontalLayout
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*


class RankItComponentizadoWindow extends SimpleWindow<MenuRankItAppModel> {
	
	new(WindowOwner parent, MenuRankItAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Rank-It"
		
		new Titulo(mainPanel, "Rank-It! Modulo de administracion", 20)
		mainPanel.layout = new VerticalLayout

		
		new Label(mainPanel) => [
			text = 	"\nDesde este módulo vas a poder gestionar los datos y opciones de la aplicación \n\n"
				   +"Como sos una persona de confianza vas a tener acceso a todo! \n\n"
				   +"Siempre acordate: \"con un gran poder viene una gran responsabilidad\"\n"
			setHeight(120)
		]

		//Se crea un nuevo panel que contenera los botones y se establece con un layout horizontal
		val Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new HorizontalLayout()
		
		//Muestra en pantalla los botones de administracion
		this.crearBotonesDeAdmins(contentPanel)
	}
	
	
	def void crearBotonesDeAdmins(Panel owner) {
		
		var panelBotonUsuarios = new Panel(owner)
		var panelBotonCalificaciones = new Panel(owner)
		var panelBotonServicios = new Panel(owner)		
		var panelBotonLugares = new Panel(owner)

		new Button(panelBotonUsuarios) =>[
			caption = "Adm. Usuarios"
			//onClick [ |  ]
		]
		new Label(panelBotonUsuarios).value <=> "estadisticasUsuarios"
		
		
		new Button(panelBotonCalificaciones) =>[
			caption = "Adm. Calificaciones"
			//onClick [ |  ]
		] 
		new Label(panelBotonCalificaciones).value <=> "estadisticasCalificaciones"
		
		new Button(panelBotonServicios) =>[
			caption = "Adm. Servicios"
			//onClick [ |  ]
		] 
		new Label(panelBotonServicios).value <=> "estadisticasServicios"
		
		new Button(panelBotonLugares) =>[
			caption = "Adm. Lugares"
			//onClick [ |  ]
		]
		new Label(panelBotonLugares).value <=> "estadisticasLugares"
	}
	
}