<%@page import="Datos.DatosSede"%>
<%@page session="true" %>
<%@page import="Entidades.Sede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="oSede" class="Entidades.Sede" scope="page"/>

<jsp:setProperty name="oSede" property="nombre" value="<%=request.getParameter(&quot;nombre&quot;)%>"/>
<jsp:setProperty name="oSede" property="zona" value="<%=Integer.parseInt(request.getParameter(&quot;zona&quot;)) %>"/>
<jsp:setProperty name="oSede" property="punto" value="<%=Integer.parseInt(request.getParameter(&quot;punto&quot;)) %>"/>


<%!    
	DatosSede oDatosSede;
%>

<%
	oDatosSede = new DatosSede();
    try
    {
    	oDatosSede.agregarSede(oSede);
        response.sendRedirect("sede.jsp");
    }
    catch (Exception ex)
    {
        
    }
%>       

