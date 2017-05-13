package Datos;

import Entidades.Usuario;
import Entidades.Funcion;
import Entidades.Cancha;
import Entidades.Reserva;
import Entidades.Sede;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Hashtable;

public class DatosReservas extends Futbol5BD {
	private DatosUsuario oDatosEspectadores = new DatosUsuario();
	private DatosEntrada oDatosEntrada = new DatosEntrada();

	public void AgregarReserva(Reserva oReserva)
			throws SQLException, ClassNotFoundException, Exception {
		if (oReserva != null) {
			String sql = "INSERT INTO Reservas (Horario, IdFuncion, IdSede, IdCancha, IdUsuario, Nombre, Fecha, Precio) VALUES ('"
					+ oReserva.getoFuncion().getoHorario().getHorario() + "','"
					+ oReserva.getoFuncion().getIdFuncion() + "','"
					+ oReserva.getoFuncion().getoSede().getIdSede() + "','"
					+ oReserva.getoFuncion().getoCancha().getIdCancha() + "','"
					+ oReserva.getoEspectador().getIdEspectador() + "','"
					+ oReserva.getNombre() + "','"
					+ oReserva.getoFuncion().getFecha() + "','"
					+ oReserva.getPrecio() + "')";
			Conectar();
			EjecutarSentencia(sql);
			Desconectar();
		}
	}

	public void ModificarReserva(Reserva oReserva)
			throws SQLException, ClassNotFoundException, Exception {
		if (oReserva != null) {
			String sql = "UPDATE Reservas SET Horario = '"
					+ oReserva.getoFuncion().getoHorario().getHorario()
					+ "', IdFuncion = '" + oReserva.getoFuncion().getIdFuncion()
					+ "', IdSede = "
					+ oReserva.getoFuncion().getoSede().getIdSede()
					+ "', IdCancha = "
					+ oReserva.getoFuncion().getoCancha().getIdCancha()
					+ "', IdUsuario = "
					+ oReserva.getoEspectador().getIdEspectador()
					+ "', Nombre = " + oReserva.getNombre()
					+ "', FechaReserva = " + oReserva.getFecha() + "', Fecha = "
					+ oReserva.getoFuncion().getFecha() + "', Precio = "
					+ oReserva.getPrecio() + " WHERE IdReserva = "
					+ oReserva.getIdReserva();
			Conectar();
			EjecutarSentencia(sql);
			Desconectar();
		}
	}

	public void EliminarReserva(int IdReserva)
			throws SQLException, ClassNotFoundException, Exception {
		String sql = "DELETE FROM Reservas WHERE IdReserva = "
				+ IdReserva;
		Conectar();
		EjecutarSentencia(sql);
		Desconectar();
	}

	public Reserva BuscarReserva(int IdReserva)
			throws SQLException, ClassNotFoundException, Exception {
		Reserva aux = null;
		String sql = "SELECT * FROM Reservas WHERE IdReserva = " + IdReserva;
		PreparedStatement s = CrearSentencia(sql);
		System.out.println(sql);
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			Funcion oFuncion = oDatosEntrada
					.BuscarFuncion(Resultado.getInt("IdFuncion"));
			Usuario oEspectador = oDatosEspectadores
					.BuscarEspectador(Resultado.getInt("IdUsuario"));
			aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion,
					oEspectador, Resultado.getString("Nombre"),
					Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
		}

		Desconectar();

		return aux;
	}

	public Hashtable ListarReservas()
			throws SQLException, ClassNotFoundException, Exception {
		Hashtable ListaRTA = new Hashtable();
		Reserva aux = null;
		String sql = "SELECT * FROM Reservas WHERE Estado = 1";
		PreparedStatement s = CrearSentencia(sql);
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			Funcion oFuncion = oDatosEntrada
					.BuscarFuncion(Resultado.getInt("IdFuncion"));
			Usuario oEspectador = oDatosEspectadores
					.BuscarEspectador(Resultado.getInt("IdUsuario"));
			aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion,
					oEspectador, Resultado.getString("Nombre"),
					Resultado.getDate("FechaReserva"),
					Resultado.getDouble("Precio"));
			ListaRTA.put(aux.getIdReserva(), aux);
		}

		Desconectar();

		return ListaRTA;
	}

