

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
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
        
        <link href="/Facturas/CSS/diseño.css" rel="stylesheet" type="text/css" />
	<title>
		Fact-X Error
	</title>
    </head>
    <body class="login" onload="redireccionarPagina()">
       <article class="sub"> 
        <div class="capsula" >
            <center>
                <h1 class="texturas" ><%out.println(request.getParameter("in"));%><br><hr>
                <img src="<%out.println(request.getParameter("img"));%>" width="250" height="250"/></h1><br>
                <h3 class="texturas"><%out.println(request.getParameter("error"));%></h3>
            </center>
        </div>
       </article>
         <script> 
            function redireccionarPagina() { 
                setTimeout("location.href='/Facturas/Admin/menu.jsp'", 2000); }
        </script>
    </body>
</html>

