package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
//import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.layout.VerticalLayout

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.CheckBox
import ar.edu.unq.uis.appModel.AdministrarLugaresRankItAppModel

class AdministrarLugaresWindow extends SimpleWindow<AdministrarLugaresRankItAppModel> {
	new(WindowOwner owner, AdministrarLugaresRankItAppModel model) {
		super(owner, model)
		this.title = "Rank-IT -> Adm Lugares"
	}

	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	/**
	 * Este método redefine el template para la ventana {@link AdministrarUsuariosWindow}.
	 * En caso de existir la definición del método {@link #createContents(Panel)}
	 * se ejecutará en lugar de este
	 * 
	 * @param mainPanel - {@link Panel} principal de la ventana
	 */
	override protected createMainTemplate(Panel mainPanel) {
		this.createFormPanel(mainPanel)
	}

	/**
	 * En este método se define el contenido principal de la ventana para administrar {@link Usuario}s
	 * en RankIt.
	 * 
	 * @param mainPanel - {@link Panel} principal de la ventana
	 */
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout

		panelResumenLugares(mainPanel)

		new Titulo(mainPanel, "Lugares")

		this.crearPanelDeBusqueda(mainPanel)
		this.crearPanelAdministracionLugares(mainPanel)
	}

	/**
	 * {@link Panel} horizontal que mostrará datos estadisticos de todos los {@link Usuario}s
	 *  de la aplicación.
	 * 
	 * @param mainPanel - {@link Panel} principal de la ventana.
	 */
	def panelResumenLugares(Panel mainPanel) {

		val panelResumenEstadisticas = new GroupPanel(mainPanel) => [
			it.title = "Resumen de situación:"
			it.layout = new HorizontalLayout
		]

		new Label(panelResumenEstadisticas) => [
			it.text = "Lugares inscriptos:"
			it.width = 150
			
		]
		
		new Label(panelResumenEstadisticas) => [
			it.value<=>"lugaresTotales"
			
		]

		new Label(panelResumenEstadisticas) => [
			it.text = "Habilitados:"
			it.width = 120
		]

		new Label(panelResumenEstadisticas) => [
			it.value<=>"lugaresHabilitados"
		] 
		new Label(panelResumenEstadisticas) => [
			it.text = "Deshabilitados:"
			it.width = 120
		]
		new Label(panelResumenEstadisticas) => [
			it.value<=>"lugaresDeshabilitados"
			
		] 
	}

	/**
	 * {@link Panel} que mostrará los elementos de búsqueda de la aplicación.
	 * 
	 * @param ownerPanel - {@link Panel} principal de la ventana.
	 */
	def crearPanelDeBusqueda(Panel ownerPanel) {
		val panelBusqueda = new Panel(ownerPanel)

		panelBusqueda.layout = new HorizontalLayout

		new Label(panelBusqueda) => [
			it.text = "Buscar por nombre de servicio: "
		]

		new TextBox(panelBusqueda) => [
			it.value <=> "nombreDeLugarBuscado"
			it.width = 250
		]

		new Button(panelBusqueda) => [
			it.caption = "Buscar"
			it.width = 120
		]
	}

	/**
	 * {@link Panel} que contendrá toda la funcionalidad para administrar {@link Usuario}s.
	 * 
	 * @param ownerPanel - {@link Panel} principal de la ventana
	 */
	def crearPanelAdministracionLugares(Panel ownerPanel) {
		val panelAdministracion = new Panel(ownerPanel)
		panelAdministracion.layout = new HorizontalLayout

		this.crearPanelGrilla(panelAdministracion)

		this.crearPanelEdicion(panelAdministracion)
	}

	/**
	 * {@link Panel} que mostrará la grilla donde se mostrará los {@link Usuario}s de la aplicación.
	 * 
	 * @param ownerPanel - {@link Panel} de administración.
	 */
	def crearPanelGrilla(Panel ownerPanel) {
		val panelAdministracionGrilla = new Panel(ownerPanel)

		val tablaLugares = new Table(panelAdministracionGrilla, Publicacion) => [
			it.numberVisibleRows = 12
			it.width = 400
		]

		new Column(tablaLugares) => [
			it.title = "Fecha de registro"
//			it.weight = 115
			it.fixedSize = 140
		]

		new Column(tablaLugares) => [
			it.title = "Nombre"
//			it.weight = 90
			it.fixedSize = 150
		]

		new Column(tablaLugares) => [
			it.title = "Habilitado"
//			it.weight = 60
			it.fixedSize = 90
//			bindContentsToProperty("estaHabilitado").transformer = [ Boolean estaAprobada |  
//			if (estaAprobada) "Si" else "No"
//			]
		]

		new Button(panelAdministracionGrilla) => [
			it.caption = "Nuevo"
		]
	}

	/**
	 * {@link Panel} que mostrará los elementos para editar {@link Usuario}s de la aplicación.
	 * 
	 * @param ownerPanel - {@link Panel} de administración.
	 */
	def crearPanelEdicion(Panel administracionPanel) {
		val panelAdministracionEdicion = new Panel(administracionPanel)

		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout

			new Label(it) => [
				text = "Nombre:    "
				fontSize = 14
			]

			new Label(it) => [
				value <=>"lugarSeleccionado.nombre"
				fontSize = 14
			]

		]

		new ErrorsPanel(panelAdministracionEdicion, "Edita la informacion")

		new Label(panelAdministracionEdicion) => [
			it.text = "Nombre:"
		]

		new TextBox(panelAdministracionEdicion) => [
			it.width = 200
		]

		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout

			new CheckBox(it) => [
				it.height = 16
			]

			new Label(it).text = "Habilitado"
		]

		new Label(panelAdministracionEdicion) => [
			it.text = "Rating Promedio:"
		]
		new Label(panelAdministracionEdicion) => [
			value<=>"ratingPromedio"
		]

		new Label(panelAdministracionEdicion) => [
			it.text = "Calificaciones:"
		]
		new Label(panelAdministracionEdicion) => [
			value<=>"cantidadDeEvaluaciones"
		]

		new Button(panelAdministracionEdicion) => [
			it.caption = "Revisar calificaciones"
			it.width = 50 // No me lo está tomando
		]

		new Button(panelAdministracionEdicion) => [
			it.caption = "Eliminar"
			it.onClick [| modelObject.eliminarLugarSeleccionado ]
			it.width = 50 // No me lo está tomando
		]
	}
}
