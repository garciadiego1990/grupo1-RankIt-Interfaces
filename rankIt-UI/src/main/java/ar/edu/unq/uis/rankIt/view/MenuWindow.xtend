
package ar.edu.unq.uis.rankIt.view


import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.uis.rankIt.appModel.MenuAppModel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class MenuWindow extends SimpleWindow<MenuAppModel> {
	
	val anchoLabelBoton = 140
	
	new(WindowOwner parent, MenuAppModel model) {
		super(parent, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		this.title = "Rank-It"
		
		new Titulo(mainPanel, "Rank-It! Modulo de administración", 20)
		
		new Label(mainPanel).text = "\n"
		+"Desde este modulo vas a poder gestionar los datos y opciones de la aplicación"
		+"\n\n" 		
		+"como sos una persona de confianza vas a tener acceso a todo!!"
		+"\n\n"
		+"Siempre acordate: \"con un gran poder viene una gran responsabilidad.\"\n"
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
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Usuarios"
//			width = 
			setAsDefault
			onClick [ | new AdministradorUsuariosWindow(this, this.modelObject.usuariosAppModel).open ]
		]

		
		val Panel datosPanel = new Panel(botonAdminPanel)
		datosPanel.layout = new HorizontalLayout()
		
		this.crearLabelEstadisticasDeUsuario(datosPanel)

	}
	
	
	def crearLabelEstadisticasDeUsuario(Panel datosPanel) {
		new Label(datosPanel).value <=> "usuariosAppModel.antidadUsuariosActivos"
		new Label(datosPanel).text = " / "
		new Label(datosPanel).value
		new Label(datosPanel)
	}
	
	
	def void crearBotonAdminCalificaciones(Panel owner) {
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Calificaciones"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorCalificacionesWindow(this, this.modelObject.calificacionesAppModel).open ]
		]
 		
		val Panel datosDeUsuariosPanel = new Panel(botonAdminPanel)
		datosDeUsuariosPanel.layout = new ColumnLayout(4)
		
		new Label(datosDeUsuariosPanel) => [
			//bindValueToProperty("?")
			//width = 135	
		]
		new Label(datosDeUsuariosPanel) => [
			text = ("/")
			//width = 135	
		]
		
		new Label(datosDeUsuariosPanel) => [
			//bindValueToProperty("?")
			//width = 135	
		]
		
		new Label(datosDeUsuariosPanel) => [
			//bindValueToProperty("?")
			//width = 135	
		]
	
	}
	
	
	def void crearBotonAdminServicios(Panel owner) {
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Servicios"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorServiciosWindow(this, this.modelObject.serviciosAppModel).open ]
		]
		
		val Panel datosDeUsuariosPanel = new Panel(botonAdminPanel)
		datosDeUsuariosPanel.layout = new ColumnLayout(4)
		
		new Label(datosDeUsuariosPanel)

		new Label(datosDeUsuariosPanel)
		
		new Label(datosDeUsuariosPanel)
		
		new Label(datosDeUsuariosPanel)
	}
	
	
	def void crearBotonAdminLugares(Panel owner) {
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Lugares"
			setAsDefault
			onClick [ | 
				new AdministradorLugaresWindow(this, this.modelObject.lugaresAppModel).open
			]
		]
		
		val Panel datosDeUsuariosPanel = new Panel(botonAdminPanel)
		datosDeUsuariosPanel.layout = new ColumnLayout(4)
		
		new Label(datosDeUsuariosPanel)
		
		new Label(datosDeUsuariosPanel)
		
		new Label(datosDeUsuariosPanel)
		
		new Label(datosDeUsuariosPanel) => [
			//bindValueToProperty("?")
			//width = 135	
		]
	}
	
	
}