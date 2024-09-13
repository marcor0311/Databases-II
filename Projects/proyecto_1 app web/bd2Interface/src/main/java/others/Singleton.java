package others;


public class Singleton {
    private static DBConnection dateBaseConnection;
    
    private Singleton(){  
    }
    
    public static DBConnection getDBConnection(){
        if (dateBaseConnection== null){
            dateBaseConnection = new DBConnection();
        }
        
        return dateBaseConnection;
    }
}