<%@page import="Entidades.Sede"%>
<%@page import="Datos.DatosSede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oSede" class="Entidades.Sede" scope="page"/>

<jsp:setProperty name="oSede" property="idSede" value="<%=Integer.parseInt(request.getParameter(\"idsede\")) %>"/>
<jsp:setProperty name="oSede" property="nombre" value="<%=request.getParameter(\"nombre\")%>"/>


<%!    
    DatosSede oDatosSede;
%>



<%
	oDatosSede = new DatosSede();
    try
    {        
    	oDatosSede.modificarSede(oSede);
        response.sendRedirect("sede.jsp");
    }
    catch (Exception ex)
    {
        
    }
%>  