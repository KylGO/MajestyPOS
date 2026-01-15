package projetdeux;

import java.sql.*;

import javax.swing.table.DefaultTableModel;


public class categorieDAO {
	public static DefaultTableModel getTableCategorie(String query) {
		DefaultTableModel model = new DefaultTableModel();
		model.addColumn("idCategorie");
		model.addColumn("nom");
		model.addColumn("description");
		model.addColumn("idCarte");
		
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				Object[] ligne = new Object[4];
				ligne[0] = rs.getString("idCategorie");
				ligne[1] = rs.getString("nom");
				ligne[2] = rs.getString("description");
				ligne[3] = rs.getString("idCarte");
				model.addRow(ligne);

				System.out.println(""+rs.getString("idCategorie"));
				System.out.println(""+rs.getString("nom"));
				
				System.out.println(""+rs.getString("description"));
				System.out.println(""+rs.getString("idCarte"));
				
			}
			stmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return model;
	}
	public static void RequeteTableCategorie(String requete) {
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			int result = stmt.executeUpdate(requete);
		} catch(SQLException e) {
			e.printStackTrace();
			
		}
	}

}
