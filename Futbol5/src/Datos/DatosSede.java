package Datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Hashtable;
import java.util.Map;

import Entidades.Sede;

public class DatosSede extends Futbol5BD {

	public void agregarSede(Sede oSede) throws Exception {
		if (oSede != null) {
			Conectar();
			String sql = "INSERT INTO sede (Nombre, Zona, Punto) VALUES ('" + oSede.getNombre() + "','" + oSede.getZona() + "','" + oSede.getPunto() + "')";
			EjecutarSentencia(sql);
			Desconectar();
		}
	}

	public void modificarSede(Sede oSede) throws Exception {
		if (oSede != null) {
			Conectar();
			String sql = "UPDATE sede SET Nombre = '" + oSede.getNombre() + "' WHERE IdSede = " + oSede.getIdSede();
			EjecutarSentencia(sql);
			Desconectar();
		}
	}

	public void eliminarSede(int IdSede) throws Exception {
		Conectar();
		String sql = "DELETE FROM sede WHERE IdSede = " + IdSede;
		EjecutarSentencia(sql);
		Desconectar();
	}

	public Sede buscarSede(int IdSede) throws Exception {
		Sede aux = null;
		String sql = "SELECT * FROM sede WHERE IdSede = " + IdSede;
		PreparedStatement s = CrearSentencia(sql);		
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			aux = new Sede(Resultado.getInt("IdSede"), Resultado.getString("Nombre"), Resultado.getInt("Punto"), Resultado.getInt("Zona"));
		}

		Desconectar();

		return aux;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Hashtable listarSede() throws Exception {
		Hashtable listarsede = new Hashtable();
		Sede aux;
		String sql = "SELECT * FROM sede WHERE Estado = 1 order by nombre";
		Conectar();
		PreparedStatement s = CrearSentencia(sql);
		ResultSet resultado = Consultar(s);		
		
		while (resultado.next()) {
			aux = new Sede(resultado.getInt("IdSede"), resultado.getString("Nombre"), resultado.getInt("Punto"), resultado.getInt("Zona"));
			listarsede.put(aux.getIdSede(), aux);
		}

		Desconectar();

		return listarsede;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Hashtable ListarSalasCapacidad(int Zona) throws SQLException, ClassNotFoundException, Exception {
		Hashtable ListaRTA = new Hashtable();
		Sede aux = null;
		String sql = "SELECT * FROM sede WHERE Estado = 1 AND CantidadButacas > " + Zona;
		Conectar();
		PreparedStatement s = CrearSentencia(sql);
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			aux = new Sede(Resultado.getInt("IdSede"), Resultado.getString("Nombre"), Resultado.getInt("Punto"), Resultado.getInt("Zona"));
			ListaRTA.put(aux.getIdSede(), aux);
		}

		Desconectar();

		return ListaRTA;
	}
}
