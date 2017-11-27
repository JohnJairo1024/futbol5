<%@page import="Entidades.Usuario"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.google.gson.Gson"%>

<%

	String fechaIni="2017-01-01", fechaFinal="2017-12-31";
	if( request.getParameter("fechaIni")!=null && request.getParameter("fechaFin")!=null ){
		fechaIni = request.getParameter("fechaIni");
		fechaFinal = request.getParameter("fechaFin");
	}

	DatosUsuario oDatosClientes = new DatosUsuario();
    Hashtable ListaClientes = oDatosClientes.ListarEspectadoresReporte(fechaIni, fechaFinal);
    Enumeration eClientes = ListaClientes.elements();
    Enumeration eClientesGraf = ListaClientes.elements();
    
    String nombre = "ReporteUsuarios.xls";
    response.setHeader("Content-Disposition","attachment; filename=\""+ nombre + "\"");
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>

             	
        <table cellspacing="0" cellpadding="0" border="0" class="stdtable stdtablecb" id="table2">
            <colgroup>
                <col class="con1">
                <col class="con0">
                <col class="con1">
                <col class="con0">                                        
            </colgroup>
            <thead>
                <tr>
                    <th class="head0">Nombre</th>
                    <th class="head1">Apellido</th>  
                    <th class="head0">DNI</th>
                    <th class="head1">Reservas</th>
                </tr>
            </thead>                                    
            <tbody>                                    
                <% while (eClientes.hasMoreElements())
                    {
                		Usuario aux = (Usuario) eClientes.nextElement();
                %>
                <tr>
                    <td><%=aux.getNombre() %></td>
                    <td><%=aux.getApellido() %></td>
                    <td><%=aux.getDNI() %></td>                                            
                    <td><%=aux.getTotal() %></td>                                             
                </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>