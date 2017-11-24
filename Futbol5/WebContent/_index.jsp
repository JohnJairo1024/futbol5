<%@page import="Datos.DatosCancha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="Espectador" class="Entidades.Usuario" scope="session" />
<jsp:setProperty name="Espectador" property="usuario" value="" />
<%@page import="Entidades.Cancha"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosCancha"%>
<%
	DatosCancha oDatosCancha = new DatosCancha();
	Hashtable ListaCancha = oDatosCancha.ListarCancha();
	Enumeration eCancha = ListaCancha.elements();
	HttpSession sesion = request.getSession();
	Object user = sesion.getAttribute("Logueado");
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>PisoClub</title>

	<link media="screen, all" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link media="screen, all" type="text/css" href="resources/style/master.css" rel="stylesheet" />
	<link media="screen, all" type="text/css" href="resources/style/skeleton.css?ver=3.4.2" rel="stylesheet" />
	<link id="general-css-css" media="all" type="text/css" href="resources/style/style2.css?ver=3.4.2" rel="stylesheet" />
	<link id="prettyPhoto-css-css" media="screen, all" type="text/css" href="resources/style/prettyPhoto.css?ver=3.4.2" rel="stylesheet" />
	<link id="flexslider-css-css" media="screen, all" type="text/css" href="resources/style/flexslider.css?ver=3.4.2" rel="stylesheet" />
	<link id="color-css-css" media="screen, all" type="text/css" href="resources/style/color.css?ver=3.4.2" rel="stylesheet" />

	<style>
	#map {
		height: 100%;
	}
	</style>

