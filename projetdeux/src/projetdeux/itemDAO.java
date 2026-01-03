package projetdeux;

import java.sql.*;

import javax.swing.table.DefaultTableModel;

public class itemDAO {
	public static DefaultTableModel getTableItem() {
		
		DefaultTableModel model = new DefaultTableModel();
		model.addColumn("idItem");
		model.addColumn("nom");
		model.addColumn("prix");
		model.addColumn("description");
		model.addColumn("idCategorie");
		
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM item");
			while(rs.next()) {
				Object[] ligne = new Object[5];
				ligne[0] = rs.getString("idItem");
				ligne[1] = rs.getString("nom");
				ligne[2] = rs.getString("prix");
				ligne[3] = rs.getString("description");
				ligne[4] = rs.getString("idCategorie");
				model.addRow(ligne);
				
			}
			stmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return model;
	}
	public static void addTableItem(String requete) {
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			int result = stmt.executeUpdate(requete);
		} catch(SQLException e) {
			e.printStackTrace();
			
		}
	}
	public static void deleteTableItem(String requete) {
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			int result = stmt.executeUpdate(requete);
		} catch(SQLException e) {
			e.printStackTrace();
			
		}		
	}
}
