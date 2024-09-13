package others;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import repositories.*;


public class DBConnection {
 
    private boolean open;
    
    private Connection conexion;
   
    private TTRepository ttRepo;
    private distribuidorRepository disRepo;
    private productoRepository prodRepo; 
    private userRepository userRepo;
    

    /*<%-- Base de Datos --%>*/
    //Open
    public boolean isOpen() {
        return open;
    }
    
    public void setOpen(boolean open) {
        this.open = open;
    }
    
    //Conection
    public Connection conectar() {
        if (open) {
            return conexion;
        } else {
            openConnection();
            this.open = true;
            
            return this.conexion;
        }
    }
    
    public void desconectar() {
        try {
            if (conexion != null && !conexion.isClosed()) {
                this.conexion.close();
                this.open = false;
            }
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void openConnection() {
        String url = "jdbc:oracle:thin:@siuadb1_high?TNS_ADMIN=C:/wall";
        String user = "JBENAVIDES";
        String password = "bdAlajuela2023s2";
        
        try {
            Properties prop = new Properties();
            prop.setProperty("user", user);
            prop.setProperty("password", password);

            Class.forName("oracle.jdbc.OracleDriver");
            conexion = DriverManager.getConnection(url, prop);
            this.conexion = conexion;

            System.out.println("Conexion Correcta");

        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    
    /*<%-- TABLAS --%>*/
    //Producto
    public productoRepository getProdRepo() {
        return prodRepo;
    }
    public void setProductoRepo(productoRepository prodRepo) {
        this.prodRepo = prodRepo;
    }
    
    //Distribuidor
    public distribuidorRepository getDisRepo() {
        return disRepo;
    }
    public void setDisRepo(distribuidorRepository disRepo) {
        this.disRepo = disRepo;
    }

    //Transacción
    public TTRepository getTTRepo() {
        return ttRepo;
    }
    public void setTTRepo(TTRepository ttRepo) {
        this.ttRepo = ttRepo;
    }
    
    //User
    public userRepository getUserRepo() {
        return userRepo;
    }
    public void setUserRepo(userRepository userRepo) {
        this.userRepo = userRepo;
    }
    
    
   /*<%-- Ejecutar --%>*/
    private void init() {
        this.prodRepo = new productoRepository(this);
        this.disRepo = new distribuidorRepository(this);
        this.ttRepo = new TTRepository(this);
        //this.userRepo = new userRepository(this);
    }

    public DBConnection() {
        String url = "jdbc:oracle:thin:@siuadb1_high?TNS_ADMIN=C:\\Wallet_siuadb1";
        String user = "JBENAVIDES";
        String password = "bdAlajuela2023s2";

        Connection conexion = null;

        try {
            Properties prop = new Properties();
            prop.setProperty("user", user);
            prop.setProperty("password", password);

            Class.forName("oracle.jdbc.OracleDriver");
            conexion = DriverManager.getConnection(url, prop);
            this.conexion = conexion;
            init();
            System.out.println("Se conectó exitosamente.\n");
            
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            
        } finally {
            try {
                if (conexion != null && !conexion.isClosed()) {
                    conexion.close();
                }
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }
}
