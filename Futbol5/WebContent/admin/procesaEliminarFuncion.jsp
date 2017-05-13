<%@page import="Entidades.Funcion"%>
<%@page import="Datos.DatosEntrada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
	DatosEntrada oDatosEntrada;    
%>


<%
    oDatosEntrada = new DatosEntrada();

    try
    {        
        oDatosEntrada.EliminarFuncion(Integer.parseInt(request.getParameter("idfuncion")));
        response.sendRedirect("funciones.jsp");
    }
    catch (Exception ex)
    {
        
    }
%>  

