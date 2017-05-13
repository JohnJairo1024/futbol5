<%@page import="Datos.DatosSede"%>
<%@page import="Entidades.Sede"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosSede oDatosSede;
    Sede aux = new Sede();
%>



<%
	oDatosSede = new DatosSede();
    try
    {
        aux = oDatosSede.buscarSede(Integer.parseInt(request.getParameter("idsede")));        
    }
    catch(Exception ex)
    {
        
    }
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
                    <a href="sede.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Modificar Sede</span></h2>
                                </div>
                                <br>
                                <form action="procesaModificarSede.jsp" method="post" class="stdform" id="form1">
                                    <p>
                                        <label>Nombre</label>
                                        <span class="field"><input type="text" class="longinput required" id="nombre" name="nombre" value="<%=aux.getNombre() %>"></span>
                                        <input type="hidden" class="longinput required" id="idsede" name="idsede" value="<%=aux.getIdSede() %>">
                                    </p>

                                    <p>
                                        <label>Zona</label>
                                        <span class="field"><input type="text" class="longinput required number" id="zona" name="zona" value="<%=aux.getZona() %>" disabled></span>
                                    </p>

                                    <p>
                                        <label>Punto</label>
                                        <span class="field"><input type="text" class="longinput required number" id="punto" name="punto" value="<%=aux.getPunto() %>" disabled></span>
                                    </p>    
                                    
                                    <p class="stdform">
                                        <button class="submit submit2 radius2">Modificar</button>
                                    </p>
                                </form>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="js/plugins/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/plugins/error.js"></script>
</html>



