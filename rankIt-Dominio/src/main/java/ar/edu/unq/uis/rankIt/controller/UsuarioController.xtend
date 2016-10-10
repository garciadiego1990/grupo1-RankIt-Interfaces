package ar.edu.unq.uis.rankIt.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.uis.rankIt.appModel.UsuariosAppModel
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.uis.rankIt.appModel.ServiciosAppModel
import ar.edu.unq.uis.rankIt.appModel.LugaresAppModel
import java.util.List
import java.util.ArrayList
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import org.uqbar.xtrest.api.annotation.Post
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.xtrest.api.annotation.Body
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException
import ar.edu.unq.uis.rankIt.exceptions.UsuarioNoEncontradoException

@Controller
@Deprecated
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
	
	////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 
	//registrarse 
	@Put("/usuarios")
    def signUp(@Body String body) {
    	response.contentType = "application/json"
    	
    	try {
    		var DatosUsuario datosUsuario = body.fromJson(typeof(DatosUsuario))	        	
            this.usuarioAppModel.registrarse(datosUsuario)
            ok() 
        }
        catch (Exception ex) {
        	badRequest('{ "error": "Nombre de usuario inválido" }')
        }
    }
     
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //ingresar
    @Post("/usuarios")
    def signIn(@Body String body) {
    	response.contentType = "application/json"
    	try {
    		var DatosUsuario datosUsuario = body.fromJson(typeof(DatosUsuario))        	
            var usuario = this.usuarioAppModel.loguear(datosUsuario)
            if (usuario == null) {
            	notFound('{ "error": "Usuario no encontrado" }')
            } else {
            	ok(usuario.id.toJson)
            }
        }
        catch(UsuarioNoEncontradoException ex){
        	badRequest('{ "error": "Usuario no encontrado." }')
        }
        catch(ContraseniaDeUsuarioIncorrectaException ex) {
        	badRequest('{ "error": "Password incorrecto." }')
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    @Get("/evaluados")
    def getEvaluados() {
        response.contentType = "application/json"        	  
       	ok(this.todosLosEvaluadosDisponibles.toJson)      
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // devuelve los lugares y servicios con nombre, de tipo, con igual o mayor cantidad de calificaciones y ranking
    @Get("/ranking") 
 	def getEvaluados(String nombre, String tipo, String calificaciones, String ranking) {
 		response.contentType = "application/json"
 		try {        	  
       	ok(this.todosLosEvaluadosDisponibles(nombre, tipo, (Integer.valueOf(calificaciones)), (Integer.valueOf(ranking))).toJson)
       		}
       	catch (NumberFormatException ex) {
        	badRequest('{ "error": "El id debe ser un numero entero" }')
        } 	
 	}
 	//http://localhost:9000/ranking?nombre=n&tipo=r&calificaciones=3&ranking=7




///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	def List<PublicacionMinificada> todosLosEvaluadosDisponibles() {
    	var ArrayList<PublicacionMinificada> list = new ArrayList<PublicacionMinificada>
    	list.add(new PublicacionMinificada(new Publicacion(1, "SERVICIO", "Speedy")))
    	list.add(new PublicacionMinificada(new Publicacion(2, "LUGAR", "Coto")))
    	return list
    }
 	
 	def List<RankingMinificada> todosLosEvaluadosDisponibles(String nombre, String tipo, int calificaciones, int ranking) {
    	var ArrayList<RankingMinificada> list = new ArrayList<RankingMinificada>
    	list.add(new RankingMinificada((new PublicacionMinificada(new Publicacion(1, "SERVICIO", "Speedy"))), 7, 2))
    	list.add(new RankingMinificada((new PublicacionMinificada(new Publicacion(2, "LUGAR", "Coto"))), 9, 3))
    	return list
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
	
		@Accessors
		static class RankingMinificada {
			PublicacionMinificada evaluado
   			Integer ranking
   			Integer calificaciones
   		   	
   			new(PublicacionMinificada evaluado, Integer ranking, Integer calificaciones) {
   				this.evaluado = evaluado
   				this.ranking = ranking
   				this.calificaciones = calificaciones	
   			}
		}
					 
    		@Accessors
			static class DatosUsuario {
    			String nombre
    			String contrasenia	
    		}	     	
    		
}