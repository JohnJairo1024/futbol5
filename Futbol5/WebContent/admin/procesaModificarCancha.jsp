<%@page import="Entidades.Cancha"%>
<%@page import="Datos.DatosCancha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oCancha" class="Entidades.Cancha" scope="page"/>

<%-- <jsp:setProperty name="oCancha" property="nombre" value="<%=request.getParameter("nombre")%>"/> --%>
<jsp:setProperty name="oCancha" property="nombre" value="<%=request.getParameter(\"nombre\")%>"/>
<jsp:setProperty name="oCancha" property="poster" value="<%=request.getParameter(\"poster\")%>"/>
<jsp:setProperty name="oCancha" property="descripcion" value="<%=request.getParameter(\"descripcion\") %>"/>
<jsp:setProperty name="oCancha" property="idCancha" value="<%= Integer.parseInt(request.getParameter(\"idcancha\"))%>"/>
<jsp:setProperty name="oCancha" property="ubicacion" value="<%=request.getParameter(\"ubicacion\") %>"/>


<%!    
    DatosCancha oDatosCancha;
%>



<%
	oDatosCancha = new DatosCancha();
    try
    {        
    	oDatosCancha.ModificarCancha(oCancha);
        response.sendRedirect("canchas.jsp");
    }
    catch (Exception ex)
    {
       
    }
%>  