</head>
<body>



	<div id="bodychild">
		<div id="outercontainer">

			<!-- HEADER -->

			<div id="outerheader">
				<div class="header-bglight">
					<header id="top">
						<div class="container">
							<div id="container-logomenu" class="twelve columns">
								<span class="logo-light"> <a
									href="http://www.w3.org/html/logo/"> <img
										src="images/icom.png" width="300" height="200"
										alt="HTML5 Powered with CSS3 / Styling, and Semantics"
										title="HTML5 Powered with CSS3 / Styling, and Semantics">
								</a>

								</span>
								<div id="logo" class="three columns alpha"></div>
								<section id="navigation" class="nine columns omega">
									<nav id="nav-wrap">
										<ul id="topnav" class="sf-menu">
											<li id="menu-item-664"
												class="menu-item menu-item-type-post_type menu-item-object-page menu-item-664"><a
												target="_blank" id="userLogueado"></a></li>
											<li id="reservas"
												class="menu-item menu-item-type-post_type menu-item-object-page menu-item-664"
												style="display: none"><a target="_blank"
												id="misreservas" href="misreservas.jsp">Mis reservas</a></li>
											<li id="login"
												class="menu-item menu-item-type-post_type menu-item-object-page menu-item-664"><a
												target="_blank" class="login" href="nosotros.html">Nosotros</a></li>
											<li id="login"
												class="menu-item menu-item-type-post_type menu-item-object-page menu-item-664"><a
												target="_blank" id="window" class="login" href="login.jsp">Ingresar</a></li>
											<li id="registrarme"
												class="menu-item menu-item-type-post_type menu-item-object-page menu-item-664"><a
												target="_blank" id="window" href="registrarme.html">Registrarme</a></li>
											<li id=""
												class="menu-item menu-item-type-post_type menu-item-object-page menu-item-664"><a
												target="_blank" href="Logout.jsp" id="salir"></a></li>
										</ul>
									</nav>
									<!-- nav -->
									<div class="clear"></div>
								</section>
								<div class="clear"></div>
							</div>
						</div>
					</header>
					<div id="headertext">
						<div class="container">
							<div class="headertitle">
								<h1 class="pagetitle">Bienvenido a Canchas Sinteticas de
									Futbol</h1>
								<span class="pagedesc">Aquí podras reservar de forma
									on-line</span>
							</div>
						</div>
					</div>
				</div>

				<!-- SLIDER -->
				<div id="outerslider">
					<div id="slidercontainer">
						<section id="slider">
							<div id="slideritems" class="flexslider">
								<ul class="slides">
									<li><img src="images/slide1.jpg" alt="">
										<div class="flex-caption">
											<div class="slidertext">
												<h1>Sede Compensar</h1>
											</div>
										</div></li>
									<li><img src="images/slide2.jpg" alt="">
										<div class="flex-caption">
											<div class="slidertext">
												<h1>Sede Norte</h1>
											</div>
										</div></li>
									<li><img src="images/slide3.jpg" alt="">
										<div class="flex-caption">
											<div class="slidertext">
												<h1>Sede Sur</h1>
											</div>
										</div></li>
									<li><img src="images/slide4.jpg" alt="">
										<div class="flex-caption">
											<div class="slidertext">
												<h1>Sede Americas</h1>
											</div>
										</div></li>
								</ul>
							</div>
							<div id="slidershadow"></div>
						</section>
					</div>
				</div>
				<!-- END SLIDER -->

			</div>
			<!-- END HEADER -->

			<!-- MAIN CONTENT -->
			<div id="outermain" class="inner">
				<div class="container">
					<section id="maincontent" class="twelve columns">
						<div id="post-94"
							class="post-94 page type-page status-publish hentry">
							<div class="entry-content">
								<div class="highlight-content">
									<div class="highlight-container">
										<h1>Estos son algunas de las canchas que podrás reservar.</h1>
										<p>
											<span>Es la manera más facil de poder reservar, solo
												eliges la canchas haces clic en reservar , elegis tu lugar y
												confirmas , y todo listo para disfrutar.</span>
										</p>
									</div>
								</div>
								<div class="separator">
									<div></div>
								</div>
								<%
									while (eCancha.hasMoreElements()) {
										Cancha aux = (Cancha) eCancha.nextElement();
								%>
								<div class="boxed-container">
									<div class="boxed three columns alpha">
										<div class="boxed-content">
											<a id="trailer"
												href="trailer.jsp?idvideo=<%=aux.getIdVideo()%>"> <img
												height="135" src="<%=aux.getPoster()%>" alt=""
												class="imgopacity"></a>
											<h4 class="titleUppercase"><%=aux.getNombre()%></h4>
											<div class="sep">
												<span class="sep2"></span>
											</div>
											<p>
												<%=aux.getUbicacion()%>
											</p>
											<a id="reserva" href="reserva.jsp?id=<%=aux.getIdCancha()%>"
												class="button">Reservar</a>
										</div>
										<div class="shadow-220"></div>
									</div>
								</div>
								<%
									}
								%>



								<div class="clear"></div>

								<div class="separator line">
									<div></div>
								</div>
							</div>

						</div>


						<div class="clear"></div>
						<!-- clear float -->
					</section>
					<!-- maincontent -->
				</div>
			</div>



			<div class="container">
				<div class="panel panel-default">
					<div class="panel-body">

						<!-- GEOLOCALIZACION -->
						<div id="map">
							<h:button>
							</h:button>
							<script>
								function initMap() {
									var map = new google.maps.Map(document
											.getElementById('map'), {
										center : {
											lat : 4.710989,
											lng : -74.072092
										},
										zoom : 12
									});

									if (navigator.geolocation) {
										navigator.geolocation
												.getCurrentPosition(
														function(position) {
															var pos = {
																lat : 4.614213,
																lng : -74.131998
															};
															var pos1 = {
																lat : 4.645582,
																lng : -74.129502
															};
															var pos2 = {
																lat : 4.638034,
																lng : -74.097735
															};
															var pos3 = {
																lat : 4.637928,
																lng : -74.117703
															};

															var pos4 = {
																lat : 4.766850,
																lng : -74.016732
															};
															var pos5 = {
																lat : 4.673770,
																lng : -74.051451
															};
															var pos6 = {
																lat : 4.592443,
																lng : -74.168789
															};

															var image = {
																url : 'images/balon4.png',
																size : new google.maps.Size(
																		50, 60),
																anchor : new google.maps.Point(
																		25, 60)
															};

															var image1 = {
																url : 'images/balon5.png',
																size : new google.maps.Size(
																		50, 60),
																anchor : new google.maps.Point(
																		25, 60)
															};
															var image2 = {
																url : 'images/balon6.png',
																size : new google.maps.Size(
																		50, 60),
																anchor : new google.maps.Point(
																		25, 60)
															};
															var image3 = {
																url : 'images/balon7.png',
																size : new google.maps.Size(
																		50, 60),
																anchor : new google.maps.Point(
																		25, 60)
															};
															var image4 = {
																url : 'images/balon.png',

															};
															var image5 = {
																url : 'images/balon8.png',
																size : new google.maps.Size(
																		50, 60),
																anchor : new google.maps.Point(
																		25, 60)
															};
															var image6 = {
																url : 'images/balon9.png',
																size : new google.maps.Size(
																		50, 60),
																anchor : new google.maps.Point(
																		25, 60)
															};

															var marker = new google.maps.Marker(
																	{
																		position : pos,
																		map : map,
																		draggable : true,
																		animation : google.maps.Animation.DROP,
																		title : 'Emelec',
																		icon : image
																	});
															var marker1 = new google.maps.Marker(
																	{
																		position : pos1,
																		map : map,
																		draggable : true,
																		animation : google.maps.Animation.DROP,
																		title : 'San lorenzo',
																		icon : image1
																	});
															var marker2 = new google.maps.Marker(
																	{
																		position : pos2,
																		map : map,
																		draggable : true,
																		animation : google.maps.Animation.DROP,
																		title : 'PSG',
																		zoom : 15,
																		icon : image2
																	});
															var marker3 = new google.maps.Marker(
																	{
																		position : pos3,
																		map : map,
																		draggable : true,
																		animation : google.maps.Animation.DROP,
																		title : 'Arsenal',
																		zoom : 15,
																		icon : image3
																	});
															var marker4 = new google.maps.Marker(
																	{
																		position : pos4,
																		map : map,
																		draggable : true,
																		animation : google.maps.Animation.DROP,
																		title : 'Arsenal',
																		zoom : 15,
																		icon : image4
																	});
															var marker5 = new google.maps.Marker(
																	{
																		position : pos5,
																		map : map,
																		draggable : true,
																		animation : google.maps.Animation.DROP,
																		title : 'Barcelona',
																		zoom : 15,
																		icon : image5
																	});
															var marker5 = new google.maps.Marker(
																	{
																		position : pos6,
																		map : map,
																		draggable : true,
																		animation : google.maps.Animation.DROP,
																		title : 'Barcelona',
																		zoom : 15,
																		icon : image6
																	});

															function addMarker(
																	location,
																	map) {
																var marker = new google.maps.Marker(
																		{
																			position : location,
																			map : map,
																			draggable : true,
																			animation : google.maps.Animation.DROP
																		});
															}

															function ruta(
																	location) {
																var objConfigDR = {
																	map : map,
																}

																var objConfigDS = {
																	origin : pos,
																	destination : location,
																	travelMode : google.maps.TravelMode.DRIVING
																}

																var directionsService = new google.maps.DirectionsService();
																var directionRenderer = new google.maps.DirectionsRenderer(
																		objConfigDR);

																directionsService
																		.route(
																				objConfigDS,
																				fnRutear);

																function fnRutear(
																		resultados,
																		status) {
																	if (status == 'OK') {
																		directionRenderer
																				.setDirections(resultados);
																	} else {
																		alert('error'
																				+ status);
																	}
																}
															}

														},
														function() {
															handleLocationError(
																	true,
																	infoWindow,
																	map
																			.getCenter());
														});

									}

									else {
										handleLocationError(false, infoWindow,
												map.getCenter());
									}
								}

								function handleLocationError(
										browserHasGeolocation, infoWindow, pos) {
									infoWindow.setPosition(pos);
									infoWindow
											.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
													: 'Error: Your browser doesn\'t support geolocation.');
								}
							</script>

							<script
								src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBXV9IskT7ecrr9H0vooXXKOzCmjuorlJY&callback=initMap">
								
							</script>

						</div>
						<!-- FIN GEOLOCALIZACION -->

					</div>
				</div>
			</div>

			<div id="shadowbottom"></div>

			<!-- FOOTER SECTION -->
			<div id="footersection">
				<!-- FOOTER SIDEBAR -->
				<div id="outerfootersidebar">
					<div class="container">
						<div id="footersidebarcontainer" class="twelve columns">
							<footer id="footersidebar">
								<div id="footcol2" class="three columns">
									<div class="widget-area">
										<div class="widget-bottom">
											<ul>
												<li id="text-2" class="widget-container widget_text">
													<h2 class="widget-title">
														<span>Canchas Sinteticas de Futbol</span>
													</h2>
													<div class="textwidget">
														<ul class="sn">
															<li><a target="_blank" href="http://www.twitter.com"><span
																	class="icon-img"
																	style="background-image: url(images/twiiter.png)"></span></a></li>
															<li><a target="_blank"
																href="http://www.facebook.com"><span
																	class="icon-img"
																	style="background-image: url(images/facebook.png)"></span></a></li>
															<li><a target="_blank"
																href="https://plus.google.com"><span
																	class="icon-img"
																	style="background-image: url(images/google.png)"></span></a></li>
														</ul>
													</div>
												</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="clear"></div>
							</footer>
						</div>
					</div>
				</div>
			</div>
			<!-- END FOOTER SECTION -->

		</div>
		<!-- end bodychild -->
	</div>
	<!-- end outercontainer -->

<jsp:include page="footer.jsp" />