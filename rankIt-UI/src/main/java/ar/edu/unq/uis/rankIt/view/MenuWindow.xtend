package ar.edu.unq.uis.rankIt.view


import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import ar.edu.unq.uis.rankIt.appModel.MenuAppModel
import org.uqbar.arena.widgets.Button

class MenuWindow extends SimpleWindow<MenuAppModel> {
	
	new(WindowOwner parent, MenuAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {}
	
	override protected createFormPanel(Panel mainPanel) {}
	
	override createMainTemplate(Panel mainPanel) {
		
		this.title = "Rank-It"
		
		//new Titulo(mainPanel, "Rank-It! Modulo de administracion", 20)
		
		val tituloPanel = new Panel(mainPanel)
		tituloPanel.layout = new ColumnLayout(3)
		
		// darle independencia al titulo
		new Titulo(tituloPanel, "Rank-It! Modulo de administración", 20)
		new Label(tituloPanel) => []
		new Label(tituloPanel) => []
		
		
		val textoPanel = new Panel(mainPanel)
		textoPanel.layout = new ColumnLayout(3) 		
		new Label(textoPanel) => [
			text = 	"Desde este módulo vas a poder gestionar los datos y opciones de la aplicación"
			height = 50	   	
		]
		new Label(textoPanel) => [height = 50]
		new Label(textoPanel) => [height = 50]
		
		new Label(textoPanel) => [
			text = "Como sos una persona de confianza vas a tener acceso a todo! "
			height = 50
		]
		new Label(textoPanel) => [height = 50]
		new Label(textoPanel) => [height = 50]
		
		new Label(textoPanel) => [
			text = "Siempre acordate: \"con un gran poder viene una gran responsabilidad\""
			height = 50
			
		]
		new Label(textoPanel) => [height = 50]
		new Label(textoPanel) => [height = 50]
		
		this.crearBotonesDeAdmins(mainPanel)
	}
	
	 
	def void crearBotonesDeAdmins(Panel mainPanel) {
		val botonesPanel = new Panel(mainPanel)
		botonesPanel.layout = new ColumnLayout(4)
		
		crearBotonAdminUsuarios(botonesPanel)
		crearBotonAdminCalificaciones(botonesPanel)
		crearBotonAdminServicios(botonesPanel)
		crearBotonAdminLugares(botonesPanel)
		
	}
	
	def void crearBotonAdminUsuarios(Panel owner) {
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Usuarios"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorUsuariosWindow(this, this.modelObject.admin.adminUsuarios).open ]
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
	
	def void crearBotonAdminCalificaciones(Panel owner) {
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Usuarios"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorUsuariosWindow(this, this.modelObject.admin.adminUsuarios).open ]
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
			caption = "Adm. Usuarios"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorUsuariosWindow(this, this.modelObject.admin.adminUsuarios).open ]
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
	
	def void crearBotonAdminLugares(Panel owner) {
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Usuarios"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorUsuariosWindow(this, this.modelObject.admin.adminUsuarios).open ]
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
	
	
}