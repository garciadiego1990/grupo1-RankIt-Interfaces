package ar.edu.unq.uis.rankIt.view

import org.uqbar.arena.windows.SimpleWindow
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
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.layout.VerticalLayout
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.uis.rankIt.view.components.Titulo
import org.uqbar.arena.widgets.CheckBox
import java.awt.Color
import ar.edu.unq.uis.rankIt.appModel.AdministradorUsuariosAppModel


class AdministradorUsuariosWindow extends SimpleWindow<AdministradorUsuariosAppModel> {
	
	new(WindowOwner owner, AdministradorUsuariosAppModel model) {
		super(owner, model)
		this.title = "RankIt -> Admin. Usuarios"
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
	 * @author Abel Espínola
	 */
	override protected createMainTemplate(Panel mainPanel) {
		this.createFormPanel(mainPanel)
	}
	
	
	/**
	 * En este método se define el contenido principal de la ventana para administrar {@link Usuario}s
	 * en RankIt.
	 * 
	 * @param mainPanel - {@link Panel} principal de la ventana
	 * @author Abel Espínola
	 */
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new VerticalLayout
		
		this.panelResumenUsuarios(mainPanel)
		
		new Titulo(mainPanel, "Usuarios")
		
		this.crearPanelDeBusqueda(mainPanel)
		this.crearPanelAdministracionUsuarios(mainPanel)
	}
	

	
	/**
	 * {@link Panel} horizontal que mostrará datos estadisticos de todos los {@link Usuario}s
	 *  de la aplicación.
	 * 
	 * @param mainPanel - {@link Panel} principal de la ventana.
	 * @author Abel Espínola
	 */
	def panelResumenUsuarios(Panel mainPanel) {
		
		val panelResumenEstadisticas = new GroupPanel(mainPanel) => [
			it.title = "Resumen"
			it.layout = new HorizontalLayout
		]

		new Label(panelResumenEstadisticas).text = "Usuarios Registrados: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.BLUE
			it.value <=> "cantidadUsuariosRegistrados"
//			it.width = 160
		]
		
		new Label(panelResumenEstadisticas).text = "Activos: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.BLUE
			it.value <=> "cantidadUsuariosActivos"
//			it.width = 120
		]
		
		new Label(panelResumenEstadisticas).text = "Inactivos: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.RED
			it.value <=> "cantidadUsuariosInactivos"
//			it.width = 120
		]
		
		new Label(panelResumenEstadisticas).text = "Baneados: "
		new Label(panelResumenEstadisticas) => [
			it.foreground = Color.RED
			it.value <=> "cantidadUsuariosBaneados"
//			it.width = 120
		]
		
	}
	
	
	/**
	 * {@link Panel} que mostrará los elementos de búsqueda de la aplicación.
	 * 
	 * @param ownerPanel - {@link Panel} principal de la ventana.
	 * @author Abel Espínola
	 */
	def crearPanelDeBusqueda(Panel ownerPanel) {
		val panelBusqueda = new Panel(ownerPanel)
		
		panelBusqueda.layout = new HorizontalLayout
		
		new Label(panelBusqueda) => [
			it.text = "Buscar por nombre de usuario: "
		]
		
		new TextBox(panelBusqueda) => [
			it.value <=> "nombreDeUsuarioBuscado"
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
	 * @author Abel Espínola
	 */
	def crearPanelAdministracionUsuarios(Panel ownerPanel) {
		val panelAdministracion = new Panel(ownerPanel)
		panelAdministracion.layout = new HorizontalLayout
		
		this.crearPanelGrilla(panelAdministracion)
		
		this.crearPanelEdicion(panelAdministracion)
	}
	
	/**
	 * {@link Panel} que mostrará la grilla donde se mostrará los {@link Usuario}s de la aplicación.
	 * 
	 * @param ownerPanel - {@link Panel} de administración.
	 * @author Abel Espínola
	 */
	def crearPanelGrilla(Panel ownerPanel) {
		val panelAdministracionGrilla = new Panel(ownerPanel)
		
		val tablaUsuarios = new Table(panelAdministracionGrilla, Usuario) => [
			it.items <=> "usuariosRegistrados"
			it.value <=> "usuarioSeleccionado"
			it.numberVisibleRows = 12
			it.width = 400
		]
		
		new Column(tablaUsuarios) => [
			it.title = "Fecha de registro"
			it.bindContentsToProperty("fechaDeRegistro")
//			it.weight = 115
			it.fixedSize = 120
		]

		new Column(tablaUsuarios) => [
			it.title = "Nombre"
			it.bindContentsToProperty("nombre")
//			it.weight = 90
			it.fixedSize = 100
		]
		
		new Column(tablaUsuarios) => [
			it.title = "Activo"
			it.bindContentsToProperty("estaActivo")
//			it.weight = 60
			it.fixedSize = 60
		]
		
		new Column(tablaUsuarios) => [
			it.title = "Baneado"
			it.bindContentsToProperty("estaBaneado")
//			it.weight = 60
			it.fixedSize = 60
		]
		
		new Button(panelAdministracionGrilla) => [
			it.caption = "Nuevo"
			it.onClick [| modelObject.crearNuevoUsuario()]
		]
	}
	
	
	/**
	 * {@link Panel} que mostrará los elementos para editar {@link Usuario}s de la aplicación.
	 * 
	 * @param ownerPanel - {@link Panel} de administración.
	 * @author Abel Espínola
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
				value <=> "nombreDeUsuarioSeleccionado"
				fontSize = 14
			]
				
		]
		
		new ErrorsPanel(panelAdministracionEdicion, "Edita la informacion")
		
		new Label(panelAdministracionEdicion) => [
			it.text = "Fecha de Registro:"
		]
		
		new TextBox(panelAdministracionEdicion) => [
			it.value <=> "fechaDeRegistroUsuarioSeleccionado"
			it.width = 200
		]
		
		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout
		
			new CheckBox(it) => [
				it.height = 16
			]
			
			new Label(it).text = "Activo"
		]
		
		new Panel(panelAdministracionEdicion) => [
			it.layout = new HorizontalLayout
			new CheckBox(it) => [
				it.height = 16
			]
			
			new Label(it).text = "Baneado"
		]
		
		new Label(panelAdministracionEdicion) => [
			it.text = "Última publicación:"
		]
		
		new Label(panelAdministracionEdicion) => [
			it.text = "09/07/2016 01:30"
			it.height = 30
		]
		
		new Button(panelAdministracionEdicion) => [
			it.caption = "Revisar calificaciones"
//			it.onClick [| ]
			it.width = 50//No me lo está tomando
		]

		new Button(panelAdministracionEdicion) => [
			it.caption = "Blanquear clave"
			it.onClick [| modelObject.blanquearContrasenia ]
			it.width = 50//No me lo está tomando
		]
		
		new Button(panelAdministracionEdicion) => [
			it.caption = "Eliminar"
			it.onClick [| modelObject.eliminarUsuarioSeleccionado ]
			it.width = 50//No me lo está tomando
		]
	}
	
}