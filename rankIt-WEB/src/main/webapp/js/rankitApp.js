angular.module('rankitApp', [])

.service("rankitService", ["$http", function ($http) {

	///// .SERVICE /////

	// REGISTRAR
	this.registrar = function(loginCtrl, callback, errorCallback){
		$http.put("http://localhost:9000/usuarios", loginCtrl).success(function(){
			callback();
		}).error(function(){
			errorCallback()
		})
	}

	// LOGUEAR
	this.loguear = function(loginCtrl, callback, errorCallback){
		$http.post("http://localhost:9000/usuarios", loginCtrl).success(function(response){
			callback(response);
		}).error(function(){
			errorCallback()
		})
	}

	////////// CALIFICACIONES

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

	// EVALUADOS
	this.getEvaluados= function(callback){
		$http.get("http://localhost:9000/evaluados").success(function(response){
			callback(response);
		}).error(function(){
			errorCallback()
		})
	}
}])

//////////////.CONTROLLER /////////////////////

.controller('rankitController', function ($http,$scope,rankitService) {		

	$scope.principal = true;
	$scope.usuarioLogueado=false;

	$scope.loginCtrl = {};
	$scope.loginCtrl.usuario ="";
	$scope.loginCtrl.password = "";

	// Registrar
	$scope.registrar = function (){

		var callback = function(){
			console.log("Usuario Registrado")
			$scope.loguear();
		}

		var errorCallback=function(){
			console.log("Error al Registrar")
		}					

		rankitService.registrar($scope.loginCtrl, callback, errorCallback);

	}

	// Loguear
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
	////////////////  CALIFICACIONES ////////////////


	// Funcionabilidad boton calificar
	$scope.calificaciones = [];

	$scope.calificar = function(){
		$scope.principal = false;
		$scope.getCalificaciones();
		$scope.getEvaluados();
	}


	$scope.getCalificaciones=function(){
		var callback = function(response){
			$scope.calificaciones = response;
		}

		var errorCallback=function(){
			console.log("Error al hacer el pedido de calificaciones")
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


	$scope.validacionCalificacion={};

	$scope.validacionCalificacion.evaluado=false;
	$scope.validacionCalificacion.puntaje=false;
	$scope.validacionCalificacion.detalle=false;

	validacion=function(){
		var res = true

		if(angular.isUndefined($scope.nuevaCalificacion.evaluado) || $scope.nuevaCalificacion.evaluado==null || $scope.nuevaCalificacion.evaluado.trim()==""){
			$scope.validacionCalificacion.evaluado = true; 
			res = false;
		}
		else{ $scope.validacionCalificacion.evaluado = false; }

		if(angular.isUndefined($scope.nuevaCalificacion.puntaje) || $scope.nuevaCalificacion.puntaje==null){
			$scope.validacionCalificacion.puntaje = true; 
			res = false;
		}
		else{$scope.validacionCalificacion.puntaje = false; }
		

		if((angular.isUndefined($scope.nuevaCalificacion.detalle) || $scope.nuevaCalificacion.detalle==null || $scope.nuevaCalificacion.detalle.trim()=="")){
			$scope.validacionCalificacion.detalle = true; 
			res = false;
		}
		else {$scope.validacionCalificacion.detalle = false;}
	return res;
};

$scope.nuevaCalificacion = {};
$scope.addCalificacion = function(){
	if(validacion()){
		


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
			console.log("Error al Calificar: No existe la publicacion");
		}	
		rankitService.addCalificacion(calificacionAAgregar, callback, errorCallback);

	}
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

//Funcionabilidad del BOTON SALIR
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

//Evaluados
$scope.evaluados = [];
$scope.getEvaluados = function(){
	var callback = function(response){
		$scope.evaluados = response
	}

	var errorCallback=function(){
		console.log("Error al traer los evaluados")
	}
	rankitService.getEvaluados(callback);
}

this.evaluados=[];	  

});


