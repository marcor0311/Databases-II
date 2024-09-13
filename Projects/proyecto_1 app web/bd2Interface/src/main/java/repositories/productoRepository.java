package repositories;


import java.io.Serializable;

import java.util.List;
import java.util.Optional;
import java.util.ArrayList; 

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;

import oracle.jdbc.OracleTypes;

import entities.*;
import others.DBConnection;
import static others.Queries.INSERT_PRODUCTO_QUERY;
import static others.Queries.DELETE_PRODUCTO_QUERY;
import static others.Queries.READ_PRODUCTO_QUERY;
import static others.Queries.UPDATE_PRODUCTO_QUERY;



public class productoRepository {
    DBConnection connection;

    public productoRepository(DBConnection connection) {
        this.connection = connection;
    }
    
    
    public int save(productoEntity entity) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(INSERT_PRODUCTO_QUERY);

            callableStatement.setString(1, entity.getNombre());
            callableStatement.setString(2, entity.getDescripcion());
            callableStatement.setInt(3, entity.getPrecio());
            callableStatement.setInt(4, entity.getCantidad());
            callableStatement.setInt(5, entity.getIdDis());
            callableStatement.executeUpdate();
           
            connection.desconectar();
            System.out.println("Producto agregado.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());

            return -1;
        }
    }
    
    public int delete(int entityID) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(DELETE_PRODUCTO_QUERY);

            callableStatement.setInt(1, entityID);
            callableStatement.executeUpdate();
            
            connection.desconectar();
            System.out.println("Producto eliminado con éxito.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            
            return -1;
        }
    }

    public int update(productoEntity entity) {

        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(UPDATE_PRODUCTO_QUERY);

            callableStatement.getInt("id");
            callableStatement.getString("nombre");
            callableStatement.getString("descripcion");
            callableStatement.getInt("precio");
            callableStatement.getInt("cantidad");
            callableStatement.getInt("idDis");
            callableStatement.executeUpdate();
            
            connection.desconectar();
            System.out.println("Producto actualizado con éxito.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.print(e.getMessage());
            
            return -1;
        }
    }
   
    public List<productoEntity> read(int entityID) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(READ_PRODUCTO_QUERY);

            callableStatement.setInt(1, entityID);
            callableStatement.registerOutParameter(2, OracleTypes.CURSOR);
            callableStatement.executeUpdate();
            
            ResultSet detallesProducto = (ResultSet) callableStatement.getObject(2);
            List<productoEntity> producto = new ArrayList<>();

            while(detallesProducto.next()){
                productoEntity actual = new productoEntity(detallesProducto.getInt("id"),
                    detallesProducto.getString("nombre"),
                    detallesProducto.getString("descripcion"),
                    detallesProducto.getInt("precio"),
                    detallesProducto.getInt("cantidad"),
                    detallesProducto.getInt("idDis")
                );
                producto.add(actual);
            }
            
            callableStatement.close();
            connection.desconectar();
            
            return producto;
        
        } catch (SQLException e) {
            System.out.print(e.getMessage());
            
            return null;
        }  
    } 
}