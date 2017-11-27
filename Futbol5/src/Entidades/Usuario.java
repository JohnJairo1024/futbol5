package Entidades;

public class Usuario
{

    private int IdEspectador;
    private String Nombre;
    private String Apellido;
    private String DNI;
    private String Usuario;
    private String Password;
    private String Tipo;
    private int Total;

    public int getIdEspectador()
    {
        return IdEspectador;
    }

    public void setIdEspectador(int IdEspectador)
    {
        this.IdEspectador = IdEspectador;
    }

    public String getNombre()
    {
        return Nombre;
    }

    public void setNombre(String Nombre)
    {
        this.Nombre = Nombre;
    }

    public String getApellido()
    {
        return Apellido;
    }

    public void setApellido(String Apellido)
    {
        this.Apellido = Apellido;
    }

    public String getDNI()
    {
        return DNI;
    }

    public void setDNI(String DNI)
    {
        this.DNI = DNI;
    }

    public String getUsuario()
    {
        return Usuario;
    }

    public void setUsuario(String Usuario)
    {
        this.Usuario = Usuario;
    }

    public String getPassword()
    {
        return Password;
    }

    public void setPassword(String Password)
    {
        this.Password = Password;
    }

    public String getTipo()
    {
        return Tipo;
    }

    public void setTipo(String Tipo)
    {
        this.Tipo = Tipo;
    }  
    
    public int getTotal() {
		return Total;
	}
	
	public void setTotal(int total) {
		this.Total = total;
	}

    public Usuario()
    {
    }
    
    public Usuario(int IdEspectador, String Nombre, String Apellido, String DNI, int Total)
    {
    		setIdEspectador(IdEspectador);
    		setNombre(Nombre);
        setApellido(Apellido);
        setDNI(DNI);      
        setTotal(Total);
    }

    public Usuario(String Usuario, String Password, String Nombre, String Apellido, String DNI, String Tipo)
    {
        setUsuario(Usuario);
        setPassword(Password);
        setNombre(Nombre);
        setApellido(Apellido);
        setDNI(DNI);      
        setTipo(Tipo);
    }

    public Usuario(int IdEspectador, String Usuario, String Password, String Nombre, String Apellido, String DNI, String Tipo)
    {
        setIdEspectador(IdEspectador);
        setUsuario(Usuario);
        setPassword(Password);
        setNombre(Nombre);
        setApellido(Apellido);
        setDNI(DNI);
        setTipo(Tipo);
    }
}
