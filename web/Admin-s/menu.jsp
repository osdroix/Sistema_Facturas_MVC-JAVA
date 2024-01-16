

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="backend.conexion"%>
<%@page import="java.sql.Connection"%>
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
        ArrayList<usuarios> us = new ArrayList();
        ArrayList<entidadfac> fac = new ArrayList();
        us=crud.getUsu(u.getCorre_usu());
        fac = crud.getfac();
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
    <div class="caja">
        <div class="party">
            <img class="img"src="/Facturas/IMG/usuario.png"width="50" height="50"/>
            <h1 class="max-texturas">
                Fact-x
            </h1>
            
            <div class="botones-d">
                <a class="btn btn-info" href="/Facturas/Admin-s/menu.jsp">Menu Principal</a>
                <a class="btn btn-info" href="/Facturas/Admin-s/Informe.jsp">Informe</a>
                <button class="btn btn-info" id="btn-abrir-popup">Nueva Factura</button>
                 <button class="btn btn-info" id="btn-abrir-popups">Perfil</button>
                <a  href="/Facturas/Modulador?accion=cerrar-sesion">
                    <img src="/Facturas/IMG/salida.png"width="40" height="40"/>
                </a>
            </div>
        </div>
         <h1 class="min-texturas-txt">
                
                <form action="menu.jsp" method="POST">
                   <div class="party">
                    <select class="form-control"  name="corre">
                                <%
                                  Connection c = conexion.getConnection();
                                    String x = "select * from usuario_factura";                                    
                                    PreparedStatement set1 = c.prepareStatement(x);
                                    ResultSet rs = set1.executeQuery();
                                    while (rs.next()) {
                                        %>
                                        <option><%=rs.getString(6)%></option>
                                        <%
                                    }
                                        %>
                        </select>
                        <button type="submit" class="btn btn-info">
                            Buscar
                        </button>
                        
                </div>
                     </form>
            </h1>
    </div>
    <div class="sub-fac">
                      <%
                          String correo = request.getParameter("corre");
                          System.out.print("el correo maldito"+correo);
                          if(correo == null){
                      %>
                      <%
                            
                            if(validar.validarregistro(u.getCorre_usu())){
                                      for(entidadfac f:fac){
                                       %>
                            <div class="capsula-fac-m">
                                <h2 class="texturas"><%out.println(f.getNom_fac());%></h2><hr>
                                <label>Autor: <%out.println(f.getNom_usu());%><%out.println(f.getApp_usu());%><%out.println(f.getApm_usu());%></label>
                                <h3 >Datos de la factura</h3>
                                     <center>
                                         <input class="fecha" readonly  type="text" value="<%out.println(f.getFecha_fac());%>" /><br>
                                            <div class="party">
                                                <textarea class="txt" rows="1"readonly cols="60" placeholder="<%out.println(f.getConcep_hospedaje_fac());%>"></textarea>
                                                    <input class="input-fac" readonly  type="text" placeholder="<%out.println(f.getMXN_hospedaje_fac());%> MXN" name="mxn" />
                                            </div><br>
                                            <div class="party">
                                                    <textarea class="txt" readonly rows="1" cols="60" placeholder="<%out.println(f.getConcep_transporte_fac());%>"  name="trans"></textarea>
                                                    <input class="input-fac"  readonly type="text" placeholder="<%out.println(f.getMXN_transporte_fac());%> MXN" name="mxn1" />
                                            </div><br>
                                            <div class="party">
                                                    <textarea class="txt" readonly rows="1" cols="60" placeholder="<%out.println(f.getConcep_alimento_fac());%>"   name="alim"></textarea>
                                                    <input class="input-fac" readonly type="text" placeholder="<%out.println(f.getMXN_alimento_fac());%> MXN" name="mxn2" />
                                            </div><br>    
                                            <div class="party">
                                                    <textarea class="txt" readonly rows="1" cols="60" placeholder="<%out.println(f.getConcep_otros_fac());%>"  name="otros"></textarea>
                                                    <input class="input-fac" readonly type="text" placeholder="<%out.println(f.getMXN_otros_fac());%> MXN" name="mxn3" />
                                            </div>  <hr>
                                            <div class="party">
                                                    <input class="input-fac" readonly  type="text" placeholder="Total:" />
                                                    <input class="input-fac" readonly type="text" placeholder="<%out.println(f.getTotal_fac());%> MXN" name="total" />
                                            </div>
                                     </center> <br>
                                            <div class="party-flex">
                                                <a id="btn" class="btn btn-link" href="<%out.println("/Facturas/Admin-s/pdf.jsp?id="+f.getId_fac()+"");%>">PDF</a>
                                                <a id="btn" class="btn btn-info" href="<%out.println("/Facturas/Admin-s/editar.jsp?id="+f.getId_fac()+"");%>">Editar</a>
                                                <a id="btn" class="btn btn-danger" href="<%out.println("/Facturas/Admin-s/eliminar.jsp?id="+f.getId_fac()+"");%>">Eliminar</a>
                                            </div>    
                            </div>
                              <%  }
                            }else{
                            response.sendRedirect("Anuncios/Dashboard.jsp?in=El correo &error=no se cuenta registrado&img=https://cdn-icons-png.flaticon.com/512/497/497738.png");
                            }
                            %>
                    <%
                          }else{
                          
                            ArrayList<entidadfac> l = new ArrayList();
                            l =crud.getcor(correo);
                          if(validar.validarregistro(u.getCorre_usu())){
                                      for(entidadfac f:l){
                                       %>
                            <div class="capsula-fac-m">
                                <h2 class="texturas"><%out.println(f.getNom_fac());%></h2><hr>
                                <label>Autor: <%out.println(f.getNom_usu());%><%out.println(f.getApp_usu());%><%out.println(f.getApm_usu());%></label>
                                <h3 >Datos de la factura</h3>
                                     <center>
                                         <input class="fecha" readonly  type="text" value="<%out.println(f.getFecha_fac());%>" /><br>
                                            <div class="party">
                                                <textarea class="txt" rows="1"readonly cols="60" placeholder="<%out.println(f.getConcep_hospedaje_fac());%>"></textarea>
                                                    <input class="input-fac" readonly  type="text" placeholder="<%out.println(f.getMXN_hospedaje_fac());%> MXN" name="mxn" />
                                            </div><br>
                                            <div class="party">
                                                    <textarea class="txt" readonly rows="1" cols="60" placeholder="<%out.println(f.getConcep_transporte_fac());%>"  name="trans"></textarea>
                                                    <input class="input-fac"  readonly type="text" placeholder="<%out.println(f.getMXN_transporte_fac());%> MXN" name="mxn1" />
                                            </div><br>
                                            <div class="party">
                                                    <textarea class="txt" readonly rows="1" cols="60" placeholder="<%out.println(f.getConcep_alimento_fac());%>"   name="alim"></textarea>
                                                    <input class="input-fac" readonly type="text" placeholder="<%out.println(f.getMXN_alimento_fac());%> MXN" name="mxn2" />
                                            </div><br>    
                                            <div class="party">
                                                    <textarea class="txt" readonly rows="1" cols="60" placeholder="<%out.println(f.getConcep_otros_fac());%>"  name="otros"></textarea>
                                                    <input class="input-fac" readonly type="text" placeholder="<%out.println(f.getMXN_otros_fac());%> MXN" name="mxn3" />
                                            </div>  <hr>
                                            <div class="party">
                                                    <input class="input-fac" readonly  type="text" placeholder="Total:" />
                                                    <input class="input-fac" readonly type="text" placeholder="<%out.println(f.getTotal_fac());%> MXN" name="total" />
                                            </div>
                                     </center> <br>
                                            <div class="party-flex">
                                                <a id="btn" class="btn btn-link" href="<%out.println("/Facturas/Admin-s/pdf.jsp?id="+f.getId_fac()+"");%>">PDF</a>
                                                <a id="btn" class="btn btn-info" href="<%out.println("/Facturas/Admin-s/editar.jsp?id="+f.getId_fac()+"");%>">Editar</a>
                                                <a id="btn" class="btn btn-danger" href="<%out.println("/Facturas/Admin-s/eliminar.jsp?id="+f.getId_fac()+"");%>">Eliminar</a>
                                            </div>    
                            </div>
                              <%  }
                            }else{
                            response.sendRedirect("Anuncios/Dashboard.jsp?in=El correo &error=no se cuenta registrado&img=https://cdn-icons-png.flaticon.com/512/497/497738.png");
                            }
                            %>
                    <%
                          }
                    %>
    </div>
  <!Popups de informacio------[*w*]>
  <div class="overlay" id="overlay">
    <div class="popup" id="popup">
        <a href="#" id="btn-cerrar-popup" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
        <h2 class="texturas">Nueva Factura</h2><hr>
             <form action="/Facturas/Admin-s/validar.jsp" method="POST">
                 <center>
                     <input type="hidden" value="<%out.println(u.getId_usu());%>" name="Id"/><!Es la id de usuario es 1 para identificar de quien es la factura>
                     <input class="fecha" readonly  type="text" placeholder="<%out.println(dtf.format(LocalDateTime.now()));%>" name="fecha" /><br>
                     <input class="form-control"   type="text" placeholder="Nombre de la factura" required="required" name="nom"><br>
                        <div class="party">
                            <textarea class="form-control" rows="1" cols="20" placeholder="Hospedaje" required="required" name="hospe"></textarea>
                                <input class="form-control"  type="text" placeholder="MXN"  name="mxn" />
                        </div><br>
                        <div class="party">
                                <textarea class="form-control" rows="1" colsl="20" placeholder="Transporte" required="required" name="trans"></textarea>
                                <input class="form-control"  type="text" placeholder="MXN"  name="mxn1" />
                        </div><br>
                        <div class="party">
                                <textarea class="form-control" rows="1" cols="20" placeholder="Alimento"  required="required" name="alim"></textarea>
                                <input class="form-control"  type="text" placeholder="MXN"  name="mxn2" />
                        </div><br>    
                        <div class="party">
                                <textarea class="form-control" rows="1" cols="20" placeholder="Otros" required="required" name="otros"></textarea>
                                <input class="form-control"  type="text" placeholder="MXN"  name="mxn3" />
                        </div> 
                 </center>
                        <hr>
                            <button type="submit"  class="btn btn-info btn-block" name="btn">Calculo de viáticos</button>
             </form>
    </div>
  </div>
 <! popups num 2>
    <div class="overlay" id="overlays">
    <div class="popup" id="popups">
        <a href="#" id="btn-cerrar-popups" class="btn-cerrar-popup">cerrar<i class="fas fa-times"></i></a>
                        <%
                            
                    if(validar.validarregistro(u.getCorre_usu())){
                              for(usuarios o:us){
                          
                                out.println("<tr><td><h2 class='texturas'>Perfil<hr>Datos Generales</h2>");
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
                    
                       <center> <a class="btn btn-info"  href = "/Facturas/Edit/Editar.jsp" >Editar</a> </center>
                        </div>
    </div>
                    <script src="/Facturas/JS/ventnas.js"></script>
</body>
</html>
<%   }else{

response.sendRedirect("/Facturas/index.html");}
%>