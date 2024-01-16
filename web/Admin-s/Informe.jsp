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
    if (sesion.getAttribute("user")!=null){
      
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
    <title>Informe</title>
</head>
<body >
    <div id="invoice"><br>
        <div align="center">
            <div class="center">   
                <h1 class="texturas">Fact-X</h1>
                <h6 class="fecha">Noviembre-Diciembre</h6>
                <h6>Informe de facturas.</h6>
                 <% 
      try{ 
        Connection c = conexion.getConnection();
            String x = "select * from usuario_factura INNER JOIN factura ON usuario_factura.Id_usu=factura.Id_usu_fac";
            PreparedStatement set1 = c.prepareStatement(x);
            ResultSet rs = set1.executeQuery();
  %>
        <div class="table-responsive">
        <table class="table">
            <tr>
                <th>Codigo</th>
                <th>Fecha</th>
                <th>Correo</th>
                <th>Nombre</th>
                <th>Total</th>
            
            </tr>
            <%
                while (rs.next()){
            %>
            <tr>
                <td><%= rs.getString("Id_fac")%></td>
                <td><%= rs.getString("Fecha_fac")%></td>
                <td><%= rs.getString("Correo_usu")%></td>
                <td><%= rs.getString("Nom_fac")%></td>
                <td><%= rs.getString("Total_fac")%> MXN</td>
               
            </tr>
              <%
                        
                     }
                    
                    rs.close();
                    System.out.println("Si hay tabla");
                    
                }catch(Exception e){
                    System.out.println("No conected");
                    System.out.println(e.getMessage());
                                        System.out.println(e.getStackTrace());


                }     
                %>
                
        </table>
        </div><hr>
                    <%
                                Connection con = conexion.getConnection();
                                String q = "SELECT SUM(Total_fac) FROM factura"; 
                                PreparedStatement ps = con.prepareStatement(q);
                                ResultSet rs = ps.executeQuery();
                                rs.next();
                                String Total = rs.getString(1);
                                        %>
                
                                        <h1 class="fecha">Total : <%out.println(Total);%> MXN</h1>
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
        jsPDF:        { unit: 'in', format: 'a4', orientation: 'portrait' },
        html2canvas:  { scale: 4 },
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