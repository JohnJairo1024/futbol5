<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Usuario"%>
<%@page import="Datos.DatosUsuario"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.*"%>

<jsp:useBean id="oEspectador" class="Entidades.Usuario" scope="session"/>
<jsp:useBean id="oUsuario" class="Entidades.Usuario" scope="page"/>

<%
	String username, userpassword, nombre, apellido, dni;
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
		
		
	} else {
		respuesta.put("event","messageError('Error de metodo');");		
	}
	
	String res = new Gson().toJson(respuesta);
	out.print( res );    
%>
