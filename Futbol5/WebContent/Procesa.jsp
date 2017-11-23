<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Entidades.Usuario"%>
<%@page import="Datos.DatosUsuario"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.*"%>

<jsp:useBean id="oEspectador" class="Entidades.Usuario" scope="session"/>

<jsp:setProperty name="oEspectador" property="usuario" value="<%=request.getParameter(\"Usuario\")%>"/>
<jsp:setProperty name="oEspectador" property="password" value="<%=request.getParameter(\"Password\")%>"/>

<%
	
	String method = request.getParameter("method");
	Gson gson = new Gson();
	Map<String, String> respuesta = new HashMap<String, String>();
	//String respuesta[] = new String[5];	
	
	if( method.equals("login") ){
		String username = request.getParameter("Usuario");
		
		DatosUsuario oDatosEspectador;
	    Usuario aux = null;
	
	    oDatosEspectador = new DatosUsuario();
	    
	    try
	    {
	        aux = oDatosEspectador.Login(oEspectador.getUsuario(), oEspectador.getPassword());
	
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
	
	        %><script>setTimeout(function(){$('#popup1').fadeOut(2000);$('#fancy1').fadeOut(3000)} , 000); $('#userLogueado').text('Usuario: <%=oEspectador.getUsuario() %>');$('#salir').text('Salir');$('#login').hide();$('#registrarme').hide();$('#reservas').show();</script>
	          
	
	        <%
	        }
	        else
	        {
	            %><script>setTimeout(function(){$('#errorLogin').fadeOut(2000);} , 000)</script><p id="errorLogin" style="color: red;  font-size: 12px;   margin-left: 77px;    margin-top: -80px;">Usuario o password incorrectos.</p><%
	            oDatosEspectador.Desconectar();
	            
	        }
	    }
	    catch (Exception ex)
	    {
	        
	    }
	} else {
		respuesta.put("event","alert('Error')");		
	}
	
	out.print(gson.toJson(respuesta));
	    
%>
