package projetdeux;
import java.sql.*;
public class ConnectionBDD {
	private static Connection cn;
	private static String Bdd;
	private ConnectionBDD() {
		try {
			String url="jdbc:mysql://localhost:3306/"+Bdd;
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

	public static void setBdd(String bdd) {
		Bdd = bdd;
	}



}
