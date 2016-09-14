package ar.edu.unq.uis.rankIt.view.components

import org.joda.time.DateTime
import org.uqbar.arena.bindings.ValueTransformer
import org.joda.time.format.DateTimeFormat

class DateTimeTransformer implements ValueTransformer<DateTime, String> {
	
	var DateTime fechaModelo
	
	override getModelType() {
		DateTime
	}
	
	override getViewType() {
		String
	}
	
	override modelToView(DateTime fecha) {
		fechaModelo = fecha
		DateTimeFormat.forPattern("dd/MM/yyyy kk:mm").print(fecha)
	}
	
	override viewToModel(String valueFromView) {
		this.fechaModelo
	}
	
}