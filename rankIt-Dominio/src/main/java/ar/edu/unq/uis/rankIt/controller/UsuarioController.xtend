package ar.edu.unq.uis.rankIt.controller

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.uis.rankIt.appModel.UsuariosAppModel
import org.uqbar.xtrest.api.annotation.Put

@Controller
class UsuarioController {
	extension JSONUtils = new JSONUtils
	UsuariosAppModel usuarioAppModel
	
	new(UsuariosAppModel usuarioAppModel) {
		this.usuarioAppModel = usuarioAppModel
	}
	
	
	@Put("/usuarios/:nombre/:contrasenia")
    def registrarUsuario() {
        response.contentType = "application/json"         	
            if (this.usuarioAppModel.existeUsuario(String.valueOf(nombre), String.valueOf(contrasenia))) {
            	badRequest('{ "error": "nombre de usuario o contrasenia no disponible" }')
            } else {
            	this.usuarioAppModel.crearUsuario(String.valueOf(nombre), String.valueOf(contrasenia))
            	ok()
            }
        }
        	
}