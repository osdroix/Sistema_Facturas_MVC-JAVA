

<%@page import="entidades.facturas"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="backend.crud"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entidades.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
    %>
   <%
    HttpSession sesion=request.getSession(true);
    usuarios u=(usuarios)sesion.getAttribute("user");
   
    if (sesion.getAttribute("user")!=null){
        ArrayList<usuarios> us = new ArrayList();
        us=crud.getusu(u.getId_usu());
        crud validar =new crud();
      
%>
<!DOCTYPE html>
<html>
<head>
	 <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="keywords" content="Art Sign Up Form Responsive Widget, 
              Audio and Video players, Login Form Web Template, Flat Pricing 
              Tables, Flat Drop-Downs, Sign-Up Web Templates, 
	Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone 
        Compatible Web Template, Free Web Designs for Nokia, Samsung, 
        LG, Sony Ericsson, Motorola Web Design"
    />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
         integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="/Facturas/CSS/ventana.css">
    <link href="/Facturas/CSS/diseño.css" rel="stylesheet" type="text/css" />
    <title><%out.println(u.getCorre_usu());%></title>
</head>
<body>
    <div class="caja">
        <div class="party">
            <img class="img"src="/Facturas/IMG/usuario.png"width="50" height="50"/>
            <h1 class="max-texturas">
                Fact-x
            </h1>
            <div class="botones-edit">
                <a  href="/Facturas/Admin/menu.jsp">
                    regresar
                    <img src="/Facturas/IMG/salida.png"width="40" height="40"/>
                </a>
            </div>
        </div>
    </div>
    <article class="sub">
                        <%
                            
                    if(validar.validarregistro(u.getCorre_usu())){
                              for(usuarios o:us){
                    %>
                         <div class="capsula-edit">
                            <form action="/Facturas/Modulador?accion=editar" method="POST">
                                <center>
                                <h1 class="texturas">Ingresa tus datos</h1>
                                <h1 class="fecha">Edita tus datos 
                                    <input class="fecha" readonly type="text" value="<%out.println(o.getId_usu());%>" name="id"/></h1><hr><!El tipo de usuario es 1 para identificar que es un admin normal>
                                       <div class="party">
                                               <img  alt="Responsive image"src="/Facturas/IMG/usuario.png"width="120" height="120"/>
                                               <div>      
                                                   <input class="form-control"  type="text" placeholder="<%out.println(o.getNom_usu());%>" required="required" name="nom" />
                                                       <input class="form-control"  type="text" placeholder="<%out.println(o.getApp_usu());%>" required="required" name="app" />
                                                       <input class="form-control"  type="text" placeholder="<%out.println(o.getApm_usu());%>" required="required" name="apm" />
                                               </div>
                                       </div>
                                </center>
                                       <br>
                                       <div class="party">
                                                <img  alt="Responsive image"src="/Facturas/IMG/sobre.png"width="40" height="40"/>
                                                <input class="form-control"  type="text" placeholder="<%out.println(o.getCorre_usu());%>" required="required" name="corre" />
                                       </div><br>
                                       <div class="party">
                                                <img  alt="Responsive image"src="/Facturas/IMG/contra.png"width="40" height="40"/>
                                                <input class="form-control"  type="password" placeholder="<%out.println(o.getContra_usu());%>" required="required" name="contra" />
                                       </div><hr>
                                           <button type="submit"  class="btn btn-info btn-block" name="btn">Editar</button>
                            </form>
                         </div>
                <%  }
                              }else{
                    response.sendRedirect("Anuncios/Dashboard.jsp?in=El correo &error=no se cuenta registrado&img=https://cdn-icons-png.flaticon.com/512/497/497738.png");
                    }
                    %>  
    </article>
</body>
</html>
<%   }else{

response.sendRedirect("/Facturas/index.html");}
%>