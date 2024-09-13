package entities;


public class productoEntity {
    private int id;
    private String nombre;
    private String descripcion;
    private int precio;
    private int cantidad;
    private int idDis;

    //constructores
    public productoEntity(int id, String nombre, String descripcion, int precio, int cantidad, int idDis){
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
        this.idDis = idDis;
    }

    public productoEntity(String nombre, String descripcion, int precio, int cantidad, int idDis){
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cantidad = cantidad;
        this.idDis = idDis;
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

    //descripcion
    public String getDescripcion(){
        return descripcion;
    }
    public void setDescripcion(String descripcion){
        this.descripcion = descripcion;
    }

    //precio
    public int getPrecio(){
        return precio;
    }
    public void setPrecio(int precio){
        this.precio = precio;
    }
    
    //cantidad
    public int getCantidad(){
        return cantidad;
    }
    public void setCantidad(int cantidad){
        this.cantidad = cantidad;
    }
    
    //id Distribuidor
    public int getIdDis(){
        return precio;
    }
    public void setIdDis(int idDis){
        this.idDis = idDis;
    }
}