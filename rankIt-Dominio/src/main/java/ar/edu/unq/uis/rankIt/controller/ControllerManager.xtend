package ar.edu.unq.uis.rankIt.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.rankIt.exceptions.UsuarioNoEncontradoException
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException
import ar.edu.unq.uis.rankit.dominio.login.LogIn
import org.uqbar.xtrest.api.annotation.Put
import ar.edu.unq.uis.rankit.dominio.signup.SignUp
import ar.edu.unq.uis.rankIt.exceptions.NombreDeUsuarioInvalidoException
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.uis.rankIt.dominio.Publicacion

@Controller
class ControllerManager {
	extension JSONUtils = new JSONUtils
	
	val AdministradorGeneral admin
	var LogIn loguer
	var SignUp signer
	
	new(AdministradorGeneral admin) {
		this.admin = admin
		this.loguer = new LogIn(this.admin.adminUsuarios)
		this.signer = new SignUp(this.admin.adminUsuarios)
	}
	
 //////////////////////////////////////////////////////////////////////////////////////////////////////////

	//ingresar
    @Post("/usuarios")
    def signIn(@Body String body) {
    	response.contentType = "application/json"
    	try {
    		var DatosUsuario datos = body.fromJson(typeof(DatosUsuario))        	
            var usuario = this.loguer.logearUsuario(datos.usuario, datos.password)
            ok(usuario.id.toJson)
        }
        catch(UsuarioNoEncontradoException ex){
        	notFound('{ "error": "Usuario no encontrado." }')
        }
        catch(ContraseniaDeUsuarioIncorrectaException ex) {
        	badRequest('{ "error": "Password incorrecto." }')
        }
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
	 
	//registrarse 
	@Put("/usuarios")
    def signUp(@Body String body) {
    	response.contentType = "application/json"
    	
    	try {
    		var DatosUsuario datos = body.fromJson(typeof(DatosUsuario))	        	
            this.signer.registrarUsuario(datos.usuario, datos.password)
            ok() 
        }
        catch (NombreDeUsuarioInvalidoException ex) {
        	badRequest('{ "error": "Nombre de usuario inválido" }')
        }
    }
     
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    @Get("/evaluados")
    def getEvaluados() {
        response.contentType = "application/json"        	  
       	ok(this..toJson)      
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
	
	@Accessors
	static class DatosUsuario {
		String usuario
		String password
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
}