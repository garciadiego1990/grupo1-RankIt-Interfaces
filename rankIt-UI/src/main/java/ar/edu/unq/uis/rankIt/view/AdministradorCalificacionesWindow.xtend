package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.uis.rankIt.view.components.DateTimeTransformer
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.layout.VerticalLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.CheckBox
import java.awt.Color
import org.joda.time.format.DateTimeFormat
import org.joda.time.DateTime
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.bindings.NotNullObservable
import ar.edu.unq.uis.rankIt.appModel.CalificacionesAppModel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.uis.rankIt.dominio.Publicacion

class AdministradorCalificacionesWindow extends SimpleWindow<CalificacionesAppModel> {

	var hayCalificacionSeleccionada = new NotNullObservable("calificacionSeleccionada")

	new(WindowOwner owner, CalificacionesAppModel model) {
		super(owner, model)
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
			it.title = "Resumen de situacion"
			it.layout = new HorizontalLayout
		]

		new Label(panelResumenEstadisticas).text = "Calificaciones registradas: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.BLUE
			it.value <=> "registradas"
		]

		new Label(panelResumenEstadisticas).text = "  Ofensivas: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.RED
			it.value <=> "ofensivas"
		]
	}

	def crearPanelDeBusqueda(Panel ownerPanel) {
		val panelBusqueda = new Panel(ownerPanel)

		panelBusqueda.layout = new HorizontalLayout

			new Label(panelBusqueda) => [
			it.text = "Usuario: "
		]

		new TextBox(panelBusqueda) => [
			it.value <=> "nombreDeUsuarioBuscado"
			it.width = 250
		]

		new Label(panelBusqueda) => [
			it.text = "Evaluado: "
		]

		new TextBox(panelBusqueda) => [
			it.value <=> "nombreDePublicacionBuscada"
			it.width = 250
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
			it.items <=> "buscador.resultados"
			it.value <=> "calificacionSeleccionada"
			it.numberVisibleRows = 12
			it.width = 400
		]

		new Column(tablaCalificaciones) => [
			it.title = "Evaluado"
		    it.bindContentsToProperty("evaluado").transformer = [ Publicacion publicacion | publicacion.nombre ]
			it.fixedSize = 100
		]
		
		new Column(tablaCalificaciones) => [
			it.title = "Ptos"
			it.bindContentsToProperty("puntaje")
			it.fixedSize = 100
		]
		
		new Column(tablaCalificaciones) => [
			it.title = "Fecha"
			it.bindContentsToProperty("fecha").transformer = [ DateTime fecha |
				DateTimeFormat.forPattern("dd/MM/yyyy kk:mm").print(fecha)
			]
			it.fixedSize = 130
		]
		
		new Column(tablaCalificaciones) => [
			it.title = "User"
			it.bindContentsToProperty("nombreUsuario")
			it.fixedSize = 100
		]

		new Column(tablaCalificaciones) => [
			it.title = "Es Ofensiva"
			it.bindContentsToProperty("esOfensiva").transformer = [ Boolean esOfensiva |
				if(esOfensiva) "Sí" else "No"
			]
			it.fixedSize = 70
		]

		new Button(panelAdministracionGrilla) => [
			it.caption = "Nuevo"
			it.bindEnabled(hayCalificacionSeleccionada)
			it.onClick [| this.modelObject.crearNuevaCalificacion()]
		]
	}

	def crearPanelEdicion(Panel administracionPanel) {
		val panelAdministracionEdicion = new Panel(administracionPanel)

		new Panel(panelAdministracionEdicion).layout = new HorizontalLayout

		new ErrorsPanel(panelAdministracionEdicion, "Edita la información")
		
		new Label(panelAdministracionEdicion).text = "Evaluado"
		new Selector<Publicacion>(panelAdministracionEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.bindItemsToProperty("publicaciones").adapter = new PropertyAdapter(typeof(Publicacion), "nombre")
			it.value <=> "calificacionSeleccionada.evaluado"
			width = 200
		]
		
		new Label(panelAdministracionEdicion).text = "Fecha:"
		new Label(panelAdministracionEdicion) => [
			it.bindVisible(this.hayCalificacionSeleccionada)
			it.bindValueToProperty("calificacionSeleccionada.fecha").transformer = new DateTimeTransformer
			it.height = 30
		]
		
		new Label(panelAdministracionEdicion).text = "Usuario:"
		new Label(panelAdministracionEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.value <=> "nombreUsuario"
			it.height = 30
		]


	    new Label(panelAdministracionEdicion).text = "Puntaje:"
		new TextBox(panelAdministracionEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.value <=> "calificacionSeleccionada.puntaje"
		]
		
		new Label(panelAdministracionEdicion).text = "Detalle:"
		new TextBox(panelAdministracionEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.value <=> "calificacionSeleccionada.detalle"
		]
		
		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout

			new CheckBox(it) => [
				it.bindEnabled(hayCalificacionSeleccionada)
				it.value <=> "calificacionOfensiva"
				it.height = 16
			]

			new Label(it).text = "Contenido Ofensivo"
		]

		new Button(panelAdministracionEdicion) => [
			it.bindEnabled(hayCalificacionSeleccionada)
			it.caption = "Eliminar"
			it.onClick[|modelObject.eliminarCalificacionSeleccionada]
			it.width = 50
		]
	}

	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
