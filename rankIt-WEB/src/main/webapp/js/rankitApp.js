angular.module('rankitApp', [])

.service("rankitService", ["$http", function ($http) {

	this.registrar = function(loginCtrl, callback, errorCallback){
		$http.put("http://localhost:9000/usuarios", loginCtrl).success(function(){
			callback();
		}).error(function(){
			errorCallback()
		})
	}

	this.loguear = function(loginCtrl, callback, errorCallback){
		$http.post("http://localhost:9000/usuarios", loginCtrl).success(function(response){
			callback(response);
		}).error(function(){
			errorCallback()
		})
	}
	
	this.getCalificaciones = function(idUsuario, callback, errorCallback){
		$http.get("http://localhost:9000/calificaciones?id="+ idUsuario).success(function(response){
			callback(response);
		}).error(function(){
			errorCallback()
		})
	}
	
	this.deleteCalificacion = function(idCalificacion, callback){
		$http.delete("http://localhost:9000/calificaciones?id="+ idCalificacion).success(function(){
			callback();
		})
	}
	
	this.addCalificacion = function(calificacion, callback, errorCallback){
		$http.post("http://localhost:9000/calificaciones", calificacion).success(function(response){
			callback(response);
		}).error(function(){
			errorCallback()
		})
		
	}
	
	this.editCalificacion = function(calificacion, callback){
		$http.put("http://localhost:9000/calificaciones", calificacion).success(function(){
			callback();
		})
		
	}
	// agregar errorCallback
	this.getEvaluados= function(callback){
		$http.get("http://localhost:9000/evaluados").success(function(response){
			callback(response);
		})
	}
	
}])

.controller('rankitController', function ($http,$scope,rankitService) {		
	
	$scope.principal = true;
	$scope.usuarioLogueado=false;

	$scope.loginCtrl = {};
	$scope.loginCtrl.usuario ="";
	$scope.loginCtrl.password = "";

	$scope.registrar = function (){

		var callback = function(){
			console.log("Usuario Registrado")
		}

		var errorCallback=function(){
			console.log("Error al Registrar")
		}					

		rankitService.registrar($scope.loginCtrl, callback, errorCallback);

	}

	$scope.loguear = function (){

		var callback = function(response){
			console.log("Usuario Logueado "+response.id);
			$scope.idUsuario = response.id
			$scope.usuarioLogueado=true;
		}
	

		var errorCallback=function(){
			console.log("Error al loguear: Error al ingresar el usuario o la contrasenia")
		}	

		rankitService.loguear($scope.loginCtrl, callback, errorCallback);


	}
	$scope.calificaciones = [];
	
	$scope.calificar = function(){
		$scope.principal = false;
		$scope.getCalificaciones();
		$scope.getEvaluados();
	}
	
	// hay q hacer un callback de error
	$scope.getCalificaciones=function(){
		var callback = function(response){
			$scope.calificaciones = response;
		}
		
		var errorCallback=function(){
			console.log("El usuario logueado no posee calificaciones hasta el momento")
		}	
		
		rankitService.getCalificaciones($scope.idUsuario, callback, errorCallback)
		
	}	
/*	
	$scope.deleteCalificacion = function(idCalificacion, index){
		var callback = function(){
			$scope.calificaciones.splice(index, 1);		
		}
		rankitService.deleteCalificacion(idCalificacion, callback);
	
	}
*/
	$scope.deleteCalificacion = function(idCalificacion, index){
		bootbox.confirm("Estas seguro que queres eliminar esta calificacion?", function(confirma) {
			if (confirma) {
				var callback = function(){
					$scope.calificaciones.splice(index, 1);		
				}
				rankitService.deleteCalificacion(idCalificacion, callback);
				
				}
			})
		}

	$scope.nuevaCalificacion = {};
	$scope.addCalificacion = function(){
		$scope.nuevaCalificacion.evaluador=$scope.loginCtrl.usuario;
		var calificacionAAgregar = {};
		angular.copy($scope.nuevaCalificacion, calificacionAAgregar);
		
		var callback = function(response){
			calificacionAAgregar.id = response.id;
			calificacionAAgregar.tipo = response.tipo;
			$scope.calificaciones.push(calificacionAAgregar);
			$scope.nuevaCalificacion = {};
		}
		
		var errorCallback=function(){
			console.log("Error al Calificar: No existe la publicacion")
		}	
		rankitService.addCalificacion(calificacionAAgregar, callback, errorCallback)
		
	}
	
	$scope.calificacionEditable = {};
	$scope.editCalificacion = function(index){
		var calificacionAEditar = {};
		angular.copy($scope.calificacionEditable, calificacionAEditar);
		var callback = function(){
			$scope.calificaciones[index] = calificacionAEditar;
			$scope.calificacionEditable = {};
		}
		rankitService.editCalificacion(calificacionAEditar, callback);
	}
	
	$scope.prepararModal = function(index){
		angular.copy($scope.calificaciones[index], $scope.calificacionEditable);
		$scope.indiceDeCalificacionEditable = index;
	}
	
	
	$scope.salir = function(){
		$scope.principal = true;
		$scope.usuarioLogueado = false;
		$scope.calificaciones = [];
		$scope.loginCtrl.usuario ="";
		$scope.loginCtrl.password = "";
		$scope.nuevaCalificacion = {};
		$scope.calificacionEditable = {};
		$scope.evaluados = [];
	}
	
	$scope.evaluados = [];
	$scope.getEvaluados = function(){
		var callback = function(response){
			$scope.evaluados = response
		}
		rankitService.getEvaluados(callback);
	}
	
		});


