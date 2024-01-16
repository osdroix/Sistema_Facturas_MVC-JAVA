

<%@page import="entidades.entidadfac"%>
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
DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    %>
   <%
    HttpSession sesion=request.getSession(true);
    usuarios u=(usuarios)sesion.getAttribute("user");
   
    if (sesion.getAttribute("user")!=null){
        int i = Integer.parseInt(request.getParameter("id")); 
        ArrayList<entidadfac> us = new ArrayList();
        us = crud.getid(i);
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
    <title><%out.println(u.getNom_usu());%></title>
</head>
<body >
    <article class="sub">
                      <%
                            
                    if(validar.validarregistro(u.getCorre_usu())){
                              for(entidadfac f:us){
                               %>
                                <div class="capsula-fac">
                                    <div class="party">
                                    <h2 class="texturas">Edite la factura</h2>
                                    <a class="btn btn-link" href="/Facturas/Admin/menu.jsp">Regresar</a>
                                    </div>
                                    <hr>
                                     <form action="/Facturas/Admin/edit-f.jsp"  method="POST">
                                         <center>
                                                    <input class="fecha" readonly type="text" value="<%out.println(f.getId_fac());%>"  name="id"/><!Es la id de la factura es 1 para identificar de quien es la factura>
                                             <input class="fecha" readonly  type="text" value="<%out.println(dtf.format(LocalDateTime.now()));%>"  name="fecha" /><br>
                                             <input class="form-control"  type="text" value="<%out.println(f.getNom_fac());%>" name="nom"><br>
                                                <div class="party">
                                                    <input class="form-control"  type="text" value="<%out.println(f.getConcep_hospedaje_fac());%>"  name="hospe"/>
                                                        <input class="form-control"  type="text" value="<%out.println(f.getMXN_hospedaje_fac());%>" name="mxn" />
                                                </div><br>
                                                <div class="party">
                                                        <input class="form-control"   type="text" value="<%out.println(f.getConcep_transporte_fac());%>"  name="trans"/>
                                                        <input class="form-control"   type="text" value="<%out.println(f.getMXN_transporte_fac());%>" name="mxn1" />
                                                </div><br>
                                                <div class="party">
                                                        <input class="form-control"  type="text" value="<%out.println(f.getConcep_alimento_fac());%>"   name="alim"/>
                                                        <input class="form-control"  type="text" value="<%out.println(f.getMXN_alimento_fac());%>" name="mxn2" />
                                                </div><br>    
                                                <div class="party">
                                                        <input class="form-control" type="text" value="<%out.println(f.getConcep_otros_fac());%>"  name="otros"/>
                                                        <input class="form-control" type="text" value="<%out.println(f.getMXN_otros_fac());%>" name="mxn3" />
                                                </div>  <br>
                                         </center>
                                                <hr>
                                                    <button type="submit"  class="btn btn-info btn-block" name="btn">Calcular Viáticos</button>
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