<%@page import="Datos.DatosCancha"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entidades.Horario"%>
<%@page import="Entidades.Sede"%>
<%@page import="Datos.DatosHorarios"%>
<%@page import="Datos.DatosSede"%>
<%@page import="Entidades.Cancha"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="Datos.DatosEntrada"%>
<%@page session="true" %>
<%@page import="Entidades.Funcion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="oFuncion" class="Entidades.Funcion" scope="page"/>

<%! DatosCancha oDatosCancha;
    DatosSede oDatosSede;
    DatosHorarios oDatosHorarios;
    DatosEntrada oDatosEntrada;
%>

<%
	oDatosCancha = new DatosCancha();
	oDatosSede = new DatosSede();
    oDatosEntrada = new DatosEntrada();
    oDatosHorarios = new DatosHorarios();

    try
    {
        String horString = request.getParameter("horario");
        java.sql.Time fecFormatoTime = null;
        SimpleDateFormat sdf = new java.text.SimpleDateFormat("hh:mm:ss", new Locale("es", "ES"));
        fecFormatoTime = new java.sql.Time(sdf.parse(horString).getTime());

        String fecString = request.getParameter("fecha");
        java.sql.Date fecFormatoDate = null;
        SimpleDateFormat sdf2 = new java.text.SimpleDateFormat("dd-MM-yyyy", new Locale("es", "ES"));
        fecFormatoDate = new java.sql.Date(sdf2.parse(fecString).getTime());

        int idCancha = Integer.parseInt(request.getParameter("cancha"));
        int idSede = Integer.parseInt(request.getParameter("sede"));


        Cancha oCancha = oDatosCancha.BuscarCancha(idCancha);
        Sede oSede = oDatosSede.buscarSede(idSede);
        Horario oHorario = oDatosHorarios.BuscarHorario(fecFormatoTime);

        oFuncion.setFecha(fecFormatoDate);
        oFuncion.setoHorario(oHorario);
        oFuncion.setoCancha(oCancha);
        oFuncion.setoSede(oSede);

        oDatosEntrada.AgregarFuncion(oFuncion);
        response.sendRedirect("funciones.jsp");
    }
    catch (Exception ex)
    {
        
    }

%>        


