rankitApp.service("LoginService", function () {

  this.usuario ="";
  this.contrasenha ="";

  this.login = function ($http,nombre,contrasenha,callback,errorHandler) {
    
    var data = {}
    data.nombre = nombre
    data.contrasenha = contrasenha

    var estado =$http({
            url: 'http://localhost:9000/usuarios',
            method: "POST",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
}).success(callback).error(errorHandler);
  };


});

