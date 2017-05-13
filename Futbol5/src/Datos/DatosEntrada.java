package Datos;

import Entidades.Funcion;
import Entidades.Horario;
import Entidades.Cancha;
import Entidades.Sede;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class DatosEntrada extends Futbol5BD
{
    private DatosSede oDatosSede = new DatosSede();
    private DatosCancha oDatosCancha = new DatosCancha();
    private DatosHorarios oDatosHorarios = new DatosHorarios();

    public void AgregarFuncion(Funcion oFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        if (oFuncion != null)
        {
            String sql = "INSERT INTO Funciones (IdSede, IdCancha, Horario, Fecha) VALUES ('"
                    + oFuncion.getoSede().getIdSede() + "','"
                    + oFuncion.getoCancha().getIdCancha() + "','"
                    + oFuncion.getoHorario().getHorario() + "','"
                    + oFuncion.getFecha() + "')";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar(); //ALGO PASA CON EL QUERY
        }
    }

    public void ModificarFuncion(Funcion oFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        if (oFuncion != null)
        {
            String sql = "UPDATE futbol.Funciones SET IdSede = '"
                    + oFuncion.getoSede().getIdSede() + "', IdCancha = '"
                    + oFuncion.getoCancha().getIdCancha() + "', Horario = '"
                    + oFuncion.getoHorario().getHorario() + "', Fecha = '"
                    + oFuncion.getFecha() + "' WHERE IdFuncion = "
                    + oFuncion.getIdFuncion();
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }

    public void EliminarFuncion(int IdFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        String sql = "DELETE FROM Funciones WHERE IdFuncion = " + IdFuncion;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }

    public Funcion BuscarFuncion(int IdFuncion) throws SQLException, ClassNotFoundException, Exception
    {
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE IdFuncion = " + IdFuncion;
        PreparedStatement s = CrearSentencia(sql);        
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sede oSede = oDatosSede.buscarSede(Resultado.getInt("IdSede"));
            Cancha oCancha = oDatosCancha.BuscarCancha(Resultado.getInt("IdCancha"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getTime("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSede, oCancha, oHorario, Resultado.getDate("Fecha"));
        }
        
        Desconectar();        

        return aux;
    }

    public  Hashtable ListarFunciones() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1";
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {            
            Sede oSede = oDatosSede.buscarSede(Resultado.getInt("IdSede"));
            Cancha oCancha = oDatosCancha.BuscarCancha(Resultado.getInt("IdCancha"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getTime("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSede, oCancha, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarEntradaCancha(Cancha oCanchas) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND IdCancha = " + oCanchas.getIdCancha();
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sede oSede = oDatosSede.buscarSede(Resultado.getInt("IdSede"));
            Cancha oCancha = oDatosCancha.BuscarCancha(Resultado.getInt("IdCancha"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getDate("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSede, oCancha, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
     public Hashtable ListarEntradaCanchaId(int id) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;       
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND IdCancha = " + id;
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);
        
        while (Resultado.next())
        {
            Sede oSede = oDatosSede.buscarSede(Resultado.getInt("IdSede"));
            Cancha oCancha = oDatosCancha.BuscarCancha(Resultado.getInt("IdCancha"));
            Horario oHorario =(Horario) oDatosHorarios.BuscarHorario(Resultado.getTime("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSede, oCancha, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarFuncionesSede(Sede oSedes) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND IdSede = " + oSedes.getIdSede();
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sede oSede = oDatosSede.buscarSede(Resultado.getInt("IdSede"));
            Cancha oCancha = oDatosCancha.BuscarCancha(Resultado.getInt("IdCancha"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getDate("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSede, oCancha, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
    
    public Hashtable ListarFuncionesHorario(Horario oHorarios) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Funcion aux = null;
        String sql = "SELECT * FROM Funciones WHERE Estado = 1 AND Horario = " + oHorarios.getHorario();
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);

        while (Resultado.next())
        {
            Sede oSede = oDatosSede.buscarSede(Resultado.getInt("IdSede"));
            Cancha oCancha = oDatosCancha.BuscarCancha(Resultado.getInt("(IdCancha)"));
            Horario oHorario = oDatosHorarios.BuscarHorario(Resultado.getDate("Horario"));
            aux = new Funcion(Resultado.getInt("IdFuncion"), oSede, oCancha, oHorario, Resultado.getDate("Fecha"));
            ListaRTA.put(aux.getIdFuncion(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}