package ar.edu.unq.uis.rankIt.view.components

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Container

class Labeled extends AbstractLabeledWidget{
	Label label
	
	new(Container container) {
		super(container)
	}
	
	override createWidget(AbstractLabeledWidget widget) {
		label = new Label(this)
	}
	
	override bindValueToProperty(String property) {
		label.bindValueToProperty(property)
		this
	}
}