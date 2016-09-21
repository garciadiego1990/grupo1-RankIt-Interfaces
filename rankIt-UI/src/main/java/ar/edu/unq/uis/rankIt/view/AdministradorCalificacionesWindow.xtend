package ar.edu.unq.uis.rankIt.view

import ar.edu.unq.uis.rankIt.appModel.CalificacionesAppModel
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.view.components.DateTimeTransformer
import java.awt.Color
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormat
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.ui.view.ErrorViewer


class AdministradorCalificacionesWindow extends RankItAdministracionWindowTemplate<CalificacionesAppModel> implements ErrorViewer {

	var hayCalificacionSeleccionada = new NotNullObservable("calificacionSeleccionada")

	new(WindowOwner owner, CalificacionesAppModel model) {
		super(owner, model, "Calificaciones")
	}


	override crearSeccionDeResumen(Panel panelDeResumen) {
		new Label(panelDeResumen).text = "Calificaciones registradas: "
		new Label(panelDeResumen) => [
			it.foreground = Color.BLUE
			it.value <=> "registradas"
		]

		new Label(panelDeResumen).text = "  Ofensivas: "
		new Label(panelDeResumen) => [
			it.foreground = Color.RED
			it.value <=> "ofensivas"
		]
	}
	
	
	override crearSeccionDeBusqueda(Panel panelDeBusqueda) {
		new Label(panelDeBusqueda) => [
			it.text = "Usuario: "
		]

		new TextBox(panelDeBusqueda) => [
			it.value <=> "nombreDeUsuarioBuscado"
			it.width = 250
		]

		new Label(panelDeBusqueda) => [
			it.text = "Evaluado: "
		]

		new TextBox(panelDeBusqueda) => [
			it.value <=> "nombreDePublicacionBuscada"
			it.width = 250
		]
	}
	
	
	override crearSeccionDeGrilla(Panel panelGrilla) {
		val tablaCalificaciones = new Table(panelGrilla, Calificacion) => [
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

		new Button(panelGrilla) => [
			it.caption = "Nuevo"
			it.onClick [| this.modelObject.crearNuevaCalificacion()]
		]
			
	}
	
	
	override crearSeccionDeEdicion(Panel panelEdicion) {
		new ErrorsPanel(panelEdicion, "Edita la información")
		
		new Label(panelEdicion).text = "Evaluado"
		new Selector<Publicacion>(panelEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.bindItemsToProperty("publicaciones").adapter = new PropertyAdapter(typeof(Publicacion), "nombre")
			it.value <=> "calificacionSeleccionada.evaluado"
			width = 200
		]
		
		new Label(panelEdicion).text = "Fecha:"
		new Label(panelEdicion) => [
			it.bindVisible(this.hayCalificacionSeleccionada)
			it.bindValueToProperty("calificacionSeleccionada.fecha").transformer = new DateTimeTransformer
			it.height = 30
		]
		
		new Label(panelEdicion).text = "Usuario:"
		new Label(panelEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.value <=> "nombreUsuario"
			it.height = 30
		]


	    new Label(panelEdicion).text = "Puntaje:"
		new TextBox(panelEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.value <=> "calificacionSeleccionada.puntaje"
		]
		
		new Label(panelEdicion).text = "Detalle:"
		new TextBox(panelEdicion) => [
			it.bindEnabled(this.hayCalificacionSeleccionada)
			it.value <=> "calificacionSeleccionada.detalle"
		]
		
		new Panel(panelEdicion) => [
			it.layout = new HorizontalLayout

			new CheckBox(it) => [
				it.bindEnabled(hayCalificacionSeleccionada)
				it.value <=> "calificacionOfensiva"
				it.height = 16
			]

			new Label(it).text = "Contenido Ofensivo"
		]

		new Button(panelEdicion) => [
			it.bindEnabled(hayCalificacionSeleccionada)
			it.caption = "Eliminar"
			it.onClick [| 
				new ConfirmacionDialog(this, this.modelObject, "¿Desea eliminar la calificación seleccionada?") => [
					it.onAccept[| this.modelObject.eliminarCalificacionSeleccionada ]
					it.onCancel[| ]
					it.open
				]
			]
			it.width = 50
		]
	}
	
}
