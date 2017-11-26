<%@page import="Entidades.Funcion"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosEntrada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%@include file="Validacion.jsp" %>

<%
			DatosEntrada oDatosEntrada = new DatosEntrada();
            Hashtable ListaEntrada = oDatosEntrada.ListarEntradaCanchaId(Integer.parseInt(request.getParameter("id")));
            Enumeration eFunciones = ListaEntrada.elements();
            int idCancha = Integer.parseInt(request.getParameter("id"));
            int filas = 0;
            int butacas = 0;
            String titulo = "titulo";
            String poster = "titulo";
            String descripcion = "titulo";
            String genero = "titulo";
%>

<jsp:include page="header.jsp" />
	<section class="content-slider">
		<img src="images/slide1.jpg" alt="" class="banner">
	</section>
	
	<section class="container page-reserva">
		<aside>
			<h1 class="txt-center">LLene el formulario para hacer una reserva</h1>
			
			<ul class="icon-steps">
				<li class="active">	<span>1</span> <br>SELECCIONAR SEDE</li>
				<li>	<span>2</span> <br>SELECCIONAR CANCHA</li>
				<li>	<span>3</span> <br>CONFIRMAR RESERVA</li>
			</ul>	
		
			<div class="step-1">
				<h2>Listado de Sedes</h2>
				<div class="table-responsive">
					<table cellspacing="0" cellpadding="0" border="0" class="table table-bordered">
			            <thead>
			                <tr>
			                    <th>Sede</th>
								<th>Cancha</th>
								<th>Horario</th>
								<th>Fecha</th>
								<th>Precio</th>
			                </tr>
			            </thead>   
			            <tbody>                             
			                <% while (eFunciones.hasMoreElements()) {
	                             Funcion aux = (Funcion) eFunciones.nextElement();
	                             filas = aux.getoSede().getZona();
	                             butacas = aux.getoSede().getPunto();
	                             titulo = aux.getoCancha().getNombre();
	                             poster = aux.getoCancha().getPoster();
	                             descripcion = aux.getoCancha().getDescripcion();
	                             genero = aux.getoCancha().getUbicacion();
		                    %>
		                    <tr class="click" data-sede="<%= aux.getoSede().getIdSede()%>" data-function="<%= aux.getIdFuncion()%>" data-field="<%= idCancha%>">
		                        <td class="sede"><%=aux.getoSede().getNombre()%></td>
		                        <td class="cancha"><%=aux.getoCancha().getNombre()%></td> 
		                        <td><%=aux.getoHorario().getHorario()%></td> 
		                        <td><%=aux.getFecha()%></td>
		                        <td class="precio"><%=aux.getoHorario().getPrecio()%></td>
		                    </tr> 
		                    <%}%>
			            </tbody>
			        </table>
				</div>
			</div>
			
			<div class="step-2">
				<h2>Selección de cancha</h2>
				<div class="table-responsive" id="fieldsReserv"></div>
			</div>
			
			<div class="step-3">
				<h2>Reserve</h2>
				<form action="" id="formReserva">
	                <input type="hidden" name="ReservaIdFucion" id="ReservaIdFucion" value="0" />
	                <input type="hidden" name="ReservaIdCliente" id="ReservaIdCliente" value="0" />
	                <input type="hidden" id="cantbutacas" name="cantbutacas"  value="0" />
	                <div id="reservaAsientos"></div>
					<div>
						<div class="col-md-2">
							<img height="135" class="imgopacity" alt="" src="<%= poster%>"/> <br>
							 <p> <%= titulo%> </p>
						</div>
						<div class="col-md-5">
							<div class="table-responsive">
								<table cellspacing="0" cellpadding="0" border="0" class="table table-bordered">
									<thead>
										<tr>
			                                <th>Sede</th>
			                                <th>Cancha</th>
			                                <th>Precio</th>
			                                <th>Total</th>
			                            </tr>
			                        </thead>
		                            <tbody id="reserva-confimacion"></tbody>
								</table>
							</div>
						</div>
						<div class="col-md-5">
							<p id="detailhour"></p>
							<div class="form-group">
							    <input type="text" class="form-control" name="ReservaNombre" id="ReservaNombre" required placeholder="Indique un nombre para la reserva" />
							</div>
							
						</div>
					</div>					
					<a href="javascript: void(0);" class="btn btn-submit pull-right">Reservar</a>
					<a href="javascript: void(0);" class="btn pull-right" onclick="prevStep(3);">Volver</a>					
				</form>
			</div>
				
		</aside>
	</section>

<jsp:include page="footer.jsp" />