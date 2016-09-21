package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.WindowOwner

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.uis.rankIt.dominio.Publicacion
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
import ar.edu.unq.uis.rankIt.appModel.LugaresAppModel
import ar.edu.unq.uis.rankIt.view.ConfirmacionDialog


class AdministradorLugaresWindow extends SimpleWindow<LugaresAppModel> {

	var hayPublicacionSeleccionada = new NotNullObservable("publicacionSeleccionada")

	new(WindowOwner owner, LugaresAppModel model) {
		super(owner, model)
		this.title = "RankIt -> Admin. Lugares"
	}

	override protected createMainTemplate(Panel mainPanel) {
		this.createFormPanel(mainPanel)
	}

	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout

		this.panelResumenLugares(mainPanel)

		new Titulo(mainPanel, "Lugares")

		this.crearPanelDeBusqueda(mainPanel)
		this.crearPanelAdministracionLugares(mainPanel)
	}

	
	def panelResumenLugares(Panel mainPanel) {

		val panelResumenEstadisticas = new GroupPanel(mainPanel) => [
			it.title = "Resumen de situacion"
			it.layout = new HorizontalLayout
		]

//		new Label(panelResumenEstadisticas).text = "Lugares inscriptos: "
//		new Label(panelResumenEstadisticas) => [
//			it.foreground = Color.BLUE
//			it.value <=> "inscriptos"
//		]
//
//		new Label(panelResumenEstadisticas).text = " Habilitados: "
//		new Label(panelResumenEstadisticas) => [
//			it.foreground = Color.BLUE
//			it.value <=> "habilitados"
//		]
//
//		new Label(panelResumenEstadisticas).text = " Deshabilitados: "
//		new Label(panelResumenEstadisticas) => [
//			it.foreground = Color.RED
//			it.value <=> "inhabilitados"
//		]
	}

	def crearPanelDeBusqueda(Panel ownerPanel) {
		val panelBusqueda = new Panel(ownerPanel)

		panelBusqueda.layout = new HorizontalLayout

//		new Label(panelBusqueda) => [
//			it.text = "Buscar por nombre de lugar: "
//		]
//
//		new TextBox(panelBusqueda) => [
//			it.value <=> "nombreDePublicacionBuscada"
//			it.width = 250
//		]

	}

	def crearPanelAdministracionLugares(Panel ownerPanel) {
		val panelAdministracion = new Panel(ownerPanel)
		panelAdministracion.layout = new HorizontalLayout

		this.crearPanelGrilla(panelAdministracion)

		this.crearPanelEdicion(panelAdministracion)
	}

	def crearPanelGrilla(Panel ownerPanel) {
		val panelAdministracionGrilla = new Panel(ownerPanel)

//		val tablaLugares = new Table(panelAdministracionGrilla, Publicacion) => [
//			it.items <=> "buscador.publicacionesFiltradas"
//			it.value <=> "publicacionSeleccionada"
//			it.numberVisibleRows = 12
//			it.width = 400
//		]
//
//		new Column(tablaLugares) => [
//			it.title = "Fecha de registro"
//			it.bindContentsToProperty("fechaDeRegistro").transformer = [ DateTime fecha |
//				DateTimeFormat.forPattern("dd/MM/yyyy kk:mm").print(fecha)
//			]
//			it.fixedSize = 130
//		]
//
//		new Column(tablaLugares) => [
//			it.title = "Nombre"
//			it.bindContentsToProperty("nombre")
//			it.fixedSize = 100
//		]
//
//		new Column(tablaLugares) => [
//			it.title = "Habilitado"
//			it.bindContentsToProperty("estaHabilitado").transformer = [ Boolean habilitado |
//				if(habilitado) "Sí" else "No"
//			]
//			it.fixedSize = 70
//		]
//
//		new Button(panelAdministracionGrilla) => [
//			it.caption = "Nuevo"
//			it.onClick [| modelObject.crearNuevaPublicacion()]
//		]
	}

	def crearPanelEdicion(Panel administracionPanel) {
<<<<<<< HEAD
//		val panelAdministracionEdicion = new Panel(administracionPanel)
//
//		new Panel(panelAdministracionEdicion) => [
//			it.layout = new HorizontalLayout
//
//			new Label(it) => [
//				text = "Nombre:    "
//				fontSize = 14
//			]
//
//			new Label(it) => [
//				value <=> "publicacionSeleccionada.nombre"
//				it.bindVisible(hayPublicacionSeleccionada)
//				fontSize = 14
//			]
//
//		]
//
//		new ErrorsPanel(panelAdministracionEdicion, "Edite la información")
//
//		new Label(panelAdministracionEdicion).text = "Nombre:"
//		new TextBox(panelAdministracionEdicion).bindValueToProperty("publicacionSeleccionada.nombre")
//
//		new Panel(panelAdministracionEdicion) => [
//			it.layout = new HorizontalLayout
//
//			new CheckBox(it) => [
//				it.value <=> "publicacionHabilitada"
//				it.bindEnabled(hayPublicacionSeleccionada)
//				it.height = 16
//			]
//
//			new Label(it).text = "Habilitado"
//		]
//
//		new Label(panelAdministracionEdicion).text = "Rating promedio:"
//		new Label(panelAdministracionEdicion) => [
//			it.value <=> "ratingPromedio"
//			it.height = 30
//		]
//
//		new Label(panelAdministracionEdicion) => [
//			it.text = "Calificaciones:"
//		]
//
//		new Label(panelAdministracionEdicion) => [
//			it.value <=> "cantidadDeCalificaciones"
//			it.height = 30
//		]
//
//		new Button(panelAdministracionEdicion) => [
//			it.caption = "Revisar calificaciones"
//			it.bindEnabled(hayPublicacionSeleccionada)
////			it.onClick [| modelObject.]
//			it.width = 50
//		]
//
//		new Button(panelAdministracionEdicion) => [
//			it.caption = "Eliminar"
//			it.bindEnabled(hayPublicacionSeleccionada)
//			it.onClick[|modelObject.eliminarPublicacionSeleccionada]
//			it.width = 50
//		]
=======
		val panelAdministracionEdicion = new Panel(administracionPanel)

		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout

			new Label(it) => [
				text = "Nombre:    "
				fontSize = 14
			]

			new Label(it) => [
				value <=> "publicacionSeleccionada.nombre"
				it.bindVisible(hayPublicacionSeleccionada)
				fontSize = 14
			]

		]

		new ErrorsPanel(panelAdministracionEdicion, "Edite la información")

		new Label(panelAdministracionEdicion).text = "Nombre:"
		new TextBox(panelAdministracionEdicion).bindValueToProperty("publicacionSeleccionada.nombre")

		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout

			new CheckBox(it) => [
				it.value <=> "publicacionHabilitada"
				it.bindEnabled(hayPublicacionSeleccionada)
				it.height = 16
			]

			new Label(it).text = "Habilitado"
		]

		new Label(panelAdministracionEdicion).text = "Rating promedio:"
		new Label(panelAdministracionEdicion) => [
			it.value <=> "ratingPromedio"
			it.height = 30
		]

		new Label(panelAdministracionEdicion) => [
			it.text = "Calificaciones:"
		]

		new Label(panelAdministracionEdicion) => [
			it.value <=> "cantidadDeCalificaciones"
			it.height = 30
		]

		new Button(panelAdministracionEdicion) => [
			it.caption = "Revisar calificaciones"
			it.bindEnabled(hayPublicacionSeleccionada)
//			it.onClick [| modelObject.]
			it.width = 50
		]

		new Button(panelAdministracionEdicion) => [
			it.caption = "Eliminar"
			it.bindEnabled(hayPublicacionSeleccionada)
			//it.onClick[|modelObject.eliminarPublicacionSeleccionada]
			it.onClick[|ConfirmacionDialog(this, this.modelObject).open]
			it.width = 50
		]
>>>>>>> 40a1c7b27effcd0e285d47c119c682d2a8fb5d19
	}

	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
