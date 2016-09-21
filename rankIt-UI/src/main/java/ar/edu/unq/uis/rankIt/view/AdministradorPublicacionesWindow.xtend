package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.uis.rankIt.appModel.PublicacionAppModel
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import java.awt.Color
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.joda.time.format.DateTimeFormat
import org.joda.time.DateTime
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.bindings.NotNullObservable
import ar.edu.unq.uis.rankIt.appModel.AppModelsSingleton

class AdministradorPublicacionesWindow extends RankItAdministracionWindowTemplate<PublicacionAppModel> {
	
	var hayPublicacionSeleccionada = new NotNullObservable("publicacionSeleccionada")
	
	new(WindowOwner owner, PublicacionAppModel model, String tituloPrincipal) {
		super(owner, model, tituloPrincipal)
	}
	
	override crearSeccionDeResumen(Panel panelDeResumen) {
		new Label(panelDeResumen).text = this.tituloPrincipal+" inscriptos: "
		new Label(panelDeResumen) => [
			it.foreground = Color.BLUE
			it.value <=> "inscriptos"
		]

		new Label(panelDeResumen).text = " Habilitados: "
		new Label(panelDeResumen) => [
			it.foreground = Color.BLUE
			it.value <=> "habilitados"
		]

		new Label(panelDeResumen).text = " Deshabilitados: "
		new Label(panelDeResumen) => [
			it.foreground = Color.RED
			it.value <=> "inhabilitados"
		]
	}
	
	override crearSeccionDeBusqueda(Panel panelDeBusqueda) {
		new Label(panelDeBusqueda) => [
			it.text = "Buscar por nombre de "+this.tituloPrincipal.toLowerCase+" : "
		]

		new TextBox(panelDeBusqueda) => [
			it.value <=> "nombreDePublicacionBuscada"
			it.width = 250
		]
	}
	
	override crearSeccionDeGrilla(Panel panelGrilla) {
		val tablaPublicaciones = new Table(panelGrilla, typeof(Publicacion)) => [
			it.items <=> "buscador.publicacionesFiltradas"
			it.value <=> "publicacionSeleccionada"
			it.numberVisibleRows = 12
			it.width = 400
		]

		new Column(tablaPublicaciones) => [
			it.title = "Fecha de registro"
			it.bindContentsToProperty("fechaDeRegistro").transformer = [ DateTime fecha |
				DateTimeFormat.forPattern("dd/MM/yyyy kk:mm").print(fecha)
			]
			it.fixedSize = 130
		]

		new Column(tablaPublicaciones) => [
			it.title = "Nombre"
			it.bindContentsToProperty("nombre")
			it.fixedSize = 100
		]

		new Column(tablaPublicaciones) => [
			it.title = "Habilitado"
			it.bindContentsToProperty("estaHabilitado").transformer = [ Boolean habilitado |
				if(habilitado) "Sí" else "No"
			]
			it.fixedSize = 70
		]

		new Button(panelGrilla) => [
			it.caption = "Nuevo"
			it.onClick [| modelObject.crearNuevaPublicacion()]
		]
	}
	
	override crearSeccionDeEdicion(Panel panelEdicion) {
		new Panel(panelEdicion) => [
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

		new ErrorsPanel(panelEdicion, "Edite la información")

		new Label(panelEdicion).text = "Nombre:"
		new TextBox(panelEdicion).bindValueToProperty("publicacionSeleccionada.nombre")

		new Panel(panelEdicion) => [
			it.layout = new HorizontalLayout

			new CheckBox(it) => [
				it.value <=> "publicacionHabilitada"
				it.bindEnabled(hayPublicacionSeleccionada)
				it.height = 16
			]

			new Label(it).text = "Habilitado"
		]

		new Label(panelEdicion).text = "Rating promedio:"
		new Label(panelEdicion) => [
			it.value <=> "ratingPromedio"
			it.height = 30
		]

		new Label(panelEdicion) => [
			it.text = "Calificaciones:"
		]

		new Label(panelEdicion) => [
			it.value <=> "cantidadDeCalificaciones"
			it.height = 30
		]

		new Button(panelEdicion) => [
			it.caption = "Revisar calificaciones"
			it.bindEnabled(hayPublicacionSeleccionada)
				new AdministradorCalificacionesWindow(this.owner, AppModelsSingleton.instance.appModelCalificaciones) => [
					it.modelObject.nombreDeUsuarioBuscado = this.modelObject.publicacionSeleccionada.nombre
					it.open
				]
			it.width = 50
		]

		new Button(panelEdicion) => [
			it.caption = "Eliminar"
			it.bindEnabled(hayPublicacionSeleccionada)
			it.onClick[|modelObject.eliminarPublicacionSeleccionada]
			it.width = 50
		]
	}

}