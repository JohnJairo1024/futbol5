<%@page import="Datos.DatosCancha"%>
<%@page session="true" %>
<%@page import="Entidades.Cancha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oCancha" class="Entidades.Cancha" scope="page"/>

<jsp:setProperty name="oCancha" property="nombre" value="<%=request.getParameter(\"nombre\")%>"/>
<jsp:setProperty name="oCancha" property="descripcion" value="<%=request.getParameter(\"descripcion\")%>"/>
<jsp:setProperty name="oCancha" property="ubicacion" value="<%=request.getParameter(\"ubicacion\")%>"/>
<jsp:setProperty name="oCancha" property="poster" value="<%=request.getParameter(\"poster\")%>"/>
<jsp:setProperty name="oCancha" property="idVideo" value="<%=Integer.parseInt(request.getParameter(\"idvideo\"))%>"/>


<%!    
DatosCancha oDatosCancha;
%>

<%
	oDatosCancha = new DatosCancha();
    try
    {
    	oDatosCancha.AgregarCancha(oCancha);
        response.sendRedirect("canchas.jsp");
    }
    catch (Exception ex)
    {
        
    }
%>      