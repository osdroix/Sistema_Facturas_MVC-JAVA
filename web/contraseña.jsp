<%@page import="backend.crud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <head>
	<meta charset="UTF-8">
        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="expires" content="Wed, 01 Jan 1997 00:00:00 GMT">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="keywords" content="Art Sign Up Form Responsive Widget, 
              Audio and Video players, Login Form Web Template, Flat Pricing 
              Tables, Flat Drop-Downs, Sign-Up Web Templates, 
	Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone 
        Compatible Web Template, Free Web Designs for Nokia, Samsung, 
        LG, Sony Ericsson, Motorola Web Design"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
             integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <script  src="JS/validacion.js"></script>
        <link rel="stylesheet" type="text/css" href="CSS/ventana.css">
        <link href="CSS/diseño.css" rel="stylesheet" type="text/css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% 
                    String corre=request.getParameter("corre");
                    ArrayList<usuarios> us = new ArrayList();
                    us=crud.getUsu(corre);
                    crud validar =new crud();
        %>
        <title>Hola</title>
    </head>
    <body class="inf">
                        <div class="capsula1">
                        <%
                            
                    if(validar.validarregistro(corre)){
                              for(usuarios o:us){
                          
                                out.println("<tr><td><h2 class='texturas'>Bienvenido "+o.getNom_usu()+"<hr>Datos Generales</h2>");
                                out.println("<tr><td>"
                                + "<h5>Nombre</h5>"
                                + "<h4><input class='form-control' readonly type='text'placeholder='"+o.getNom_usu()+" "+o.getApp_usu()+" "+o.getApm_usu()+"' type='text'/>"
                                + "<h5>Correo</h5>"
                                + "<input class='form-control'readonly type='text'placeholder='"+o.getCorre_usu()+"' type='text'/>"
                               + "<h5>Contraseña</h5>"
                                + "<input class='form-control' readonly type='text'placeholder='"+o.getContra_usu()+"' type='text'/><br>"
                                + "</tr>");
                         
                    }
                    }else{
                    response.sendRedirect("Anuncios/Dashboard.jsp?in=El correo &error=no se cuenta registrado&img=https://cdn-icons-png.flaticon.com/512/497/497738.png");
                    }
                    %>  
                    
                       <center> <a class="btn btn-info"  href = "index.html" >Aceptar</a> </center>
                        </div>
    </body>
</html>