//	public void CaducarReservas()
//			throws SQLException, ClassNotFoundException, Exception {
//		Date fechaactual = new Date();
//		Calendar c = new GregorianCalendar();
//		int mes = c.get(Calendar.MONTH);
//		String fecha = Integer.toString(c.get(Calendar.YEAR)) + "-" + (mes + 1)
//				+ "-" + Integer.toString(c.get(Calendar.DATE));
//		String sql = "UPDATE Reservas SET Estado = 0 WHERE Fecha < " + fecha;
//		Conectar();
//		EjecutarSentencia(sql);
//		Desconectar();
//	}

	public Hashtable ListarReservasEspectador(Usuario oEspectadors)
			throws SQLException, ClassNotFoundException, Exception {
		Hashtable ListaRTA = new Hashtable();
		Reserva aux = null;
		String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdUsuario = "
				+ oEspectadors.getIdEspectador();
		PreparedStatement s = CrearSentencia(sql);
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			Funcion oFuncion = oDatosEntrada
					.BuscarFuncion(Resultado.getInt("IdFuncion"));
			Usuario oEspectador = oDatosEspectadores
					.BuscarEspectador(Resultado.getInt("IdUsuario"));
			aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion,
					oEspectador, Resultado.getString("Nombre"),
					Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
			ListaRTA.put(aux.getIdReserva(), aux);
		}

		Desconectar();

		return ListaRTA;
	}

	public Hashtable ListarReservasPelicuka(Cancha oCancha)
			throws SQLException, ClassNotFoundException, Exception {
		Hashtable ListaRTA = new Hashtable();
		Reserva aux = null;
		String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdCancha = "
				+ oCancha.getIdCancha();
		PreparedStatement s = CrearSentencia(sql);
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			Funcion oFuncion = oDatosEntrada
					.BuscarFuncion(Resultado.getInt("IdFuncion"));
			Usuario oEspectador = oDatosEspectadores
					.BuscarEspectador(Resultado.getInt("IdUsuario"));
			aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion,
					oEspectador, Resultado.getString("Nombre"),
					Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
			ListaRTA.put(aux.getIdReserva(), aux);
		}

		Desconectar();

		return ListaRTA;
	}

	public Hashtable ListarReservasSala(Sede oSala)
			throws SQLException, ClassNotFoundException, Exception {
		Hashtable ListaRTA = new Hashtable();
		Reserva aux = null;
		String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdSede = "
				+ oSala.getIdSede();
		PreparedStatement s = CrearSentencia(sql);
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			Funcion oFuncion = oDatosEntrada
					.BuscarFuncion(Resultado.getInt("IdFuncion"));
			Usuario oEspectador = oDatosEspectadores
					.BuscarEspectador(Resultado.getInt("IdUsuario"));
			aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion,
					oEspectador, Resultado.getString("Nombre"),
					Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
			ListaRTA.put(aux.getIdReserva(), aux);
		}

		Desconectar();

		return ListaRTA;
	}

	public Hashtable ListarReservasFuncion(Funcion oFuncions)
			throws SQLException, ClassNotFoundException, Exception {
		Hashtable ListaRTA = new Hashtable();
		Reserva aux = null;
		String sql = "SELECT * FROM Reservas WHERE Estado = 1 AND IdFuncion = "
				+ oFuncions.getIdFuncion();
		PreparedStatement s = CrearSentencia(sql);
		ResultSet Resultado = Consultar(s);

		while (Resultado.next()) {
			Funcion oFuncion = oDatosEntrada
					.BuscarFuncion(Resultado.getInt("IdFuncion"));
			Usuario oEspectador = oDatosEspectadores
					.BuscarEspectador(Resultado.getInt("IdUsuario"));
			aux = new Reserva(Resultado.getInt("IdReserva"), oFuncion,
					oEspectador, Resultado.getString("Nombre"),
					Resultado.getDate("Fecha"), Resultado.getDouble("Precio"));
			ListaRTA.put(aux.getIdReserva(), aux);
		}

		Desconectar();

		return ListaRTA;
	}
}
