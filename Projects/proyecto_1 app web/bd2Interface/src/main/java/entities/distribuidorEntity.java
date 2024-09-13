package entities;


public class distribuidorEntity {
    private int id;
    private String nombre;
    private String correo;
    private int telefono;

    //constructores
    public distribuidorEntity(int id, String nombre, String correo, int telefono){
        this.id = id;
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
    }

    public distribuidorEntity(String nombre, String correo, int telefono){
        this.nombre = nombre;
        this.correo = correo;
        this.telefono = telefono;
    }
    //Seters y Geters
    //Id
    public int getId(){
        return id;
    }
    public void setId(int id){
       this.id = id;
    }

    //nombre
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    //correo
    public String getCorreo(){
        return correo;
    }
    public void setCorreo(String correo){
        this.correo = correo;
    }

    //teléfono
    public int getTelefono(){
        return telefono;
    }
    public void setTelefono(int telefono){
        this.telefono = telefono;
    }
}