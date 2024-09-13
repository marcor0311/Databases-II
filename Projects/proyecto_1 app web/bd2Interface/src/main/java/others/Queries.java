package others;

public class Queries {
    //User
    public static final String LOGIN_USER_QUERY = "select * from Usuario where Nombre_usuario = ? and Contrasena = ?";

    
    //Productos
    public static final String READ_PRODUCTO_QUERY = "{call read_consultas.select_producto (?, ?)}";

    public static final String INSERT_PRODUCTO_QUERY = "{call consultas_CRUD.create_producto (?, ?, ?, ?, ?)}";
    public static final String UPDATE_PRODUCTO_QUERY = "{call consultas_CRUD.update_producto (?, ?, ?, ?, ?, ?)}";
    public static final String DELETE_PRODUCTO_QUERY = "{call consultas_CRUD.delete_producto (?)}";
    
    
    //Distribuidores
    public static final String READ_DISTRIBUIDOR_QUERY = "{call read_consultas.select_distribuidor (?, ?)}";
    
    public static final String INSERT_DISTRIBUIDOR_QUERY = "{call consultas_CRUD.create_distribuidor (?, ?, ?)}";
    public static final String UPDATE_DISTRIBUIDOR_QUERY = "{call consultas_CRUD.update_distribuidor (?, ?, ?, ?)}";
    public static final String DELETE_DISTRIBUIDOR_QUERY = "{call consultas_CRUD.delete_distribuidor (?)}";

    
    //Transaccional
    public static final String READ_TRANSACCION_QUERY = "{call read_consultas.select_orden_producto (?, ?, ?)}";
    
    public static final String INSERT_TRANSACCION_QUERY = "{call consultas_CRUD.create_orden_producto (?, ?, ?, ?)}";
    public static final String UPDATE_TRANSACCION_QUERY = "{call consultas_CRUD.update_orden_producto (?, ?, ?, ?)}";
    public static final String DELETE_TRANSACCION_QUERY = "{call consultas_CRUD.cancel_orden_producto (?, ?)}";
}
