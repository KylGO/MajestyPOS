package projetdeux;

import java.sql.*;

import javax.swing.table.DefaultTableModel;

public class generalDAO {
	public static DefaultTableModel getTable(String query) {
		
		DefaultTableModel model = new DefaultTableModel();

		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			ResultSetMetaData meta = rs.getMetaData();
			int nbr_col = meta.getColumnCount();
			for(int i = 1;i <= nbr_col; i++) {
				model.addColumn(meta.getColumnName(i));
			}
			while(rs.next()) {
				Object[] ligne = new Object[nbr_col];
				for(int i = 0;i< nbr_col;i++) {
					ligne[i] = rs.getObject(i+1);
				}
				model.addRow(ligne);
				
			}
			stmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return model;
	}

	public static void RequeteTable(String requete) {
		try {
			Connection cn = ConnectionBDD.getConnection();
			Statement stmt = cn.createStatement();
			int result = stmt.executeUpdate(requete);
		} catch(SQLException e) {
			e.printStackTrace();
			
		}
	}

}
