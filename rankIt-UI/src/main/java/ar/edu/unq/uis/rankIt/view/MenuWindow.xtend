package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.appModel.MenuRankItAppModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.uis.appModel.AdministrarUsuariosRankItAppModel
import ar.edu.unq.uis.appModel.AdministrarLugaresRankItAppModel
import ar.edu.unq.uis.appModel.AdministrarServiciosRankItAppModel

class MenuWindow extends SimpleWindow<MenuRankItAppModel> {
	
	new(WindowOwner parent, MenuRankItAppModel model) {
		super(parent, model)
		this.title = "Rank-It"
	}
	
	override protected addActions(Panel actionsPanel) {
		//Sin uso para esta ventana
	}
	
	override protected createFormPanel(Panel mainPanel) {
		//Sin uso para esta ventana
	}
	
	/**
	 * Este método redefine el template para la ventana {@link MenuWindow}.
	 * En caso de existir la definición del método {@link #createContents(Panel)}
	 * se ejecutará en lugar de este
	 * 
	 * @param mainPanel - {@link Panel} principal de la ventana
	 */
	override createMainTemplate(Panel mainPanel) {
		
		new Titulo(mainPanel, "Rank-It! Modulo de administracion", 20)
				
		new Label(mainPanel) => [
			it.text = 	"\nDesde este módulo vas a poder gestionar los datos y opciones de la aplicación \n\n"
				   +"Como sos una persona de confianza vas a tener acceso a todo! \n\n"
				   +"Siempre acordate: \"con un gran poder viene una gran responsabilidad\"\n"
			it.height = 120
		]

		this.crearBotonesDeAdmins(mainPanel)
	}
	
	
	/**
	 * Este método crea los botones de la ventana {@link MenuWindow}, los cuales permiten navegar
	 * entre las distintas pantallas de administración.
	 * 
	 * @param mainPanel - Panel principal de la ventana.
	 */
	def void crearBotonesDeAdmins(Panel mainPanel) {
		val botonesPanel= new Panel(mainPanel)
		botonesPanel.layout = new ColumnLayout(4)
		
		val panelBotonUsuarios = 		new Panel(botonesPanel)
		val panelBotonCalificaciones = 	new Panel(botonesPanel)
		val panelBotonServicios = 		new Panel(botonesPanel)		
		val panelBotonLugares = 		new Panel(botonesPanel)

		val anchoLabelBoton = 140

		new Button(panelBotonUsuarios) =>[
			it.caption = "Adm. Usuarios"
			val model = new AdministrarUsuariosRankItAppModel()
			
//			model.getAdministrador() = this.modelObject.administrador
	
			it.onClick [ | new AdministrarUsuariosWindow(this, model).open ]
			it.width = anchoLabelBoton
		]
		
		new Label(panelBotonUsuarios) => [
			it.value <=> "estadisticasUsuarios"
			it.width = anchoLabelBoton
		]
		
		
		new Button(panelBotonCalificaciones) =>[
			it.caption = "Adm. Calificaciones"
			//onClick [ |  ]
			it.width = anchoLabelBoton
		] 
		new Label(panelBotonCalificaciones) => [
			it.value <=> "estadisticasCalificaciones"
			it.width = anchoLabelBoton
		]
		
		new Button(panelBotonServicios) =>[
			it.caption = "Adm. Servicios"
			it.onClick [ | new AdministrarServiciosWindow(this, new AdministrarServiciosRankItAppModel).open ]
			it.width = anchoLabelBoton
			
		] 
		
		new Label(panelBotonServicios) => [
			it.value <=> "estadisticasServicios"
			it.width = anchoLabelBoton
		]
		
		new Button(panelBotonLugares) =>[
			it.caption = "Adm. Lugares"
			it.onClick [ | new AdministrarLugaresWindow(this, new AdministrarLugaresRankItAppModel).open ]
			it.width = anchoLabelBoton
		]
		
		new Label(panelBotonLugares) => [
			it.value <=> "estadisticasLugares"
			it.width = anchoLabelBoton
		]
	}
	
}