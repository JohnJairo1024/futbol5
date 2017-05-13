<%@page import="Entidades.Cancha"%>
<%@page import="Datos.DatosCancha"%>
<%@page import="Datos.DatosCancha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="ValidarAdmin.jsp" %>

<%!    
    DatosCancha oDatosCancha;
    Cancha aux = new Cancha();
%>



<%
	oDatosCancha = new DatosCancha();

    try
    {
        aux = oDatosCancha.BuscarCancha(Integer.parseInt(request.getParameter("idcancha")));        
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
                    <a href="canchas.jsp" class="stdform"><button class="submit radius2 ">Volver</button></a>
                    <div class="content">
                        <div class="maincontentinner">
                            <div class="content">
                                <div class="contenttitle">
                                    <h2 class="form"><span>Modificar Cancha</span></h2>
                                </div>
                                <br>
                                <form action="procesaModificarCancha.jsp" method="post" class="stdform" id="form1" novalidate="novalidate">
                                    <p>
                                        <label>Nombre</label>
                                        <span class="field"><input type="text" class="longinput" id="firstname" name="nombre" value="<%=aux.getNombre() %>"></span>
                                        <input type="hidden" class="longinput required" id="firstname" name="idcancha" value="<%=aux.getIdCancha() %>">
                                    </p>

                                    <p>
                                        <label>Imagen</label>
                                        <span class="field"><input type="text" class="longinput required url" id="lastname" name="poster" value="<%=aux.getPoster() %>"></span>
                                    </p>

                                    <p>
                                        <label>Descripcion</label>
                                        <span class="field"><textarea id="location" class="mediuminput required" name="descripcion" rows="5" cols="80" > <%=aux.getDescripcion() %> </textarea></span>
                                    </p>

                                    <p>
                                        <label>Ubicacion</label>
                                        <span class="field"><input type="text" class="longinput required" id="email" name="ubicacion" value="<%=aux.getUbicacion() %>"></span> 
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

