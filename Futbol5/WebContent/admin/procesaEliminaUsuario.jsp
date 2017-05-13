<%@page import="Entidades.Usuario"%>
<%@page import="Datos.DatosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosUsuario oDatosEspectador;    
%>


<%
    oDatosEspectador = new DatosUsuario();

    try
    {        
        oDatosEspectador.EliminarEspectador(Integer.parseInt(request.getParameter("idespectador")));
        response.sendRedirect("usuarios.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  
