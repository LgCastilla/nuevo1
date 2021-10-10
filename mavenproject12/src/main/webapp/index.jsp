<%-- 
    Document   : index
    Created on : 29/09/2021, 02:14:44 PM
    Author     : lugca
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" >
        <!-- Bootstrap CSS -->
        
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
       
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css<!--/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous"><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
          -->
        <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.2.15/angular.min.js"></script>  
        <script src="https://kit.fontawesome.com/d7eb89e2b8.js" crossorigin="anonymous"></script>
        <style>

        </style>

        <title>Tienda mi tienda</title>
    </head>
    <body>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" ></script>

    <div class="container center-block">
            <div class="row justify-content-center">

                <div class="card" style="width: 18rem;">
                    <img src="logot.png" class="card-img-top" alt="...">
                    <div class="card-body">
                        <form method="POST" action="Validar">
                            
                            <div class="input-group mb-3">
                                 <span class="input-group-text" id="basic-addon1">
                                    <i class="fas fa-user"></i>
                                </span>
                                <input type="text" class="form-control" placeholder="usuario"  name="txtusuario">
                            </div>
                            <div class="input-group mb-3">
                                 <span class="input-group-text" id="basic-addon1">
                                    <i class="fas fa-key"></i>
                                </span>
                                <input type="password" class="form-control" placeholder="password"  name="txtpass">
                            </div>
                            
                            <button type="submit" class="btn btn-primary" name="accion" value="Ingresar">Ingresar</button>
                        </form>
                    </div>
                </div>
            </div>

        </div>


    </body>
</html>