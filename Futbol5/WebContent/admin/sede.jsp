<%@page import="Entidades.Sede"%>
<%@page import="Datos.DatosSede"%>
<%@page import="Entidades.Usuario"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>


<%
    DatosSede oDatosSede = new DatosSede();
    Hashtable ListaSede = oDatosSede.listarSede();
    Enumeration eSede = ListaSede.elements();
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
    </head>
    <body>
        <%@include file="header.jsp" %> 

        <!-- START OF MAIN CONTENT -->
        <div class="mainwrapper">
            <div class="mainwrapperinner">
              <%@include file="left.jsp" %>
                <div class="maincontent noright">
                    <a href="agregarSede.jsp" class="stdform"><button class="submit radius2 ">Agregar Una Sede</button></a>                    
                    <div>
                        <tr>
                            <th class="head0">&nbsp;</th>
                        </tr> 
                    </div>
                    <div class="content">
                        <div class="maincontentinner">
                            <ul class="maintabmenu">
                                <li class="current"></li>
                            </ul><!--maintabmenu-->
                            <div class="content">
                                <div class="contenttitle radiusbottom0">
                                    <h2 class="table"><span>Lista de Sedes</span></h2>
                                </div><!--contenttitle-->              	
                                <table cellspacing="0" cellpadding="0" border="0" class="stdtable stdtablecb" id="table2">
                                    <colgroup>
                                        <col class="con1">
                                        <col class="con0">
                                        <col class="con1">
                                        <col class="con0">                                        
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="head0">ID</th>
                                            <th class="head1">Localidad</th>
                                            <th class="head0">Barrio / Zona</th>                                            
                                            <th class="head0">Punto / Ubicación </th>                                            
                                            <th class="head1">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>                                    
                                        <% while (eSede.hasMoreElements())
                                            {
                                        		Sede aux = (Sede) eSede.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getIdSede() %></td>
                                            <td><%=aux.getNombre() %></td>
                                            <td><%=aux.getZona() %></td>
                                            <td><%=aux.getPunto() %></td> 
                                            <td class="center" style="width: 166px;">
                                                <form action="modificarSede.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idsede" value="<%=aux.getIdSede() %>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Modificar</button>
                                                    </p>&nbsp;
                                                </form>
                                                    <form action="procesaEliminarSede.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idsede" value="<%=aux.getIdSede() %>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Eliminar</button>
                                                    </p>
                                                </form> 
                                            </td>
                                        </tr> 
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>