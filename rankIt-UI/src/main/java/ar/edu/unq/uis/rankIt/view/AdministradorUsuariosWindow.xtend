package ar.edu.unq.uis.rankIt.view


import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import ar.edu.unq.uis.rankIt.dominio.Usuario
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.ErrorsPanel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.CheckBox
import java.awt.Color
import org.joda.time.format.DateTimeFormat
import org.joda.time.DateTime
import ar.edu.unq.uis.rankIt.view.transformers.DateTimeTransformer
import ar.edu.unq.uis.rankIt.appModel.UsuariosAppModel
import org.uqbar.arena.bindings.NotNullObservable
import ar.edu.unq.uis.rankIt.appModel.AppModelsSingleton
import org.uqbar.arena.windows.MessageBox
import ar.edu.unq.uis.rankIt.view.templates.RankItAdministracionWindowTemplate

class AdministradorUsuariosWindow extends RankItAdministracionWindowTemplate<UsuariosAppModel> {
	
	val hayUsuarioSeleccionado = new NotNullObservable("usuarioSeleccionado")
	
	new(WindowOwner owner, UsuariosAppModel model, String tituloPrincipal) {
		super(owner, model, tituloPrincipal)
	}
	
	/**@author ae */
	override crearSeccionDeResumen(Panel panelDeResumen) {

		new Label(panelDeResumen).text = "Usuarios Registrados: "
		new Label(panelDeResumen) => [
			it.foreground = Color.BLUE
			it.value <=> "registrados"
		]
		
		new Label(panelDeResumen).text = " Activos: "
		new Label(panelDeResumen) => [
			it.foreground = Color.BLUE
			it.value <=> "activos"
		]
		
		new Label(panelDeResumen).text = " Inactivos: "
		new Label(panelDeResumen) => [
			it.foreground = Color.RED
			it.value <=> "inactivos"
		]
		
		new Label(panelDeResumen).text = " Baneados: "
		new Label(panelDeResumen) => [
			it.foreground = Color.RED
			it.value <=> "baneados"
		]
		
	}
	
	
	/**@author ae */
	override crearSeccionDeBusqueda(Panel panelDeBusqueda) {
		new Label(panelDeBusqueda) => [
			it.text = "Buscar por nombre de usuario: "
		]
		
		new TextBox(panelDeBusqueda) => [
			it.value <=> "nombreABuscar"
			it.width = 250
		]
	}
	
	/** @author ae*/
	override crearSeccionDeGrilla(Panel panelGrilla) {
		val tablaUsuarios = new Table(panelGrilla, Usuario) => [
			it.items <=> "buscador.resultados"
			it.value <=> "usuarioSeleccionado"
			it.numberVisibleRows = 12
			it.width = 400
		]
		
		new Column(tablaUsuarios) => [
			it.title = "Fecha de registro"
			it.bindContentsToProperty("fechaDeRegistro").transformer = 
			 [ DateTime fecha | 
			 	DateTimeFormat.forPattern("dd/MM/yyyy kk:mm").print(fecha)
			 ]
			it.fixedSize = 140
		]

		new Column(tablaUsuarios) => [
			it.title = "Nombre"
			it.bindContentsToProperty("nombre")
			it.fixedSize = 110
		]
		
		new Column(tablaUsuarios) => [
			it.title = "Activo"
			it.bindContentsToProperty("estaActivo").transformer = 
			 [ Boolean activo | 
			 	if (activo) "Sí" else "No"
			 ]
			it.fixedSize = 75
		]
		
		new Column(tablaUsuarios) => [
			it.title = "Baneado"
			it.bindContentsToProperty("estaBaneado").transformer = 
			 [ Boolean baneado | 
			 	if (baneado) "Sí" else "-"
			 ]
			it.fixedSize = 70
		]
		
		new Button(panelGrilla) => [
			it.caption = "Nuevo"
			it.onClick [| modelObject.crearNuevoUsuario()]
		]
	}
	
	/**@author ae */
	override crearSeccionDeEdicion(Panel panelEdicion) {
		
		new Panel(panelEdicion) => [
			it.layout = new HorizontalLayout
			
			new Label(it) => [
				text = "Nombre:    "
				fontSize = 14
			]
			
			new Label(it) => [
				value <=> "usuarioSeleccionado.nombre"
				it.bindVisible(hayUsuarioSeleccionado)
				fontSize = 14
			]
				
		]
		
		new ErrorsPanel(panelEdicion, "Edite la información")
		
		new Label(panelEdicion) => [
			it.text = "Fecha de Registro:"
		]
		
		new TextBox(panelEdicion) => [
			it.bindValueToProperty("usuarioSeleccionado.fechaDeRegistro").transformer = new DateTimeTransformer
			it.bindVisible(hayUsuarioSeleccionado)
			it.width = 200
		]
		
		new Panel(panelEdicion) => [
			it.layout = new HorizontalLayout
		
			new CheckBox(it) => [
				it.value <=> "usuarioSeleccionadoActivo"
				it.bindEnabled(hayUsuarioSeleccionado)
				it.height = 16
			]
			
			new Label(it).text = "Activo"
		]
		
		new Panel(panelEdicion) => [
			it.layout = new HorizontalLayout
			new CheckBox(it) => [
				it.value <=> "usuarioSeleccionadoBaneado"
				it.bindEnabled(hayUsuarioSeleccionado)
				it.height = 16
			]
			
			new Label(it).text = "Baneado"
		]
		
		new Label(panelEdicion).text = "Última calificación:"
		new Label(panelEdicion) => [
			it.bindValueToProperty("fechaDeCalificacionMasReciente")
			it.bindEnabled(hayUsuarioSeleccionado)
			it.height = 30
		]
		
		new Button(panelEdicion) => [
			it.caption = "Revisar calificaciones"
			it.bindEnabled(hayUsuarioSeleccionado)
			it.onClick [|
				this.close
				new AdministradorCalificacionesWindow(this.owner, AppModelsSingleton.instance.appModelCalificaciones) => [
					it.modelObject.nombreDeUsuarioBuscado = this.modelObject.usuarioSeleccionado.nombre
					it.open
				]
			]
		]

		new Button(panelEdicion) => [
			it.caption = "Blanquear clave"
			it.bindEnabled(hayUsuarioSeleccionado)
			it.onClick [|
				this.modelObject.blanquearContrasenia
				this.showMessageBox(MessageBox.Type.Information, "Se ha actualizado la contraseña\nexitosamente.")
			]
		]
		
		new Button(panelEdicion) => [
			it.caption = "Eliminar"
			it.bindEnabled(hayUsuarioSeleccionado)
			it.onClick [| 
				new ConfirmacionDialog(this, this.modelObject, "¿Desea eliminar el usuario seleccionado?") => [
					it.onAccept[| this.modelObject.eliminarUsuarioSeleccionado ]
					it.onCancel[| ]
					it.open
				]
			]
		]
	}
	
}