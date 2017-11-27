<%@page import="Entidades.Cancha"%>
<%@page import="Datos.DatosCancha"%>
<%@page import="Entidades.Usuario"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@include file="ValidarAdmin.jsp" %>--%>

<%@page import="com.google.gson.Gson"%>

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
    
    //String res = new Gson().toJson(ListaCancha);
    //out.println( res );
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="librerias.jsp" %>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">

		      // Load the Visualization API and the corechart package.
		      google.charts.load('current', {'packages':['corechart']});
		
		      // Set a callback to run when the Google Visualization API is loaded.
		      google.charts.setOnLoadCallback(drawChart);
		
		      // Callback that creates and populates a data table,
		      // instantiates the pie chart, passes in the data and
		      // draws it.
		      function drawChart() {
		
		        // Create the data table.
		        var data = new google.visualization.DataTable();
		        data.addColumn('string', 'Topping');
		        data.addColumn('number', 'Slices');		        
		        
		        <% while (eCanchaGraf.hasMoreElements())
                {
            		Cancha auxGraf = (Cancha) eCanchaGraf.nextElement();
	            %>
	            data.addRow(['<%=auxGraf.getNombre() %>', <%=auxGraf.getTotal() %>]); 
	            <%}%>
		
		        // Set chart options
		        var options = {'title':'Canchas mas reservadas',
		                       'width':900,
		                       'height':900};
		
		        // Instantiate and draw our chart, passing in some options.
		        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		        chart.draw(data, options);
		      }
		    </script>
    </head>
    <body>
        <%@include file="header.jsp" %> 

        <!-- START OF MAIN CONTENT -->
        <div class="mainwrapper">
            <div class="mainwrapperinner">
              <%@include file="left.jsp" %>
                <div class="maincontent noright">                    
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
                                    <h2 class="table"><span>Canchas más Solicitadas</span></h2>
                                    <form action="reportes.jsp" class="form-inline pull-right">
                                    	<div class="form-group">
                                    		<label>Filtrar por fecha: </label>
						                  	<input type="text" name="fechaIni" class="form-control datetimepicker" value="<%=fechaIni %>" placeholder="Desde" readonly>
						                </div>
						                <div class="form-group">                                    		
						                  	<input type="text" name="fechaFin" class="form-control datetimepicker" value="<%=fechaFinal %>" placeholder="Hasta" readonly>
						                </div>
						                <div class="form-group">
							                <button type="submit" class="btn btn-default">Buscar</button>
							                <a href="reportes-excel.jsp" target="_new" class="btn btn-default" style="background-image: none;">
							                	<span class="glyphicon glyphicon-download" aria-hidden="true" style="padding: 0; margin-left: inherit; display: inherit; background: inherit; border-left: 0;"></span> Exportar
							                </a>
							            </div>
						                <br><br>
                                    </form>
                                    
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
                                            <th class="head1">Foto</th>  
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
                                            <td><img src="<%=aux.getPoster() %>" /></td>
                                            <td><%=aux.getNombre() %></td>
                                            <td><%=aux.getUbicacion() %></td>                                            
                                            <td><%=aux.getTotal() %></td>                                             
                                        </tr> 
                                        <%}%>
                                    </tbody>
                                </table>
                                <br><br>
                                <div id="chart_div" style="text-align:center;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>