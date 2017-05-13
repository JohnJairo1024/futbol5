package Entidades;

import java.util.Date;

public class Funcion
{

    private int IdFuncion;
    private Sede oSede;
    private Cancha oCancha;
    private Horario oHorario;
    private Date Fecha;

    public int getIdFuncion()
    {
        return IdFuncion;
    }

    public void setIdFuncion(int IdFuncion)
    {
        this.IdFuncion = IdFuncion;
    }

    public Sede getoSede()
    {
        return oSede;
    }

    public void setoSede(Sede oSede)
    {
        this.oSede = oSede;
    }

    public Cancha getoCancha()
    {
        return oCancha;
    }

    public void setoCancha(Cancha oCancha)
    {
        this.oCancha = oCancha;
    }

    public Horario getoHorario()
    {
        return oHorario;
    }

    public void setoHorario(Horario oHorario)
    {
        this.oHorario = oHorario;
    }

    public Date getFecha()
    {
        return Fecha;
    }

    public void setFecha(Date Fecha)
    {
        this.Fecha = Fecha;
    }

    public Funcion()
    {
    }

    public Funcion(Sede oSede, Cancha oCancha, Horario oHorario, Date Fecha)
    {        
        setoSede(oSede);
        setoCancha(oCancha);
        setoHorario(oHorario);
        setFecha(Fecha);
    }
    
    public Funcion(int IdFuncion, Sede oSede, Cancha oCancha, Horario oHorario, Date Fecha)
    {
        setIdFuncion(IdFuncion);
        setoSede(oSede);
        setoCancha(oCancha);
        setoHorario(oHorario);
        setFecha(Fecha);
    }
}