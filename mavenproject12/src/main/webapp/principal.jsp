<%-- 
    Document   : principal
    Created on : 6/10/2021, 12:02:00 PM
    Author     : lugca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Angular--> 
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
        <style>
            
            /*div {border-style: dotted; }*/
            #tablaCliente{
                display: none;

            }
        </style>

        <title>Hello, world!</title>
    </head>
    <body>


        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
        -->
        <div class="container-fluid" ng-app = "demoCiclo3" ng-controller = "clientesController as cn">
            <div class="row">
                <div class="col-12">
                    <center><h1>Tienda de barrio</h1></center> 
                </div>
            </div>
            <div class="row">
                <center><div class="col-6">
                        <h3>Clientes</h3>
                        <div class="row">
                            <div class="col-5">
                                <label >Identificacion</label>
                                <input class="form-control" type="number" min="0" ng-model="cn.identificacion">
                            </div>
                            <div class="col-7">
                                <label>Nombre</label>
                                <input class="form-control" type="text" ng-model="cn.nombre">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-7">
                                <label>Apellido</label>
                                <input class="form-control" type="text" ng-model="cn.apellido">
                            </div>
                            <div class="col-5">
                                <label>Genero</label>
                                <select class="form-control" ng-model="cn.genero">
                                    <option>Masculino</option>
                                    <option>Femenino</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label>Tipo identificacion</label>
                                <select class="form-control" ng-model="cn.tipoIdentificacion">
                                    <option>CC</option>
                                    <option>TI</option>
                                    <option>CE</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <label>Telefono</label>
                                <input class="form-control" type="text" ng-model="cn.telefono">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <label>Dirección</label>
                                <input class="form-control" type="text" ng-model="cn.direccion">
                            </div>
                            <div class="col-6">
                                <label>Correo</label>
                                <input class="form-control" type="text" ng-model="cn.correo">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                <button  class="btn btn-success" ng-click="cn.guardarCliente()">Guardar</button>
                            </div>
                            <div class="col-3">
                                <button  class="btn btn-primary" ng-click="cn.listarCliente()" onclick="mostrarClientes();">Listar cliente</button>
                            </div>
                            <div class="col-3">
                                <button  class="btn btn-danger" ng-click="cn.eliminarCliente()">Eliminar cliente</button>
                            </div>
                            <div class="col-3">
                                <button  class="btn btn-warning" ng-click="cn.actualizarCliente()">Actualizar cliente</button>
                            </div>
                        </div>
                    </div>

                </center>
            </div>
            <div class="row" >
                <div id="tablaCliente" class="col-12 table-responsive-xl">
                    <h3>Sección 2</h3>
                    <table class="table table-striped table-hover">  
                        <thead class="thead-dark">
                            <tr>  
                                <th>Id</th>  
                                <th>Nombre</th>  
                                <th>Apellido</th>  
                                <th>Genero</th>  
                                <th>Tipo id</th>  
                                <th>Telefono</th>  
                                <th>Direccion</th>  
                                <th>Correo</th>  
                            </tr>  
                        </thead>

                        <tr ng-repeat = "cliente in cn.cliente">  
                            <td>{{ cliente.identificacion}}</td>  
                            <td> {{cliente.nombre}}</td>  
                            <td> {{contacto.apellido}}</td>  
                            <td> {{cliente.genero}}</td>  
                            <td> {{cliente.tipoIdentificacion}}</td>  
                            <td> {{cliente.telefono}}</td>  
                            <td> {{cliente.direccion}}</td>  
                            <td> {{cliente.correo}}</td>  
                               
                        </tr>  
                    </table> 
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function mostrarClientes() {
               
                document.getElementById('tablaCliente').style.display = 'block';
            }
            var app = angular.module('demoCiclo3', []);
            app.controller('clientesController', ['$http', controladorClientes]);
            function controladorClientes($http) {
                var cn = this;
                cn.listarCliente = function () {
                    var url = "peticiones.jsp";
                    var params = {
                        proceso: "listarCliente"
                    };
                    $http({
                        method: 'POST',
                        url: 'peticiones.jsp',
                        params: params

                    }).then(function (res) {
                        cn.cliente = res.data.Cliente;
                    });
                };
                cn.guardarCliente = function () {
                    if 
                    
        
        (validar('todos')) {
                        
                        var cliente = {
                            proceso: "guardarCliente",
                            identificacion: cn.identificacion,
                            nombre: cn.nombre,
                            apellido: cn.apellido,
                            genero: cn.genero,
                            tipoIdentificacion: cn.tipoIdentificacion,
                            telefono: cn.telefono,
                            direccion: cn.direccion,
                            correo: cn.correo
                        };
                         
                        $http({
                            method: 'POST',
                            url: 'peticiones.jsp',
                            params: cliente
                        }).then(function (res) {
                            
                            if (res.data.ok === true) {
                                if (res.data[cliente.proceso] === true) {
                                    alert("Guardado con éxito");
                                                           cn.listarContactos();
                                } else {
                                    alert("Por favor vefifique sus datos");
                                }
                            } else {
                                alert(res.data.errorMsg);
                                
                            }
                        });
                    }
                };
                cn.eliminarCliente = function () {
                    if (validar('soloId')) {
                        var cliente = {
                            proceso: "eliminarCliente",
                            identificacion: cn.identificacion
                        };
                        $http({
                            method: 'POST',
                            url: 'peticiones.jsp',
                            params: cliente
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data[cliente.proceso] === true) {
                                    alert("Eliminado con éxito");
                                    //                                cn.listarContactos();
                                } else {
                                    alert("Por favor vefifique sus datos");
                                }
                            } else {
                                alert(res.data.errorMsg);
                            }
                        });
                    }
                };
                cn.actualizarCliente = function () {
                    if (validar('todos')) {
                        var cliente = {
                            proceso: "actualizarCliente",
        
                
                            identificacion: cn.identificacion,
                            nombre: cn.nombre,
                            apellido: cn.apellido,
                            genero: cn.genero,
                            tipoIdentificacion: cn.tipoIdentificacion,
                            telefono: cn.telefono,
                            direccion: cn.direccion,
                            correo: cn.correo
                        };
                        $http({
                            method: 'POST',
                            url: 'peticiones.jsp',
                            params: cliente
                        }).then(function (res) {
                            if (res.data.ok === true) {
                                if (res.data[cliente.proceso] === true) {
                
            alert("actualizarcliente con éxito");
                                    //                                cn.listarContactos();
                                } else {
                                    alert("Por favor vefifique sus datos");
                                }
                            } else {
                                alert(res.data.errorMsg);
                            }
                        });
                    }
                };
                validar = function (tipoValidacion) {
                    var vIdentificacion = cn.identificacion ? true : false;
                    var vNombre = cn.nombre ? true : false;
                    var vApellido = cn.apellido ? true : false;
                    var vGenero = cn.genero ? true : false;
                    var vTipoIdentificacion = cn.tipoIdentificacion ? true : false;
                    var vTelefono = cn.telefono ? true : false;
                    var vDireccion = cn.direccion ? true : false;
                    var vCorreo = cn.correo ? true : false;
                    if (tipoValidacion === 'soloId') {
                        if (!vIdentificacion) {
                            alert('Valide el campo identificacion');
                            return false;
                        } else {
                            return true;
                        }
                    } else if (tipoValidacion === 'todos') {
                        if (!vIdentificacion) {
                            alert('Valide el campo identificacion');
                            return false;
                        } else if (!vNombre) {
                            alert('Valide el campo nombre');
                            return false;
                        } else if (!vApellido) {
                            alert('Valide el campo apellido');
                            return false;
                        } else if (!vGenero) {
                            alert('Valide el campo genero');
                            return false;
                        } else if (!vTipoIdentificacion) {
                            alert('Valide el campo tipo identificación');
                            return false;
                        } else if (!vTelefono) {
                            alert('Valide el campo telefono');
                            return false;
                        } else if (!vDireccion) {
                            alert('Valide el campo direccion');
                            return false;
                        } else if (!vCorreo) {
                            alert('Valide el campo correo');
                            return false;
                        } else {
                            return true;
                        }
                    }
                };
            }

        </script>

        
    </body>
</html>
