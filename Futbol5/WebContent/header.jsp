<jsp:useBean id="oEspectador" class="Entidades.Usuario" scope="session"/>
<jsp:setProperty name="Espectador" property="usuario" value="" />
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="com.google.gson.Gson"%>
<%
	HttpSession sesion = request.getSession();
	Object user = sesion.getAttribute("Logueado");
	//out.print( new Gson().toJson(user) );
	//out.print( new Gson().toJson(oEspectador) );
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>PisoClub</title>

	<link type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="resources/style/flexslider.css?ver=3.4.2" rel="stylesheet" />
	<link href="resources/style/style.css" rel="stylesheet" />

	<style>
	#map {
		height: 100%;
	}
	</style>

	<script>
		var URL_BASE = 'http://localhost:8080/Futbol5/';
	</script>

</head>
<body>
	<div id="loader"><img src="images/loader.gif"></div>
	<header>
		<nav class="navbar">
		  	<div class="container-fluid">
			    <div class="navbar-header">
			      	<a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="" class="logo"></a>
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
			    </div>
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      	<ul class="nav navbar-nav">						
						<% if( oEspectador.getIdEspectador() == 0 ){ %>
						<li><a href="http://pisoclub.com/empresa/nosotros.html" target="_new">Nosotros</a></li>
						<li><a class="btn-login" href="#">Ingresar</a></li>
						<li><a class="btn-registro" href="#">Registrarme</a></li>
						<% } else { %>
						<li><p>Bienvenido <% out.print( oEspectador.getNombre() + " " + oEspectador.getApellido() ); %></p></li>
						<li><a href="misreservas.jsp">Mis reservas</a></li>
						<li><a href="http://pisoclub.com/empresa/nosotros.html" target="_new">Nosotros</a></li>
						<li><a href="Logout.jsp">Salir</a></li>
						<% } %>
			      	</ul>
			    </div>
		  	</div>
		</nav>
	</header>

