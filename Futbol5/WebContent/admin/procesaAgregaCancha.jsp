<%@page import="Datos.DatosCancha"%>
<%@page session="true" %>
<%@page import="Entidades.Cancha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oCancha" class="Entidades.Cancha" scope="page"/>

<jsp:setProperty name="oCancha" property="nombre" value="<%=request.getParameter(&quot;nombre&quot;)%>"/>
<jsp:setProperty name="oCancha" property="descripcion" value="<%=request.getParameter(&quot;descripcion&quot;)%>"/>
<jsp:setProperty name="oCancha" property="ubicacion" value="<%=request.getParameter(&quot;ubicacion&quot;)%>"/>
<jsp:setProperty name="oCancha" property="poster" value="<%=request.getParameter(&quot;poster&quot;)%>"/>
<jsp:setProperty name="oCancha" property="idVideo" value="<%=Integer.parseInt(request.getParameter(&quot;idvideo&quot;))%>"/>


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