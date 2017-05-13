package Entidades;

import java.util.Hashtable;

public class Sede {
	private int IdSede;
	private String Nombre;
	private int Zona;
	private int Punto;

	public int getIdSede() {
		return IdSede;
	}

	public void setIdSede(int IdSede) {
		this.IdSede = IdSede;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}

	public int getPunto() {
		return Punto;
	}

	public void setPunto(int Punto) {
		this.Punto = Punto;
	}

	public int getZona() {
		return Zona;
	}

	public void setZona(int Zona) {
		this.Zona = Zona;
	}

	public Sede() {
	}

	
	public Sede(int IdSede, String Nombre, int Punto, int Zona) {
		setIdSede(IdSede);
		setNombre(Nombre);
		setPunto(Punto);
		setZona(Zona);
	}
}
