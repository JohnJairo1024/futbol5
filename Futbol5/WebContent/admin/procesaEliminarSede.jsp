<%@page import="Entidades.Sede"%>
<%@page import="Datos.DatosSede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!    
    DatosSede oDatosSede;
%>


<%
	oDatosSede = new DatosSede();

    try
    {        
    	oDatosSede.eliminarSede(Integer.parseInt(request.getParameter("idsede")));
        response.sendRedirect("sede.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  
