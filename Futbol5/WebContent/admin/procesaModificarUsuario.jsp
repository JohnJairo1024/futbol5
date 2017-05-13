<%@page import="Entidades.Usuario"%>
<%@page import="Datos.DatosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<jsp:useBean id="oUsuario" class="Entidades.Usuario" scope="page"/>

<jsp:setProperty name="oUsuario" property="usuario" value="<%=request.getParameter(&quot;usuario&quot;)%>"/>
<jsp:setProperty name="oUsuario" property="apellido" value="<%=request.getParameter(&quot;apellido&quot;) %>"/>
<jsp:setProperty name="oUsuario" property="idEspectador" value="<%= Integer.parseInt(request.getParameter(&quot;idespectador&quot;))%>"/>
<jsp:setProperty name="oUsuario" property="nombre" value="<%=request.getParameter(&quot;nombre&quot;) %>"/>
<jsp:setProperty name="oUsuario" property="tipo" value="<%=request.getParameter(&quot;tipo&quot;) %>"/>
<jsp:setProperty name="oUsuario" property="DNI" value="<%=request.getParameter(&quot;dni&quot;) %>"/>



<%!    
    DatosUsuario oDatosEspectador;    
%>



<%
    oDatosEspectador = new DatosUsuario();

    try
    {        
        oDatosEspectador.ModificarEspectador(oUsuario);
        response.sendRedirect("usuarios.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>  