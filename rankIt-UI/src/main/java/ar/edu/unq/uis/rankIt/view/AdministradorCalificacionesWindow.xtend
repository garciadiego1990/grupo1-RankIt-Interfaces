package ar.edu.unq.uis.rankIt.view


import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.layout.VerticalLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.CheckBox
import java.awt.Color
import ar.edu.unq.uis.rankIt.dominio.AdministradorDeCalificaciones
import org.uqbar.arena.windows.Dialog
import ar.edu.unq.uis.rankIt.appModel.CalificacionesAppModel
import ar.edu.unq.uis.rankIt.dominio.Calificacion


class AdministradorCalificacionesWindow extends Dialog<CalificacionesAppModel> {
	
	//var hayPublicacionSeleccionada = new NotNullObservable("publicacionSeleccionada")
	
	new(WindowOwner owner, AdministradorDeCalificaciones model) {
		super(owner, new CalificacionesAppModel(model))
		this.title = "RankIt -> Admin. Calificaciones"
	}

	override protected createMainTemplate(Panel mainPanel) {
		this.createFormPanel(mainPanel)
	}
	

	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		
		this.panelResumenCalificaciones(mainPanel)
		
		new Titulo(mainPanel, "Calificaciones")
		
		this.crearPanelDeBusqueda(mainPanel)
		this.crearPanelAdministracionCalificaciones(mainPanel)
	}
	

	def panelResumenCalificaciones(Panel mainPanel) {
		
		val panelResumenEstadisticas = new GroupPanel(mainPanel) => [
			it.title = "Resumen"
			it.layout = new HorizontalLayout
		]

		new Label(panelResumenEstadisticas).text = "Calificaciones registradas: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.BLUE
			it.value <=> "calificacionesRegistradas"
//			it.width = 160
		]
		
		new Label(panelResumenEstadisticas).text = "Ofensivas: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.RED
			it.value <=> "calificacionesOfensivas"
//			it.width = 120
		]
	}
	

	def crearPanelDeBusqueda(Panel ownerPanel) {
		val panelBusqueda = new Panel(ownerPanel)
		
		panelBusqueda.layout = new HorizontalLayout
		
		new Label(panelBusqueda) => [
			it.text = "Usuario: "
		]
		
		new TextBox(panelBusqueda) => [
		//	it.value <=> "nombreUsuario"
			it.width = 100
		]
		
		new Button(panelBusqueda) => [
		//	it.caption = "Buscar"
			it.width = 120
		]
	}
	
	
	def crearPanelAdministracionCalificaciones(Panel ownerPanel) {
		val panelAdministracion = new Panel(ownerPanel)
		panelAdministracion.layout = new HorizontalLayout
		
		this.crearPanelGrilla(panelAdministracion)
		
		this.crearPanelEdicion(panelAdministracion)
	}
	
	def crearPanelGrilla(Panel ownerPanel) {
		val panelAdministracionGrilla = new Panel(ownerPanel)
		
		val tablaCalificaciones = new Table(panelAdministracionGrilla, Calificacion) => [
			it.items <=> "buscador.calificacionesFiltradas"
			it.value <=> "calificacionSeleccionada"
			it.numberVisibleRows = 12
			it.width = 400
		]
		
		new Column(tablaCalificaciones) => [
			it.title = "Evaluado"
			it.bindContentsToProperty("nombrePublicacion")
//			it.weight = 115
			it.fixedSize = 120
		]

		new Column(tablaCalificaciones) => [
			it.title = "Ptos"
			it.bindContentsToProperty("puntaje")
//			it.weight = 90
			it.fixedSize = 60
		]
		
		new Column(tablaCalificaciones) => [
			it.title = "Fecha"
			it.bindContentsToProperty("fecha")
//			it.weight = 60
			it.fixedSize = 60
		]
		
		new Column(tablaCalificaciones) => [
			it.title = "User"
			it.bindContentsToProperty("nombreUsuario")
//			it.weight = 60
			it.fixedSize = 60
		]
		
		new Column(tablaCalificaciones) => [
			it.title = "Es Ofensiva"
			it.bindContentsToProperty("esOfensiva")
//			it.weight = 60
			it.fixedSize = 60
		]
		
		new Button(panelAdministracionGrilla) => [
			it.caption = "Nuevo"
			//it.onClick [| modelObject.crearNuevoUsuario()]
		]
	}
	
	


	def crearPanelEdicion(Panel administracionPanel) {
		val panelAdministracionEdicion = new Panel(administracionPanel)
		
		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout
		
		
		new ErrorsPanel(panelAdministracionEdicion, "Edita la informacion")
		
		new Label(panelAdministracionEdicion) => [
			it.text = "Evaluado:"
		]
		
		new TextBox(panelAdministracionEdicion) => [
			it.value <=> "nombrePublicacion"
			//it.width = 100
		]
		
		new Label(panelAdministracionEdicion) => [
			it.text = "Fecha:"
		]
		new Label(panelAdministracionEdicion) => [
			it.value <=> "fecha"
			//it.width = 100
		]
		
		new Label(panelAdministracionEdicion) => [
			it.text = "Usuario:"
		]
		
		new Label(panelAdministracionEdicion) => [
			it.text = "Puntaje:"
		]
		new Label(panelAdministracionEdicion) => [
			it.value <=> "puntaje"
			//it.width = 100
		]
		
		new Label(panelAdministracionEdicion) => [
			it.text = "Detalle:"
		]
		new Label(panelAdministracionEdicion) => [
			it.value <=> "detalle"
			//it.width = 100
		]
		]
		
		new TextBox(panelAdministracionEdicion) => [
		//	it.value <=> "fechaDeRegistroUsuarioSeleccionado"
			it.width = 200
		]
		
		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout
		
			new CheckBox(it) => [
				it.height = 16
			]
			
			new Label(it).text = "Contenido ofensivo"
		]
		
		new Button(panelAdministracionEdicion) => [
			it.caption = "Eliminar"
			//it.onClick [| modelObject.eliminarUsuarioSeleccionado ]
			it.width = 50//No me lo está tomando
		]
	}
	
}