package pokemon;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DBConnection {
	public static Connection getConnection() {
		
    	System.out.println("Inside in Connection method");
    	Connection connection=null;
    	try {
    		//Change 
    		Class.forName(DBInfo.DRIVER_CLASS);
    		connection=DriverManager.getConnection(DBInfo.URL ,DBInfo.USERNAME ,DBInfo.PASSWORD);
    		System.out.println("getting Maffooz Connection** "+connection+" at time "+DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss").format(LocalDateTime.now()));
    		if(connection!=null) System.out.println("you're Connected to Pokemon");
    	
    	}catch(SQLException sql) {
    		sql.printStackTrace();
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return connection;
    }
}
