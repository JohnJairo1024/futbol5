

<%@page import="Entidades.Cancha"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosCancha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%
    DatosCancha oDatosCancha = new DatosCancha();
    Hashtable ListaCanchas = oDatosCancha.ListarCancha();
    Enumeration eCanchas = ListaCanchas.elements();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
    </head>
    <body>        

        <%@include file="header.jsp" %>

        <div class="mainwrapper">
            <div class="mainwrapperinner">
              <%@include file="left.jsp" %>
                <div class="maincontent noright">
                    <a href="agregarCancha.jsp" class="stdform"><button class="submit radius2 ">Agregar</button></a>                    
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
                                    <h2 class="table"><span>Listar</span></h2>
                                </div><!--contenttitle-->              	
                                <table cellspacing="0" cellpadding="0" border="0" class="stdtable stdtablecb" id="table2">
                                    <colgroup>
                                        <col class="con1">
                                        <col class="con0">
                                        <col class="con1">
                                        <col class="con0">
                                        <col class="con1">  
                                        <col class="con0">                                       
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class="head0">ID</th>
                                            <th class="head1">Poster</th>
                                            <th class="head0">Nombre</th>
                                            <th class="head1">Descripcion</th>                                            
                                            <th class="head0">Ubicacion</th> 
                                            <th class="head1">Opciones</th>
                                        </tr>
                                    </thead>                                    
                                    <tbody>
                                        <% while (eCanchas.hasMoreElements())
                                            {
                                                Cancha aux = (Cancha) eCanchas.nextElement();
                                        %>
                                        <tr>
                                            <td><%=aux.getIdCancha()%></td>
                                            <td><img src="<%=aux.getPoster()%>"/></td>
                                            <td><%=aux.getNombre()%></td>                                           
                                            <td><%=aux.getDescripcion()%></td>                                            
                                            <td><%=aux.getUbicacion()%></td>                                            
                                            <td class="center" style="width: 166px;">
                                                <form action="modificarCancha.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idcancha" value="<%=aux.getIdCancha() %>">
                                                    <p class="stdform" style="width: 80px;">
                                                        <button class="submit radius2">Modificar</button>
                                                    </p>&nbsp;
                                                </form>
                                                    <form action="procesaEliminarCancha.jsp" method="post" style="float:left;width: 80px;">
                                                    <input type="hidden" name="idcancha" value="<%=aux.getIdCancha() %>">
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
