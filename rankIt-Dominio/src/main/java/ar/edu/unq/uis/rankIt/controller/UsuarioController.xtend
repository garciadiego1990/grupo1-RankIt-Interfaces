package ar.edu.unq.uis.rankIt.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.uis.rankIt.appModel.UsuariosAppModel
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.uis.rankIt.appModel.ServiciosAppModel
import ar.edu.unq.uis.rankIt.appModel.LugaresAppModel
import org.uqbar.xtrest.api.annotation.Delete
import java.util.List
import java.util.ArrayList
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.appModel.CalificacionesAppModel

@Controller
class UsuarioController {
	extension JSONUtils = new JSONUtils
	UsuariosAppModel usuarioAppModel
	ServiciosAppModel serviciosAppModel
	LugaresAppModel lugaresAppModel
	
	new(UsuariosAppModel usuarioAppModel, ServiciosAppModel serviciosAppModel, LugaresAppModel lugaresAppModel) {
		this.usuarioAppModel = usuarioAppModel
		this.lugaresAppModel = lugaresAppModel
		this.serviciosAppModel = serviciosAppModel
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////
	
	@Put("/usuarios/:nombre")
    def crearUsuario() {
        response.contentType = "application/json"         	
            if (this.usuarioAppModel.existeUsuario(String.valueOf(nombre))) {
            	badRequest('{ "error": "Nombre de usuario inválido" }')
            } else {
            	this.usuarioAppModel.crearUsuario(String.valueOf(nombre))
            	ok()
            }
        }
     
    ///////////////////////////////////////////////////////////////////    
    @Get("/evaluados")
    def getEvaluados() {
        response.contentType = "application/json"
        // reemp por el metodo conveniente        	  
       	ok(this.todosLosEvaluadosDisponibles.toJson)      
    }
    
    def List<Publicacion> todosLosEvaluadosDisponibles() {
    	var ArrayList<Publicacion> list = new ArrayList<Publicacion>
    	list.add(new Publicacion("Speedy"))
    	list.add(new Publicacion("Coto"))
    	return list
    }
    ////////////////////////////////////////////////////////////////////
    
    
    @Delete("/calificaciones/:id")
    def deleteCalificacionById() {
    	response.contentType = "application/json"
        try {
            //this.calificacionesAppModel.eliminarCalificacion(Integer.valueOf(id))
            ok()
        	}
        catch (NumberFormatException ex) {
        	badRequest('{ "error": "El id debe ser un numero entero" }')
        }
    }
    
    
    
    
     
        	
}