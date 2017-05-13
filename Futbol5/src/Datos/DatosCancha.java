package Datos;

import Entidades.Cancha;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;

public class DatosCancha extends Futbol5BD
{
    public void AgregarCancha(Cancha oCancha) throws SQLException, ClassNotFoundException, Exception
    {
        if(oCancha != null)
        {
            String sql = "INSERT INTO cancha (Nombre, Descripcion, Ubicacion, Imagen, IdVideo) VALUES ('"
                    + oCancha.getNombre() + "','"
                    + oCancha.getDescripcion()+ "','" 
                    + oCancha.getUbicacion() + "','"
                    + oCancha.getPoster() + "','"
                    + oCancha.getIdVideo() + "')";
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }
    
    public void ModificarCancha(Cancha oCancha) throws SQLException, ClassNotFoundException, Exception
    {
        if(oCancha != null)
        {
            String sql = "UPDATE cancha SET Nombre = '" + oCancha.getNombre() 
            		+ "', Descripcion = '"  + oCancha.getDescripcion() 
            		+ "', Ubicacion = '"    + oCancha.getUbicacion() 
            		+ "', Imagen = '"       + oCancha.getPoster() 
            		+ "' WHERE IdCancha = " + oCancha.getIdCancha();
            Conectar();
            EjecutarSentencia(sql);
            Desconectar();
        }
    }
    
    public void EliminarCancha(int IdCancha) throws SQLException, ClassNotFoundException, Exception
    {
        String sql = "DELETE FROM cancha WHERE IdCancha = " + IdCancha;
        Conectar();
        EjecutarSentencia(sql);
        Desconectar();
    }
    
    public Cancha BuscarCancha(int IdCancha) throws SQLException, ClassNotFoundException, Exception
    {
        Cancha aux = null;
        String sql = "SELECT * FROM cancha WHERE IdCancha = " + IdCancha;        
        PreparedStatement s = CrearSentencia(sql);
        System.out.println(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            aux = new Cancha(Resultado.getInt("IdCancha"), Resultado.getString("Nombre"), Resultado.getString("Descripcion"), Resultado.getString("Ubicacion"), Resultado.getString("Imagen"), Resultado.getInt("IdVideo"));
        }
        
        Desconectar();

        return aux;
    }
    
    public Hashtable ListarCancha() throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Cancha aux = null;
        String sql = "SELECT * FROM cancha WHERE Estado = 1";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            aux = new Cancha(Resultado.getInt("IdCancha"), Resultado.getString("Nombre"), Resultado.getString("Descripcion"), Resultado.getString("Ubicacion"), Resultado.getString("Imagen"), Resultado.getInt("IdVideo"));
            ListaRTA.put(aux.getIdCancha(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    } 
    
    public Hashtable ListarCanchaUbicacion(String Ubicacion) throws SQLException, ClassNotFoundException, Exception
    {
        Hashtable ListaRTA = new Hashtable();
        Cancha aux = null;
        String sql = "SELECT * FROM cancha WHERE Estado = 1 AND Ubicacion = '" + Ubicacion + "'";
        Conectar();
        PreparedStatement s = CrearSentencia(sql);
        ResultSet Resultado = Consultar(s);        

        while (Resultado.next())
        {
            aux = new Cancha(Resultado.getInt("IdCancha"), Resultado.getString("Nombre"), Resultado.getString("Descripcion"), Resultado.getString("Ubicacion"), Resultado.getString("Imagen"), Resultado.getInt("IdVideo"));
            ListaRTA.put(aux.getIdCancha(), aux);
        }
        
        Desconectar();

        return ListaRTA;
    }
}
