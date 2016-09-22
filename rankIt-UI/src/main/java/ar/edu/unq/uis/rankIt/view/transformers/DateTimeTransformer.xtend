package ar.edu.unq.uis.rankIt.view.transformers

import org.joda.time.DateTime
import org.uqbar.arena.bindings.ValueTransformer
import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter

/**
 * Se encarga de adaptar fechas del tipo {@link DateTime} a {@link String} y viceversa
 * para poder ser mostradas y modificadas en una vista como si fuese una cadena de texto.
 * El formato de las fechas transformadas con esta clase tendrá el formato dd/MM/yyyy kk:mm,
 * con horario en formato de 24 horas. Las fechas ingresadas solo serán aceptadas si repetan
 * dicho formato.
 * 
 * @author ae
 */
class DateTimeTransformer implements ValueTransformer<DateTime, String> {
	
	//Formato en el que las fechas serán mostradas en pantalla.
	var DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy kk:mm");
	
	override getModelType() {
		DateTime
	}
	
	override getViewType() {
		String
	}
	
	override modelToView(DateTime fecha) {
		DateTimeFormat.forPattern("dd/MM/yyyy kk:mm").print(fecha)
	}
	
	override viewToModel(String valueFromView) {
		try {
			formatter.parseDateTime(valueFromView)
		}
		catch(IllegalArgumentException e){
			throw new IllegalArgumentException("Fecha incorrecta")
		}
	}
	
}
