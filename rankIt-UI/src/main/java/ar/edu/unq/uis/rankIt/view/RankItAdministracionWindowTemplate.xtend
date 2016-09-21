package ar.edu.unq.uis.rankIt.view


import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.windows.Window
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.GroupPanel
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.layout.VerticalLayout
import ar.edu.unq.uis.rankIt.appModel.PublicacionAppModel

/**
 * Template para todas las ventanas de la aplicación RankIt. Todas las ventanas de administración implementarán este template para
 * obtener el layout y distribución de paneles adecuados.
 * 
 * @author ae
 */
@Accessors
public abstract class RankItAdministracionWindowTemplate<T> extends Window<T> {
	
	var String tituloPrincipal
	
	new(WindowOwner owner, T model, String tituloPrincipal) {
		super(owner, model)
		this.tituloPrincipal = tituloPrincipal
	}
		
	override setTitle(String titulo) {
		super.title = "RankIt -> Admin. "+titulo
	}	
	
	override final void createContents(Panel mainPanel) {
		this.crearTemplate(mainPanel)
	}
	
	/**
	 * Se crean y definen todos los paneles que formaran parte de mi ventana. Este método es privado y final, por lo que no debe ser reimplementado
	 * por subclases de {@link RankItAdministracionWindowTemplate}.
	 * 
	 * @author ae
	 */
	def private final void crearTemplate(Panel mainPanel) {

		mainPanel.layout = new VerticalLayout
		
		val panelDeResumen = new GroupPanel(mainPanel) => [
			it.title = "Resumen"
			it.layout = new HorizontalLayout
		] 
		
		this.crearSeccionDeResumen(panelDeResumen)
		
		new Label(mainPanel) => [
			it.text = this.tituloPrincipal
			it.fontSize = 20
		]
		
		val panelDeBusqueda = new Panel(mainPanel).layout = new HorizontalLayout
		this.crearSeccionDeBusqueda(panelDeBusqueda)
		
		val panelDeGrillaYEdicion = new Panel(mainPanel).layout = new HorizontalLayout
		this.crearGrillaYEdicion(panelDeGrillaYEdicion)
	}
	
	/** 
	 * Se crean y definen todos los paneles que formaran parte de mi ventana. Este método es privado y final, por lo que no debe ser reimplementado
	 * por subclases de {@link RankItAdministracionWindowTemplate}
	 * 
	 * @param panelDeGrillaYEdicion - Panel de distribución horizontal
	 * @author ae
	 */
	def private final crearGrillaYEdicion(Panel panelDeGrillaYEdicion) {
		val panelGrilla = new Panel(panelDeGrillaYEdicion).layout = new VerticalLayout
		val panelEdicion = new Panel(panelDeGrillaYEdicion).layout = new VerticalLayout
		
		this.crearSeccionDeGrilla(panelGrilla)
		this.crearSeccionDeEdicion(panelEdicion)
	}
	
	
	/** 
	 * Se asigna el título principal a la ventana.
	 * 
	 * @param titulo - Título principal.
	 * @author ae */
	def void setTituloPrincipal(String titulo) {
		this.setTitle(titulo)
		this.tituloPrincipal = titulo	
	}
	
	/*Los siguientes métodos son los únicos que deben ser implementados por las subclases de 
	 * RankItAdministracionWindowTemplate.
	 * En estos métodos se separan las distintas partes que son comunes a todas las ventanas de la aplicacion.*/
	
	
	/**
	 * En este método se debe implementar y crear todos los componentes que forman parte de la sección que contendrá datos de resumen.
	 * Estará compuesto por distintas etiquetas (labels) encargadas de mostrar algún dato estadístico relevante para la ventana implementada.
	 * 
	 * @param panelResumen - Panel con layout horizontal.
	 * @author ae
	 */
	def abstract void crearSeccionDeResumen(Panel panelDeResumen);
	
	/**
	 * En este método se debe implementar y crear todos los componentes que forman parte de la sección de búsqueda.
	 * Por cada campo de búsqueda de esta sección debera estar compuesto de:
	 *  - una etiqueta (label) que indicará lo que se buscará y;
	 *  - un campo para ingresar texto (textbox) a través del cual se ingresarán los parametros de búsqueda.
	 * 
	 * @param panelBusqueda - Panel con layout horizontal.
	 * @author ae
	 */
	def abstract void crearSeccionDeBusqueda(Panel panelDeBusqueda);
	
	/**
	 * En este método se debe implementar y crear todos los componentes que forman parte de la sección donde estará ubicada la grilla de elementos.
	 * Estara compuesto por una grilla (table) y un botón que me permitirá ingresar nuevos elementos a dicha grilla.
	 * 
	 * @param panelGrilla - Panel con layout vertical.
	 * @author ae
	 */
	def abstract void crearSeccionDeGrilla(Panel panelGrilla);

	/**
	 * En este método se debe implementar y crear todos los componentes que forman parte de la sección de edición.
	 * El contenido de este panel variara dependiendo de la ventana especifica que se quiera implementar. En general contendrá algunos
	 * botones, labels, checkboxes y textboxes.
	 * 
	 * @param panelEdicion - Panel con layout vertical.
	 * @author ae
	 */
	def abstract void crearSeccionDeEdicion(Panel panelEdicion);
}