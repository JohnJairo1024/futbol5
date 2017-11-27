<%@page import="Entidades.Cancha"%>
<%@page import="Datos.DatosCancha"%>
<%@page import="Entidades.Usuario"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

	String fechaIni="2017-01-01", fechaFinal="2017-12-31";
	if( request.getParameter("fechaIni")!=null && request.getParameter("fechaFin")!=null ){
		fechaIni = request.getParameter("fechaIni");
		fechaFinal = request.getParameter("fechaFin");
	}

    DatosCancha oDatosCancha = new DatosCancha();
    Hashtable ListaCancha = oDatosCancha.ListarCanchaReporte(fechaIni, fechaFinal);
    Enumeration eCancha = ListaCancha.elements();
    Enumeration eCanchaGraf = ListaCancha.elements();
    
    String nombre = "Reporte.xls";
    response.setHeader("Content-Disposition","attachment; filename=\""+ nombre + "\"");
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
    </head>
    <body>

             	
        <table cellspacing="0" cellpadding="0" border="1" class="stdtable stdtablecb">
            <colgroup>
                <col class="con1">
                <col class="con0">
                <col class="con1">
                <col class="con0">                                        
            </colgroup>
            <thead>
                <tr>
                    <th class="head0">ID</th>
                    <th class="head0">Cancha</th>
                    <th class="head0">Ubicación</th>
                    <th class="head1">Reservas</th>
                </tr>
            </thead>                                    
            <tbody>                                    
                <% while (eCancha.hasMoreElements())
                    {
                		Cancha aux = (Cancha) eCancha.nextElement();
                %>
                <tr>
                    <td><%=aux.getIdCancha() %></td>
                    <td><%=aux.getNombre() %></td>
                    <td><%=aux.getUbicacion() %></td>                                            
                    <td><%=aux.getTotal() %></td>                                             
                </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>