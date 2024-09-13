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
import static others.Queries.INSERT_DISTRIBUIDOR_QUERY;
import static others.Queries.DELETE_DISTRIBUIDOR_QUERY;
import static others.Queries.READ_DISTRIBUIDOR_QUERY;
import static others.Queries.UPDATE_DISTRIBUIDOR_QUERY;



public class distribuidorRepository {
    DBConnection connection;

    public distribuidorRepository(DBConnection connection) {
        this.connection = connection;
    }
    
    
    public int save(distribuidorEntity entity) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(INSERT_DISTRIBUIDOR_QUERY);

            callableStatement.setString(1, entity.getNombre());
            callableStatement.setString(2, entity.getCorreo());
            callableStatement.setInt(3, entity.getTelefono());
            callableStatement.executeUpdate();
           
            connection.desconectar();
            System.out.println("Distribuidor agregado.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());

            return -1;
        }
    }
    
    public int delete(int entityID) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(DELETE_DISTRIBUIDOR_QUERY);

            callableStatement.setInt(1, entityID);
            callableStatement.executeUpdate();
            
            connection.desconectar();
            System.out.println("Distribuidor eliminado con éxito.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            
            return -1;
        }
    }

    public int update(distribuidorEntity entity) {

        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(UPDATE_DISTRIBUIDOR_QUERY);

            callableStatement.getInt("id");
            callableStatement.getString("nombre");
            callableStatement.getString("correo");
            callableStatement.getInt("telefono");
            callableStatement.executeUpdate();
            
            connection.desconectar();
            System.out.println("Distribuidor actualizado con éxito.\n");
            
            return 0;
            
        } catch (SQLException e) {
            System.out.print(e.getMessage());
            
            return -1;
        }
    }
   
    public List<distribuidorEntity> read(int entityID) {
        try (Connection connect = this.connection.conectar()) {
            CallableStatement callableStatement = connect.prepareCall(READ_DISTRIBUIDOR_QUERY);

            callableStatement.setInt(1, entityID);
            callableStatement.registerOutParameter(2, OracleTypes.CURSOR);
            callableStatement.executeUpdate();
            
            ResultSet detallesDistribuidor = (ResultSet) callableStatement.getObject(2);
            List<distribuidorEntity> distribuidor = new ArrayList<>();

            while(detallesDistribuidor.next()){
                distribuidorEntity actual = new distribuidorEntity(detallesDistribuidor.getInt("id"),
                    detallesDistribuidor.getString("nombre"),
                    detallesDistribuidor.getString("correo"),
                    detallesDistribuidor.getInt("telefono")
                );
                distribuidor.add(actual);
            }
            
            callableStatement.close();
            connection.desconectar();
            
            return distribuidor;
        
        } catch (SQLException e) {
            System.out.print(e.getMessage());
            
            return null;
        }  
    }
}