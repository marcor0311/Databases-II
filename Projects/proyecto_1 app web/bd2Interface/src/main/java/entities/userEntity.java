package entities;


public class userEntity {
    private int id;
    private String nombre;
    private String contrasena;

    //constructores
    public userEntity(int id, String nombre, String contrasena){
        this.id = id;
        this.nombre = nombre;
        this.contrasena = contrasena;
    }

    public userEntity(String nombre, String contrasena){
        this.nombre = nombre;
        this.contrasena = contrasena;
    }
    
    //Seters y Geters
    //Id usario
    public int getId(){
        return id;
    }
    public void setId(int id){
       this.id = id;
    }

    //Nombre usuario
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
       this.nombre = nombre;
    }

    //Contraseña del usuario
    public String getContrasena(){
        return contrasena;
    }
    public void setContrasena(String contrasena){
        this.contrasena = contrasena;
    }
}