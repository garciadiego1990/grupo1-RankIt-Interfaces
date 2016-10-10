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
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.ApplicationContext

@Controller
class ControllerManager {
	extension JSONUtils = new JSONUtils
	
	val AdministradorGeneral admin
	var LogIn loguer
	var SignUp signer
	
	new() {
		this.admin = this.getAdminGeneral()
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
        	notFound('{}')
        }
        catch(ContraseniaDeUsuarioIncorrectaException ex) {
        	badRequest('{}')
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
        	badRequest('{}')
        }
    }
     
    //////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    @Get("/evaluados")
    def getEvaluados() {
        response.contentType = "application/json"  
        var miniPublicaciones = PublicacionMinificada.todasLasPublicaciones(this.admin)
       	ok(miniPublicaciones.toJson)
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
	
//CARGO EL APPLICATION CONTEXT

	def AdministradorGeneral getAdminGeneral() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		return adminGral
	}
	
	
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
   	
   		new(Publicacion publicacion, String tipo) {
   			this.id = publicacion.id
   			this.tipo = tipo
   			this.nombre = publicacion.nombre	
   		}
   		
   		def static todasLasPublicaciones(AdministradorGeneral admin) {
   			var List<PublicacionMinificada> miniPublicaciones = new ArrayList<PublicacionMinificada>
   			miniPublicaciones.addAll = publicaciones(admin.adminServicios.publicaciones, "SERVICIO")
   			miniPublicaciones.addAll = publicaciones(admin.adminLugares.publicaciones, "LUGAR")
   			return miniPublicaciones
   		}
   		
   		def static publicaciones(List<Publicacion> publicaciones, String tipo) {
   			val List<PublicacionMinificada> miniPublicaciones = new ArrayList<PublicacionMinificada>
   			publicaciones.forEach[each | miniPublicaciones.add = new PublicacionMinificada(each, tipo)]
   			return miniPublicaciones
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