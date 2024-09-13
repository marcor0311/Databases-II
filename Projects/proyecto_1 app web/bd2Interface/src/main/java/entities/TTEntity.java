package entities;


public class TTEntity {
    private int idOrd;
    private int idProducto;
    private int cantidad;

    //constructores
    public TTEntity(int idOrd, int idProducto, int cantidad){
        this.idOrd = idOrd;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
    }

    //Seters y Geters
    //Id Orden
    public int getIdOrd(){
        return idOrd;
    }
    public void setIdOrd(int idOrd){
       this.idOrd = idOrd;
    }

    //Id Producto
    public int getIdProducto(){
        return idProducto;
    }
    public void setIdProducto(int idProducto){
       this.idProducto = idProducto;
    }

    //Cantidad
    public int getCantidad(){
        return cantidad;
    }
    public void setCantidad(int cantidad){
        this.cantidad = cantidad;
    }
}