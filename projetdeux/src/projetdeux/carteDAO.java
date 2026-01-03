package projetdeux;

import java.sql.*;

import javax.swing.table.DefaultTableModel;

public class carteDAO {
	public static DefaultTableModel getTableCartes() {
		System.out.println("OK");

		DefaultTableModel model = new DefaultTableModel();
		model.addColumn("idCarte");
		model.addColumn("nom");
		model.addColumn("description");
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM carte");
			while(rs.next()) {
				Object[] ligne = new Object[3];
				ligne[0] = rs.getString("idCarte");
				ligne[1] = rs.getString("nom");
				ligne[2] = rs.getString("description");
				model.addRow(ligne);

				System.out.println("OK");
			}
			stmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println("OK");

		return model;
	}
	public static void addTableCarte(String requete) {
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			int result = stmt.executeUpdate(requete);
		} catch(SQLException e) {
			e.printStackTrace();
			
		}
	}
}
