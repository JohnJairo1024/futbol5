<%@page import="Entidades.Funcion"%>
<%@page import="Datos.DatosButacas"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Datos.DatosEntrada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    DatosButacas oDatosButacas = new DatosButacas();
	DatosEntrada oDatosEntrada = new DatosEntrada();
    Hashtable ListaFunciones = oDatosEntrada.ListarEntradaCanchaId(Integer.parseInt(request.getParameter("id")));
    Enumeration eFunciones = ListaFunciones.elements();
    Funcion oFuncion = oDatosEntrada.BuscarFuncion(Integer.parseInt(request.getParameter("idfuncion")));
    int filas = 0;
    int butacas = 0;
    String titulo = "titulo";
    String poster = "titulo";
    String descripcion = "titulo";
    String genero = "titulo";
    int sede = Integer.parseInt(request.getParameter("idSede"));
    while (eFunciones.hasMoreElements())
    {
        Funcion aux = (Funcion) eFunciones.nextElement();
        if (aux.getoSede().getIdSede() == sede)
        {
            filas = aux.getoSede().getZona();
            butacas = aux.getoSede().getPunto();
        }
    }
%>
<div class="content">
    <div class="maincontentinner">

        <div class="content">
            <div class="contenttitle radiusbottom0">
                <h2 class="table"><span>Seleccionar la cancha</span></h2>
            </div><!--contenttitle-->   
            <div style="height:270px; overflow: auto">
                <table cellspacing="0" cellpadding="0" border="0" class="stdtable stdtablecb" id="asientos">
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
                            <th class="head1"></th>
                            <%

                                for (int y = 1; y <= butacas; y++)
                                {
                            %> 
                            <th class="head1">Cancha <%= y%></th>
                            <%}%>
                        </tr>
                    </thead>                                    
                    <tbody>                                    

                        <%

                            for (int x = 1; x <= filas; x++)
                            {
                        %> 
                        <tr>
                            <td class="center"><p>Hora <%= x%>:00 PM</p>



                            </td>
                            <%

                                for (int y = 1; y <= butacas; y++)
                                {
                            %> 
                            <td class="center">
                                <%
                                    if (!oDatosButacas.ButacaReservada(oFuncion, x, y))
                                    {
                                %>
                                <input type="checkbox" name="columna" id="<%= x%>" value="<%= y%>" />
                                <%
                                }
                                else
                                {
                                %>
                                <p style="color:red">Reservado</>
                                    <%                                    }
                                    %>


                            </td>
                            <%}%>
                        </tr> 
                        <%}%>


                    </tbody>
                </table>
            </div>
        </div>
    </div>


</div>
<script>
    
    $("#asientos").change(function () {
        var items = [];
        var asientos=[];
        $(":checkbox:checked").each( function() {
            var valor=$(this);
            items.push(valor);
        });
                
        $('.my-new-list').remove();
        $('#reservaAsientos').children().remove();
        $('#selectmostrartasientos').children().remove();
        
        $.each( items, function(i, l){
            var columna=$(l).val();
            var fila=$(l).attr("id");
            var texto="Cancha:" + columna + "Hora: " + fila;
            asientos.push(texto);
            valor=i+1;
            $('#reservaAsientos').append('<input type="hidden" name="asientoc'+valor+'"  value="'+columna+'" />');
            $('#reservaAsientos').append('<input type="hidden" name="asientof'+valor+'"  value="'+fila+'" />');
            $('#selectmostrartasientos').append('<option> Cancha No '+columna+' Hora: '+fila+ ':00 pm' + ' </option>');
           
                    
           
        });
        $('#cantbutacas').attr("value",valor);
        
        
    })    
</script>                                                   
