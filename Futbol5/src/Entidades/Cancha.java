package Entidades;

public class Cancha {
	private int IdCancha;
	private String Nombre;
	private String Descripcion;
	private String Ubicacion;
	private String poster;
	private int IdVideo;

	public int getIdCancha() {
		return IdCancha;
	}

	public void setIdCancha(int IdCancha) {
		this.IdCancha = IdCancha;
	}

	public String getNombre() {
		return Nombre;
	}

	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}

	public String getDescripcion() {
		return Descripcion;
	}

	public void setDescripcion(String Descripcion) {
		this.Descripcion = Descripcion;
	}

	public String getUbicacion() {
		return Ubicacion;
	}

	public void setUbicacion(String Ubicacion) {
		this.Ubicacion = Ubicacion;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public int getIdVideo() {
		return IdVideo;
	}

	public void setIdVideo(int IdVideo) {
		this.IdVideo = IdVideo;
	}

	public Cancha() {

	}

	public Cancha(int IdCancha, String Nombre, String Descripcion,
			String Ubicacion, String poster, int Idvideo) {
		setIdCancha(IdCancha);
		setNombre(Nombre);
		setDescripcion(Descripcion);
		setUbicacion(Ubicacion);
		setPoster(poster);
		setIdVideo(Idvideo);
	}
}
