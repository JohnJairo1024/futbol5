package Datos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Futbol5BD {

	private Connection Conexion = null;
	private Statement Sentencia;
	private ResultSet Resultado;

	public Futbol5BD() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
		}
	}

	public Connection getConexion() throws SQLException {
		return Conexion;
	}

	public void Conectar() throws SQLException, Exception {					
	    try {
	    	Conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol", "root", "root");
			Conexion.setAutoCommit(false);
	    }
	    catch (Exception e) {
	        //es mejor tener todo el stacktrace del error
	        //no solo el mensaje
	        //System.out.println(e);
	        e.printStackTrace(System.out);
	    }
	}

	public void Desconectar() {
		try {
			Conexion.setAutoCommit(true);
			Conexion.close();
		} catch (SQLException e) {
			
		} finally{				
			
		}
	}

	public int Actualizar(PreparedStatement sentencia) throws Exception {
		try {
			int res = sentencia.executeUpdate();
			return res;
		} catch (SQLException e) {
			throw new Exception(
					"Error al ejecutar sentencia \n codigo" + e.getErrorCode() + "Explicacion:" + e.getMessage());
		}
	}

	public ResultSet Consultar(PreparedStatement sentencia) throws Exception {
		try {
			ResultSet rows = sentencia.executeQuery();
			return rows;
		} catch (SQLException e) {
			throw new SQLException("Error al ejecutar consulta" + e.getMessage());
		}
	}

	public PreparedStatement CrearSentencia(String sql) throws Exception {
		try {
			Conectar();
			PreparedStatement s = getConexion().prepareStatement(sql);
			return s;
		} catch (SQLException e) {

			throw new SQLException(
					"Error al ejecutar sentencia \n codigo" + e.getErrorCode() + "Explicacion:" + e.getMessage());
		}

	}

	public void EjecutarSentencia(String sql) throws Exception {
		Conectar();
		Sentencia = Conexion.createStatement();
		Sentencia.execute(sql);
		Desconectar();
	}
}
