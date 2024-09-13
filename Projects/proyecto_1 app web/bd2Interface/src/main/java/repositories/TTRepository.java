package repositories;


import java.util.List;
import java.util.ArrayList; 

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;

import oracle.jdbc.OracleTypes;

import entities.*;
import others.DBConnection;
import static others.Queries.INSERT_TRANSACCION_QUERY;
import static others.Queries.DELETE_TRANSACCION_QUERY;
import static others.Queries.READ_TRANSACCION_QUERY;
import static others.Queries.UPDATE_TRANSACCION_QUERY;



public class TTRepository {
    DBConnection connection;

    public TTRepository(DBConnection connection) {
        this.connection = connection;
    }
    
    
    public int save(TTEntity entity) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(INSERT_TRANSACCION_QUERY);

            callableStatement.setInt(1, entity.getIdOrd());
            callableStatement.setInt(2, entity.getIdProducto());
            callableStatement.setInt(3, entity.getCantidad());
            callableStatement.executeUpdate();
           
            connection.desconectar();
            System.out.println("Transacción agregado.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());

            return -1;
        }
    }
    
    public int delete(int entityID) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(DELETE_TRANSACCION_QUERY);

            callableStatement.setInt(1, entityID);
            callableStatement.executeUpdate();
            
            connection.desconectar();
            System.out.println("Transacción cancelada con éxito.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            
            return -1;
        }
    }

    public int update(TTEntity entity) {
        
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(UPDATE_TRANSACCION_QUERY);

            callableStatement.getInt("idOrd");
            callableStatement.getInt("idOrd");
            callableStatement.getInt("cantidad");
            callableStatement.executeUpdate();
            
            connection.desconectar();
            System.out.println("Transacción actualizada con éxito.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.print(e.getMessage());
            
            return -1;
        }
    }
   
    public List<TTEntity> read(int entityID) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(READ_TRANSACCION_QUERY);

            callableStatement.setInt(1, entityID);
            callableStatement.registerOutParameter(2, OracleTypes.CURSOR);
            callableStatement.executeUpdate();
            
            ResultSet detallesTransaccion = (ResultSet) callableStatement.getObject(2);
            List<TTEntity> transaccion = new ArrayList<>();

            while(detallesTransaccion.next()){
                TTEntity actual = new TTEntity(detallesTransaccion.getInt("idOrd"),
                    detallesTransaccion.getInt("idProducto"),
                    detallesTransaccion.getInt("cantidad")
                );
                transaccion.add(actual);
            }
            
            callableStatement.close();
            connection.desconectar();
            
            return transaccion;
        
        } catch (SQLException e) {
            System.out.print(e.getMessage());
            
            return null;
        }  
    }
}