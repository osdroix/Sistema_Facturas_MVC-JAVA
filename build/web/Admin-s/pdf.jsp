

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
    %>
   <%
    HttpSession sesion=request.getSession(true);
    usuarios u=(usuarios)sesion.getAttribute("user");
    int i = Integer.parseInt(request.getParameter("id"));
   
    if (sesion.getAttribute("user")!=null){
        ArrayList<entidadfac> fac = new ArrayList();
        fac = crud.getid(i);
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>  
    <title><%out.println(u.getNom_usu());%></title>
</head>
<body >
    <div id="invoice">
        <div align="center">
        <div class="pdf">
                      <%
                            
                            if(validar.validarregistro(u.getCorre_usu())){
                                      for(entidadfac f:fac){
                                       %>
                                <h2 class="texturas"><%out.println(f.getNom_fac());%></h2>
                                         <label class="fecha">Factura Fact-X</label><hr>
                                <label>Autor: <%out.println(f.getCorre_usu());%></label>
                                <h3 >Datos de la factura</h3>
                                     <center>
                                         <input class="fecha" readonly  type="text" value="<%out.println(f.getFecha_fac());%>" /><br>
                                            <div class="party">
                                                    <input class="input-face" readonly type="text" placeholder="<%out.println(f.getConcep_hospedaje_fac());%>"  />
                                                    <input class="input-face" readonly  type="text" placeholder="<%out.println(f.getMXN_hospedaje_fac());%> MXN"/>
                                            </div><br>
                                            <div class="party">
                                                    <input class="input-face" readonly type="text" placeholder="<%out.println(f.getConcep_transporte_fac());%>" />
                                                    <input class="input-face"  readonly type="text" placeholder="<%out.println(f.getMXN_transporte_fac());%> MXN"/>
                                            </div><br>
                                            <div class="party">
                                                    <input class="input-face" readonly type="text" placeholder="<%out.println(f.getConcep_alimento_fac());%> " />
                                                    <input class="input-face" readonly type="text" placeholder="<%out.println(f.getMXN_alimento_fac());%> MXN" />
                                            </div><br>    
                                            <div class="party">
                                                    <input class="input-face" readonly type="text" placeholder="<%out.println(f.getConcep_otros_fac());%> " />
                                                    <input class="input-face" readonly type="text" placeholder="<%out.println(f.getMXN_otros_fac());%> MXN" />
                                            </div>  <hr>
                                            <div class="party">
                                                    <input class="input-face" readonly  type="text" placeholder="Total:" />
                                                    <input class="input-face" readonly type="text" placeholder="<%out.println(f.getTotal_fac());%> MXN" />
                                            </div>
                                     </center> 
                              <%  }
                            }else{
                            response.sendRedirect("Anuncios/Dashboard.jsp?in=El correo &error=no se cuenta registrado&img=https://cdn-icons-png.flaticon.com/512/497/497738.png");
                            }
                            %>
        </div>                            
   </div>  
    </div><br>
<center>         
        <button type="button" id="download" class="btn btn-success">Descargar PDF</button>
        <a class="btn btn-info" href="/Facturas/Admin-s/menu.jsp">Regresar</a>
</center>
    <script>
        window.onload = function () {
        document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 0,
                filename: 'factura.pdf',
               image:        { type: 'jpeg', quality: 1 },
        jsPDF:        { unit: 'in', format: 'a5', orientation: 'portrait' },
        html2canvas:  { scale: 6 },
        pagebreak: { mode: ['css', 'Arial'], after: '.breakme' }
                      };
            html2pdf().from(invoice).set(opt).save();
        })
}
 function closed() { 
       window.open('','_parent',''); 
       window.close(); 
    } 
    </script>
</body>
</html>
<%   }else{

response.sendRedirect("/Facturas/index.html");}
%>