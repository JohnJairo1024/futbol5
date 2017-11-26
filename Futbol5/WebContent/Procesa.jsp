<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Butaca"%>
<%@page import="Entidades.Cancha"%>
<%@page import="Entidades.Funcion"%>
<%@page import="Entidades.Horario"%>
<%@page import="Entidades.Sede"%>
<%@page import="Entidades.Usuario"%>
<%@page import="Datos.DatosButacas"%>
<%@page import="Datos.DatosEntrada"%>
<%@page import="Datos.DatosHorarios"%>
<%@page import="Datos.DatosReservas"%>
<%@page import="Datos.DatosSede"%>
<%@page import="Datos.DatosUsuario"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>

<jsp:useBean id="oEspectador" class="Entidades.Usuario" scope="session"/>
<jsp:useBean id="oReserva" class="Entidades.Reserva" scope="page"/>
<jsp:useBean id="oUsuario" class="Entidades.Usuario" scope="page"/>

<%
	String username, userpassword, nombre, apellido, dni, html = "";
	String method = request.getParameter("method");
	Map<String, String> respuesta = new HashMap<String, String>();
	DatosUsuario oDatosEspectador;
	oDatosEspectador = new DatosUsuario();
	Usuario aux = null;
	
	if( method.equals("login") ){
		username = request.getParameter("Usuario");
		userpassword = request.getParameter("Password");
		
		if( !username.equals("") && !userpassword.equals("") ){		    
		    
		    try
		    {
		        aux = oDatosEspectador.Login(username, userpassword);
		
		        if (aux != null)
		        {
		            oEspectador.setIdEspectador(aux.getIdEspectador());
		            oEspectador.setNombre(aux.getNombre());
		            oEspectador.setApellido(aux.getApellido());
		            oEspectador.setDNI(aux.getDNI());
		            oEspectador.setUsuario(aux.getUsuario());
		            oEspectador.setTipo(aux.getTipo());
		            HttpSession sesion = request.getSession();
		            sesion.setAttribute("Logueado", oEspectador);
		
		            respuesta.put("event","location.reload();");
		        }
		        else
		        {
		        	respuesta.put("event","messageError('Usuario o contraseña incorrectos.');");		            
		        }
		    }
		    catch (Exception ex)
		    {
		        
		    }
			
		} else {
			respuesta.put("event","messageError('Todos los campos son requeridos');");
		}
		
	
	} else if( method.equals("registro") ){
		username = request.getParameter("Usuario");
		userpassword = request.getParameter("Password");
		nombre = request.getParameter("nombre");
		apellido = request.getParameter("apellido");
		dni = request.getParameter("dni");
		
		if( !username.equals("") && !userpassword.equals("") && !nombre.equals("") && !apellido.equals("") && !dni.equals("") ){
			Usuario registrado = oDatosEspectador.BuscarEspectadorNombreUsuario(username);
			
			if (registrado==null)
		    {
				oUsuario.setUsuario(username);
				oUsuario.setNombre(nombre);
				oUsuario.setApellido(apellido);
				oUsuario.setDNI(dni);
				oUsuario.setPassword(userpassword);
				oUsuario.setTipo("Usuario");
				
		        try
		        {
		        	//Guarda usuario
		            oDatosEspectador.AgregarEspectador(oUsuario);
		            
		        	//Loguea Usuario
		            aux = oDatosEspectador.Login(username, userpassword);
		            oEspectador.setIdEspectador(aux.getIdEspectador());
		            oEspectador.setNombre(aux.getNombre());
		            oEspectador.setApellido(aux.getApellido());
		            oEspectador.setDNI(aux.getDNI());
		            oEspectador.setUsuario(aux.getUsuario());
		            oEspectador.setTipo(aux.getTipo());
		            HttpSession sesion = request.getSession();
		            sesion.setAttribute("Logueado", oEspectador);
		            
		            respuesta.put("event","messageError('Usuario registardo satisfactoriamente.'); setTimeout(function(){ location.reload(); },2000);");
		        }
		        catch(Exception ex)
		        {
		            
		        }
		    }
		    else
		    {
		    	respuesta.put("event","messageError('Usuario registrado, vuelva a intentarlo.');");
		    }
			
		} else {
			respuesta.put("event","messageError('Todos los campos son requeridos');");
		}
		
	} else if( method.equals("getfield") ){
		
		DatosButacas oDatosButacas = new DatosButacas();
		DatosEntrada oDatosEntrada = new DatosEntrada();
	    Hashtable ListaFunciones = oDatosEntrada.ListarEntradaCanchaId(Integer.parseInt(request.getParameter("id")));
	    Enumeration eFunciones = ListaFunciones.elements();
	    Funcion oFuncion = oDatosEntrada.BuscarFuncion(Integer.parseInt(request.getParameter("idFuncion")));
	    int filas = 0;
	    int butacas = 0;
	    int sede = Integer.parseInt(request.getParameter("idSede"));
	    while (eFunciones.hasMoreElements())
	    {
	        Funcion func = (Funcion) eFunciones.nextElement();
	        if (func.getoSede().getIdSede() == sede)
	        {
	            filas = func.getoSede().getZona();
	            butacas = func.getoSede().getPunto();
	        }
	    }
	    
	    html += "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class=\"table table-bordered\" id=\"asientos\">";
	    		html += "<thead>";
	    			html += "<tr>";
	    				html += "<th></th>";            
	                for (int y = 1; y <= butacas; y++){
                		html += "<th>Cancha " + y + "</th>";
            			}
				html += "</tr>";
			html += "</thead>";
			
			html += "<tbody>";                                 
	            for (int x = 1; x <= filas; x++){ 
	            	html += "<tr>";
	            		html += "<td valign=\"middle\" class=\"hour\">Hora " + x + ":00 PM</td>";
	                for (int y = 1; y <= butacas; y++) {
	                	html += "<td>";
	                    if (!oDatosButacas.ButacaReservada(oFuncion, x, y)) {
	                    	html += "<div class=\"checkbox\"><label><input type=\"checkbox\" name=\"columna\" id=\"" + x + "\" value=\"" + y + "\" /> Seleccionar</label></div>";
	                		} else {
	                		html += "<span style=\"color:red\">Reservado</span>";
	                    }
					html += "</td>";
	            		}
				html += "</tr>"; 
	        		}
			html += "</tbody>";
	    html += "</table>";	   	    
	    html += "<a href=\"javascript:void(0);\" class=\"pull-right btn\" onclick=\"lastStep();\">Siguiente</a>";
	    html += "<a href=\"javascript:void(0);\" class=\"pull-right btn\" onclick=\"prevStep(2);\">Volver</a>";
	    
	    respuesta.put("event","showStepTwo('"+ html +"');");
	    
	} else if( method.equals("formReserva") ){
		
		DatosReservas oDatosReservas = new DatosReservas();
	    DatosSede oDatosSede = new DatosSede();
	    DatosHorarios oDatosHorarios = new DatosHorarios();
	    DatosEntrada oDatosEntrada = new DatosEntrada();
	    DatosButacas oDatosButacas = new DatosButacas();
	    
	    try
	    {
	        int idFuncion = Integer.parseInt(request.getParameter("ReservaIdFucion"));
	        String nombreFuncion = request.getParameter("ReservaNombre");
	        int cantbutacas = Integer.parseInt(request.getParameter("cantbutacas"));
	        
	        if ((idFuncion!=0) && (cantbutacas!=0) && (!nombreFuncion.equals(""))) {
	            Funcion oFuncion = oDatosEntrada.BuscarFuncion(idFuncion);
	            Date auxdate = new Date();
	            oReserva.setoFuncion(oFuncion);
	            oReserva.setoEspectador(oEspectador);
	            nombreFuncion= request.getParameter("ReservaNombre");
	            	            
                oReserva.setNombre(request.getParameter("ReservaNombre"));
                double precio = (oFuncion.getoHorario().getPrecio()) * cantbutacas;
                oReserva.setPrecio(precio);
                oDatosReservas.AgregarReserva(oReserva);

	            for (int x = 1; x <= cantbutacas; x++)
	            {
	                int columna = Integer.parseInt(request.getParameter("asientoc" + x));
	                int fila = Integer.parseInt(request.getParameter("asientof" + x));
	                Butaca oButaca = new Butaca(oReserva.getoFuncion(), fila, columna);
	                oDatosButacas.ReservarButaca(oButaca);
	            }
	            
	            respuesta.put("event","showAlert('Gracias por su reserva.'); setTimeout(function(){ location.reload(); },2000);");
	            
	        } else {
	        	respuesta.put("event","showAlert('Revise su datos nuevamente.');");
	        }
	    }
	    catch (Exception ex)
	    {
	    	respuesta.put("event","showAlert('Error interno.');");
	    }
	} else {
		respuesta.put("event","showAlert('Error de metodo');");		
	}
	
	String res = new Gson().toJson(respuesta);
	out.print( res );    
%>
