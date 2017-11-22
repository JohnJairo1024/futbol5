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
<jsp:include page="header.jsp" />

	<section class="content-slider">
		<h1 class="welcome">
			Bienvenido a Canchas Sinteticas de Futbol <br>
			<span>Aquí podras reservar de forma on-line</span>
		</h1>
		<!-- SLIDER -->
		<div id="outerslider">
			<div id="slidercontainer">
				<section id="slider">
					<div id="slideritems" class="flexslider">
						<ul class="slides">
							<li>
								<img src="images/slide1.jpg" alt="">
								<div class="flex-caption">
									<h1>Sede Compensar</h1>
								</div>
							</li>
							<li>
								<img src="images/slide2.jpg" alt="">
								<div class="flex-caption">
									<h1>Sede Norte</h1>
								</div>
							</li>
							<li>
								<img src="images/slide3.jpg" alt="">
								<div class="flex-caption">
									<h1>Sede Sur</h1>
								</div>
							</li>
							<li>
								<img src="images/slide4.jpg" alt="">
								<div class="flex-caption">
									<h1>Sede Americas</h1>
								</div>
							</li>
						</ul>
					</div>
					<div id="slidershadow"></div>
				</section>
			</div>
		</div>
		<!-- END SLIDER -->
	</section>

	<section class="container">
		<aside>
			<div class="intro">
				<h1>Estos son algunas de las canchas que podrás reservar.</h1>
				<p>Es la manera más facil de poder reservar, solo eliges la canchas haces clic en reservar , elegis tu lugar y confirmas , y todo listo para disfrutar.</p>
			</div>
			<div class="intro">
				<p>&nbsp;</p>
			</div>
			<ul class="soccer-fields">
				<%
					while (eCancha.hasMoreElements()) {
						Cancha aux = (Cancha) eCancha.nextElement();
				%>
				<li>
					<img src="<%=aux.getPoster()%>" alt="">
					<h4><%=aux.getNombre()%></h4>
					<hr>
					<p><%=aux.getUbicacion()%></p>
					<a id="reserva" href="reserva.jsp?id=<%=aux.getIdCancha()%>" class="button">Reservar</a>
				</li>
				<%
					}
				%>
			</ul>
		</aside>
	</section>

	<div id="bodychild">
		<div id="outercontainer">






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
								src="https://maps.googleapis.com/maps/api/js?key= AIzaSyBS0zuLmLKaB_9hJ_2GCuBwrY10js68UTM &amp;callback=initMap">

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