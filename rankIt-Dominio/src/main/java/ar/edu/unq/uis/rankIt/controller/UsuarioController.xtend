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
import org.uqbar.xtrest.api.annotation.Post
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.eclipse.xtend.lib.annotations.Accessors

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
	
	@Put("/usuarios/:nombre/:contrasenia")
    def registrarUsuario() {
        response.contentType = "application/json"         	
            if (this.usuarioAppModel.existeUsuario(String.valueOf(nombre), String.valueOf(contrasenia))) {
            	badRequest('{ "error": "Nombre de usuario inválido" }')
            } else {
            	this.usuarioAppModel.crearUsuario(String.valueOf(nombre), String.valueOf(contrasenia))
            	ok()
            }
    }
     
    ///////////////////////////////////////////////////////////////////
    @Post("/usuarios/:nombre/:contrasenia")
    def loguearUsuario() {
    	response.contentType = "application/json"
    	try {        	
            var usuario = this.usuarioAppModel.loguear(nombre, contrasenia)
            if (usuario == null) {
            	notFound('{ "error": "Usuario no encontrado" }')
            } else {
            	ok(usuario.id.toJson)
            }
        }
        catch (Exception ex) {
        	badRequest('{ "error": "Password incorrecto" }')
        }
    }
    
    ////////////////////////////////////////////////////////////////////    
    @Get("/evaluados")
    def getEvaluados() {
        response.contentType = "application/json"        	  
       	ok(this.todosLosEvaluadosDisponibles.toJson)      
    }
    
    
    def List<PublicacionMinificada> todosLosEvaluadosDisponibles() {
    	var ArrayList<PublicacionMinificada> list = new ArrayList<PublicacionMinificada>
    	list.add(new PublicacionMinificada(new Publicacion(1, "SERVICIO", "Speedy")))
    	list.add(new PublicacionMinificada(new Publicacion(2, "LUGAR", "Coto")))
    	return list
    }
    
    // devuelve los lugares y servicios con nombre, de tipo, con igual o mayor cantidad de calificaciones y ranking
    @Get("/ranking") 
 	def getEvaluados(String buscado, String tipo, int calificaciones, int ranking) {
 		response.contentType = "application/json"        	  
       	ok(this.todosLosEvaluadosDisponibles(buscado, tipo, calificaciones, ranking).toJson) 	
 	}
    
    @Accessors
	static class PublicacionMinificada {
		Integer id
   		String tipo
   		String nombre
   	
   		new(Publicacion publicacion) {
   			this.id = publicacion.id
   			this.tipo = publicacion.tipo
   			this.nombre = publicacion.nombre	
   		}
	}
    
    
   
    
    //@Get("/calificaciones")
    // getCalificaciones(String buscado, ....)
    //9000\calificaciones& buscado = starbucks&
    ////////////////////////////////////////////////////////////////////
    
    /* 
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
    */
    
    
    
     
        	
}