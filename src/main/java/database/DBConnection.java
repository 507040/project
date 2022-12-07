package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static Connection getconn() throws ClassNotFoundException,SQLException{
		Connection conn=null;			
				
		String url="jdbc:mysql://localhost:3306/project?serverTimezone=Asia/Seoul";
		String user="root";
		String pass="1111";
				
		Class.forName("com.mysql.cj.jdbc.Driver");
				
		conn = DriverManager.getConnection(url, user, pass);					
				
		return conn;
	}
	
}
