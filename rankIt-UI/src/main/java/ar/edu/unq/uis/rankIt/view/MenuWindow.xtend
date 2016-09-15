
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
		
		val tituloPanel = new Panel(mainPanel)
		
		new Titulo(tituloPanel, "Rank-It! Modulo de administración", 20)
		
		val textoPanel = new Panel(mainPanel)
		
		new Label(textoPanel).text = "Desde este modulo vas a poder gestionar los datos y opciones de la aplicación\n\n" 		
		+"como sos una persona de confianza vas a tener acceso a todo!!\n\n"
		+"Siempre acordate con un gran poder viene una gran responsabilidad\n"
		
		this.crearBotonesDeAdmins(mainPanel)
		
	}
	
	 
	def void crearBotonesDeAdmins(Panel mainPanel) {
		val botonesPanel = new Panel(mainPanel)
		botonesPanel.layout = new ColumnLayout(4)
		
//<<<<<<< HEAD
//		val panelBotonUsuarios = 		new Panel(botonesPanel)
//		val panelBotonCalificaciones = 	new Panel(botonesPanel)
//		val panelBotonServicios = 		new Panel(botonesPanel)		
//		val panelBotonLugares = 		new Panel(botonesPanel)
//
//		val anchoLabelBoton = 140
//
//		new Button(panelBotonUsuarios) =>[
//			it.caption = "Adm. Usuarios"	
//			it.onClick [ | new AdministrarUsuariosWindow(this, new AdministrarUsuariosRankItAppModel()).open ]
//			it.width = anchoLabelBoton
//=======
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
			caption = "Adm. Calificaciones"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorCalificacionesWindow(this, this.modelObject.admin.adminCalificaciones).open ]
//>>>>>>> af44ac69892fec2f44bc06e8424a4af2dc24bb79
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
		
//<<<<<<< HEAD
//		new Button(panelBotonServicios) =>[
//			it.caption = "Adm. Servicios"
////			it.onClick [ | new AdministrarServiciosWindow(this, new AdministrarServiciosRankItAppModel).open ]
//			it.width = anchoLabelBoton
//			
//		] 
//=======
		new Button(botonAdminPanel) => [
			caption = "Adm. Servicios"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorServiciosWindow(this, this.modelObject.admin.adminServicios).open ]
		]
//>>>>>>> af44ac69892fec2f44bc06e8424a4af2dc24bb79
		
		val Panel datosDeUsuariosPanel = new Panel(botonAdminPanel)
		datosDeUsuariosPanel.layout = new ColumnLayout(4)
		
		new Label(datosDeUsuariosPanel) => [
			bindValueToProperty("serviciosInscriptos")
			//width = 135	
		]
		new Label(datosDeUsuariosPanel) => [
			text = ("/")
			//width = 135	
		]
		
//<<<<<<< HEAD
//		new Button(panelBotonLugares) =>[
//			it.caption = "Adm. Lugares"
////			it.onClick [ | new AdministrarLugaresWindow(this, new AdministrarLugaresRankItAppModel).open ]
//			it.width = anchoLabelBoton
//=======
		new Label(datosDeUsuariosPanel) => [
			//bindValueToProperty("?")
			//width = 135	
//>>>>>>> af44ac69892fec2f44bc06e8424a4af2dc24bb79
		]
		
		new Label(datosDeUsuariosPanel) => [
			//bindValueToProperty("?")
			//width = 135	
		]
	}
	
	def void crearBotonAdminLugares(Panel owner) {
		val Panel botonAdminPanel = new Panel(owner)
		
		new Button(botonAdminPanel) => [
			caption = "Adm. Lugares"
			//width = 100
			setAsDefault
			onClick [ | new AdministradorLugaresWindow(this, this.modelObject.admin.adminLugares).open ]
		]
		
		val Panel datosDeUsuariosPanel = new Panel(botonAdminPanel)
		datosDeUsuariosPanel.layout = new ColumnLayout(4)
		
		new Label(datosDeUsuariosPanel) => [
			bindValueToProperty("lugaresInscriptos")
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