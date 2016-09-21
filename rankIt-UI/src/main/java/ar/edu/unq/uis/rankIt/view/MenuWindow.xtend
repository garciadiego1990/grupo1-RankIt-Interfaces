
package ar.edu.unq.uis.rankIt.view


import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.uis.rankIt.appModel.MenuAppModel
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class MenuWindow extends SimpleWindow<MenuAppModel> {
	
	val anchoBoton = 130
	
	new(WindowOwner parent, MenuAppModel model) {
		super(parent, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Rank-It"
		
		new Titulo(mainPanel, "Rank-It! Modulo de administración", 20).width = 500
		
		new Label(mainPanel).text = "\n"
		+"Desde este modulo vas a poder gestionar los datos y opciones de la aplicación"
		+"\n\n" 		
		+"como sos una persona de confianza vas a tener acceso a todo!!"
		+"\n\n"
		+"Siempre acordate: \"Con un gran poder viene una gran responsabilidad\"\n"
	}
	
	override protected addActions(Panel actionsPanel) {
		val botonesPanel = new Panel(actionsPanel)
		botonesPanel.layout = new ColumnLayout(4)
		
		this.crearBotonAdminUsuarios(botonesPanel)
		this.crearBotonAdminCalificaciones(botonesPanel)
		this.crearBotonAdminServicios(botonesPanel)
		this.crearBotonAdminLugares(botonesPanel)
	}
	
	override createMainTemplate(Panel mainPanel) {
		this.createFormPanel(mainPanel)
		this.addActions(mainPanel)
	}
	
	 
	def void crearBotonAdminUsuarios(Panel owner) {
		val Panel botonUsuariosPanel = new Panel(owner)
		
		new Button(botonUsuariosPanel) => [
			it.caption = "Adm. Usuarios"
			it.width = this.anchoBoton
			it.onClick [ |
				new AdministradorUsuariosWindow(this, this.modelObject.appModelUsuarios, "Usuarios").open
			]
		]
		
		new Label(botonUsuariosPanel) => [
			it.value <=> "appModelUsuarios.resumen"
			it.width = this.anchoBoton
		]

	}
	
	
	def void crearBotonAdminCalificaciones(Panel owner) {
		val Panel botonCalificacionesPanel = new Panel(owner)
		
		new Button(botonCalificacionesPanel) => [
			it.caption = "Adm. Calificaciones"
			it.width = this.anchoBoton
			it.onClick [ | new AdministradorCalificacionesWindow(this, this.modelObject.appModelCalificaciones).open ]
		]

		new Label(botonCalificacionesPanel) => [
			it.value <=> "appModelCalificaciones.resumen"
			it.width = this.anchoBoton	
		]
	
	}
	
	
	def void crearBotonAdminServicios(Panel owner) {
		val Panel botonServiciosPanel = new Panel(owner)
		
		new Button(botonServiciosPanel) => [
			it.caption = "Adm. Servicios"
			it.width = this.anchoBoton
			it.onClick [ |
				new AdministradorPublicacionesWindow(this, this.modelObject.appModelServicios, "Servicios").open
			]
		]
		
		new Label(botonServiciosPanel) => [
			it.value <=> "appModelServicios.resumen"
			it.width = this.anchoBoton
		]
	}
	
	
	def void crearBotonAdminLugares(Panel owner) {
		val Panel botonLugaresPanel = new Panel(owner)
		
		new Button(botonLugaresPanel) => [
			it.caption = "Adm. Lugares"
			it.width = this.anchoBoton
			it.onClick [ |
				new AdministradorPublicacionesWindow(this, this.modelObject.appModelLugares, "Lugares").open
			]
		]

		new Label(botonLugaresPanel) => [
			it.value <=> "appModelLugares.resumen"
			it.width = this.anchoBoton
		]
	}
	
	
}