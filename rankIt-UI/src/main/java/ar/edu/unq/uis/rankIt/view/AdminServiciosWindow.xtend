package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.uqbar.arena.widgets.tables.Column
import java.util.Date
import java.text.SimpleDateFormat
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import ar.edu.unq.uis.rankIt.view.components.Titulo
import ar.edu.unq.uis.rankIt.view.components.LabeledTextBox
import ar.edu.unq.uis.rankIt.view.components.LabeledCheckBox
import ar.edu.unq.uis.rankIt.view.components.Labeled
import ar.edu.unq.uis.rankIt.appModel.AdministradorServiciosAppModel

class AdminServiciosWindow extends SimpleWindow<AdministradorServiciosAppModel> {
	
	new(WindowOwner parent, AdministradorServiciosAppModel model) {
		super(parent, model)
	}
	override protected addActions(Panel actionsPanel) {}

	override protected createFormPanel(Panel mainPanel) {} 
	
	override createMainTemplate(Panel mainPanel) {
		this.title = "Adm. Servicios"
		mainPanel.layout = new VerticalLayout
	 
		//Agregamos el contenido
		val Panel resumenPanel = new Panel(mainPanel)
		val Panel buscadorPanel = new Panel(mainPanel)
		val Panel contentPanel = new Panel(mainPanel)
		contentPanel.layout = new ColumnLayout(2)
		this.crearResumenSituacion(resumenPanel)
		this.crearBuscadorServicios(buscadorPanel)
		this.crearListadoDeServicios(contentPanel)
		this.crearEdicionDeServicioSeleccionada(contentPanel)
	}
	
	def crearResumenSituacion(Panel owner) {
		val resumenPanel = new Panel(owner)
		
		resumenPanel.layout = new ColumnLayout(3)
		
		// darle independencia al titulo
		new Titulo(resumenPanel, "Resumen de situación:", 12)
		new Label(resumenPanel) => []
		new Label(resumenPanel) => []
		
		new Label(resumenPanel) => [
			text = "Servicios inscriptos: "
			width = 135
			//bindValueToProperty("?")
		]
		
		new Label(resumenPanel) => [
			text = "Habilitados: "
			width = 135
			//bindValueToProperty("?")
		]
		
		new Label(resumenPanel) => [
			text = "Deshabilitados: "
			width = 135
			//bindValueToProperty("?")
		]
		
	}
	
	def crearBuscadorServicios(Panel owner) {
		val buscarPanel = new Panel(owner)
		
		//new TituloAlineado(buscarPanel, "Servicios", 15)
			
		buscarPanel.layout = new ColumnLayout(3)
		
		new Titulo(buscarPanel, "Servicios", 15)
		new Label(buscarPanel) => []
		new Label(buscarPanel) => []
		
		new Label(buscarPanel).text = "Buscar por nombre de servicio"
		
		new TextBox(buscarPanel) => [
			width = 200
			//(value <=> "fecha").transformer = new DateTransformer
		]
		
		new Button(buscarPanel) => [
			caption = "Buscar"
			width = 100
			//setAsDefault
			//onClick [ | jugar 
		]
	}
	
	
	
	def crearEdicionDeServicioSeleccionada(Panel owner) {
		
		val Panel edicionPanel = new Panel(owner)
		edicionPanel.layout = new VerticalLayout
		
		new Labeled(edicionPanel)
			.setText("Nombre:")
			.bindValueToProperty("publicacionSeleccionada.nombre")	
		
		
		new Button(edicionPanel)=>[
			caption = "Edita la informacion"]
		
		new LabeledTextBox(edicionPanel)
			.setText("Nombre:")
			.bindValueToProperty("publicacionSeleccionada.nombre")
			
		
		new LabeledCheckBox(edicionPanel)
			.setText("Habilitado:")
			.bindValueToProperty("publicacionSeleccionada.nombre")
		
		new Labeled(edicionPanel)
			.setText("Rating promedio:")
			.bindValueToProperty("publicacionSeleccionada.nombre")
		
		new Labeled(edicionPanel)
			.setText("Calificaciones:")
			.bindValueToProperty("publicacionSeleccionada.nombre")
			
			
		// botonera
		val botoneraPanel = new Panel(edicionPanel)
		botoneraPanel.layout = new VerticalLayout
			
		new Button(botoneraPanel)=>[
			caption = "Revisar Publicaciones"
			onClick [ |
				//this.modelObject.eliminarServicio
			]
		]
		val eliminarPanel = new Panel(botoneraPanel)
		new Button(eliminarPanel)=>[
			caption = "Eliminar"
			width = 100
			onClick [ |
				this.modelObject.eliminarServicio
			]
		]
			
	}
		
	def crearListadoDeServicios(Panel owner) {
		val panelDeListadoDeServicios = new Panel(owner)
		
		val tablaDeServicios = new Table<Publicacion>(panelDeListadoDeServicios, Publicacion) => [
			bindItemsToProperty("admin.servicios")
			bindValueToProperty("publicacionSeleccionada")
		]
		
		new Column(tablaDeServicios) =>[
			title = "Fecha de Registro"
			bindContentsToProperty("fechaDeRegistro").transformer = [ Date fecha | new SimpleDateFormat("dd/MM/YYYY").format(fecha)] 
		]
		
		new Column(tablaDeServicios)=>[
			title = "Nombre"
			bindContentsToProperty("nombre")
			
		]
		
		new Column(tablaDeServicios) =>[
			title = "Habilitado"
			bindContentsToProperty("estaHabilitado").transformer = [ Boolean estaHabilitado | if (estaHabilitado) "SI" else "NO" ]
		]
		
		val botoneraPanel = new Panel(panelDeListadoDeServicios)
		botoneraPanel.layout = new HorizontalLayout
			
		new Button(botoneraPanel)=>[
			caption = "Nuevo"
			width = 100
			onClick [ |
				this.modelObject.nuevoServicio
			]
		] 
	}	
	
}