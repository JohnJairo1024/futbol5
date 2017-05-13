<%@page import="Entidades.Cancha"%>
<%@page import="Datos.DatosCancha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosCancha oDatosCancha;    
%>


<%
oDatosCancha = new DatosCancha();

    try
    {        
    	oDatosCancha.EliminarCancha(Integer.parseInt(request.getParameter("idcancha")));
        response.sendRedirect("canchas.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  

