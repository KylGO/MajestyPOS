package projetdeux;
import java.sql.*;
public class ConnectionBDD {
	private static Connection cn;
	
	private ConnectionBDD() {
		try {
			String url="jdbc:mysql://localhost:3306/majesty";
			String user="root";
			String password="";
			cn = DriverManager.getConnection(url,user,password);
			System.out.println("OK");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static Connection getConnection() throws SQLException{
		if(cn == null) {
			System.out.println("Erreur");
			new ConnectionBDD();
		}
		return cn;
	}

}
