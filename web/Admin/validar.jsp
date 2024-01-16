
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
        String nom,hospe,trans,alim,otros,fecha,id;
            double mxn,mxn1,mxn2,mxn3,total;
                nom = request.getParameter("nom");
                hospe = request.getParameter("hospe");
                trans = request.getParameter("trans");
                alim = request.getParameter("alim");
                otros = request.getParameter("otros");
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                mxn = Double.parseDouble(request.getParameter("mxn"));
                mxn1 = Double.parseDouble(request.getParameter("mxn1"));
                mxn2 = Double.parseDouble(request.getParameter("mxn2"));
                mxn3 = Double.parseDouble(request.getParameter("mxn3"));
                id = request.getParameter("Id");
                
                total = mxn+mxn1+mxn2+mxn3;
                System.out.println("Esta es la que me esta chingando"+id);
      
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
<body class="login">
    <article class="sub">
        <div class="capsula-fac">
            <div class="party">
            <h2 class="texturas">Valide sus datos</h2>
            <a class="btn btn-link" href="/Facturas/Admin/menu.jsp">Regresar</a>
            </div>
            <h2 class="fecha">Calculo de viáticos</h2>
            <hr>
             <form action="/Facturas/Modulador?accion=Registro-fac"  method="POST">
                 <center>
                            <input class="fecha" readonly type="text" value="<%out.println(u.getId_usu());%>"  name="id"/><!Es la id de usuario es 1 para identificar de quien es la factura>
                     <input class="fecha" readonly  type="text" value="<%out.println(dtf.format(LocalDateTime.now()));%>"  name="fecha" /><br>
                     <input class="form-control"  readonly  type="text" value="<%out.println(nom);%>" name="nom"><br>
                        <div class="party">
                            <input class="form-control" readonly type="text" value="<%out.println(hospe);%>"  name="hospe"/>
                                <input class="form-control" readonly  type="text" value="<%out.println(mxn);%>" name="mxn" />
                        </div><br>
                        <div class="party">
                                <input class="form-control"  readonly type="text" value="<%out.println(trans);%>"  name="trans"/>
                                <input class="form-control"  readonly type="text" value="<%out.println(mxn1);%>" name="mxn1" />
                        </div><br>
                        <div class="party">
                                <input class="form-control" readonly type="text" value="<%out.println(alim);%>"   name="alim"/>
                                <input class="form-control" readonly type="text" value="<%out.println(mxn2);%>" name="mxn2" />
                        </div><br>    
                        <div class="party">
                                <input class="form-control"readonly type="text" value="<%out.println(otros);%>"  name="otros"/>
                                <input class="form-control" readonly type="text" value="<%out.println(mxn3);%>" name="mxn3" />
                        </div>  <br>
                        <div class="party">
                                <input class="form-control" readonly  type="text" placeholder="Total:" />
                                <input class="form-control" readonly type="text" value="<%out.println(total);%>" name="total" />
                        </div>
                 </center>
                        <hr>
                            <button type="submit"  class="btn btn-info btn-block" name="btn">Dar de alta</button>
             </form>
        </div>
    </article>
    </body>
</html>
<%   }else{

response.sendRedirect("/Facturas/index.html");}
%>
