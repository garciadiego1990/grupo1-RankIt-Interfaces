rankitApp.controller('LoginController', function ($http,$scope,$state,loginService) 
{
	    $scope.nombre ="";
		$scope.contrasenha ="";
		$scope.usuarioLogueado= null;
		
		$scope.loguear = function () 
		{
			$scope.usuarioLogueado= loginService.login($http,$scope.nombre,$scope.contrasenha,$scope.loguearUsuario(),$scope.errorDeLogueo());
		}
		
		$scope.loguearUsuario = function () 
		{
<<<<<<< HEAD
			//$state.go('logeado');
		}
		
		$scope.pepe = function () 
		{
			return $scope.usuarioLogueado;
		}
=======
			$state.go('logeado');
		
>>>>>>> bfeab6498ba5ffbe2be1a53d6d9ce08ac465c03f
		
		$scope.errorDeLogueo = function () 
		{
			//muestra en pantalla los errores
		}
	
});
  
