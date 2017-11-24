<%@page import="Entidades.Reserva"%>
<%@page import="Datos.DatosReservas"%>
<%@page import="Entidades.Funcion"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosEntrada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%@include file="Validacion.jsp" %>

<%
    DatosReservas oDatosReservas = new DatosReservas();
    Hashtable oListaReservas = oDatosReservas.ListarReservasEspectador(oEspectador);
    Enumeration eLista = oListaReservas.elements();
%>

<jsp:include page="header.jsp" />
	<section class="content-slider">
		<img src="images/slide1.jpg" alt="" class="banner">
	</section>
	
	<section class="container">
		<aside>
			<h1 class="txt-center">Mis Reservas</h1>
			<div class="table-responsive">
				<table cellspacing="0" cellpadding="0" border="0" class="table table-bordered">
		            <thead>
		                <tr>
		                    <th>Nombre de reserva</th>
							<th>Sede</th>
							<th>Cancha</th>
							<th>Horario</th>
							<th>Fecha</th>
							<th>Precio</th>
		                </tr>
		            </thead>
		            <tbody>                             
		                <% while (eLista.hasMoreElements()) {
		                        Reserva aux = (Reserva) eLista.nextElement();
		                %> 
		                <tr>
		                    <td><%=aux.getNombre()%></td> 
		                    <td><%=aux.getoFuncion().getoSede().getNombre()%></td>
		                    <td><%=aux.getoFuncion().getoCancha().getNombre()%></td>
		                    <td><%=aux.getoFuncion().getoHorario().getHorario()%></td>
		                    <td><%=aux.getoFuncion().getFecha()%></td>
		                    <td><%=aux.getPrecio()%></td>
		                </tr> 
		                <%}%>
		            </tbody>
		        </table>
			</div>
		</aside>
	</section>
	
<jsp:include page="footer.jsp" />