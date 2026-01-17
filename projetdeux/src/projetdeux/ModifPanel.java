package projetdeux;
import javax.swing.border.TitledBorder;
import javax.swing.table.DefaultTableModel;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Toolkit;

import javax.swing.*;

public class ModifPanel extends JFrame{
	private String bdd = "majesty";
	
	private JTable table;
	private JPanel PanelDonne;
	private JPanel PanelAjout;
	private JPanel PanelTri;
	private String tableChoisi = "";
	
	private JTextField idCarte;
	private JTextField nomCart;
	private JTextArea descriptionCart;
		
	private JTextField idCategorie;
	private JTextField nomCate;
	private JTextArea descriptionCate;
	private JTextField idCarteCate;
	
	private JTextField idItem;
	private JTextField nomItem;
	private JTextField prixItem;
	private JTextArea descriptionItem;
	private JTextField idCategorieItem;
	private boolean tri_actif = false;
	public ModifPanel(String bdd) {
		
		ConnectionBDD.setBdd(bdd);
		
		setTitle(bdd+".sql");
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		setLayout(new BorderLayout(5,10));
		JLabel titre = new JLabel();
		titre.setText("Panel de modification de Majesty.SQL");
		titre.setFont(new Font("Serif",Font.BOLD,25));
		

		JPanel panelDonnee = new JPanel(new BorderLayout(10,15));
		panelDonnee.add(TablePanelHaut(),BorderLayout.NORTH);
		panelDonnee.add(TablePanelCentre(),BorderLayout.CENTER);
		add(titre,BorderLayout.NORTH);
		add(TablePanelGauche(),BorderLayout.WEST);
		add(panelDonnee,BorderLayout.CENTER);
		
		table.getSelectionModel().addListSelectionListener(e -> {
			int selectedRow = table.getSelectedRow();
			if(selectedRow==-1) {
				return;
			}
			DefaultTableModel model = (DefaultTableModel) table.getModel();
			
			fillfield(model,selectedRow);
		});
		setVisible(true);

		
				
	}
	private JPanel TablePanelCentre() {
		JPanel donnee = new JPanel(new BorderLayout());
		donnee.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),4)));

		table = new JTable();
		JScrollPane scroll = new JScrollPane(table);
		PanelAjout = new JPanel();
		PanelTri = new JPanel();
;
		donnee.add(PanelAjout,BorderLayout.SOUTH);
		donnee.add(scroll,BorderLayout.CENTER);
		donnee.add(PanelTri,BorderLayout.EAST);
		return donnee;
	}
	private JPanel TablePanelHaut() {
		JPanel options = new JPanel();
		options.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),4)));
		
		JButton ajout = new JButton();
		ajout.setBackground(new Color(151,206,81));

		ajout.setText("Ajouter");
		ajout.setFont(new Font("Serif",Font.BOLD,85));
		ajout.setMaximumSize(new Dimension(500,120));
		ajout.addActionListener(e -> ajouter());
		options.add(ajout,BorderLayout.NORTH);
		
		JButton modif = new JButton();
		modif.setBackground(new Color(242,245,118));
		modif.setText("Modifier");
		modif.setFont(new Font("Serif",Font.BOLD,85));
		modif.setMaximumSize(new Dimension(500,120));
		modif.addActionListener(e -> modifier());

		options.add(modif,BorderLayout.NORTH);
		
		JButton delete = new JButton();
		delete.setBackground(new Color(205,90,81));

		delete.setText("Supprimer");
		delete.setFont(new Font("Serif",Font.BOLD,85));
		delete.setMaximumSize(new Dimension(500,120));
		delete.addActionListener(e -> supprimer());

		options.add(delete,BorderLayout.NORTH);	
		
		return options;
	}
	
	private JScrollPane TablePanelGauche() {
	

		JPanel tables_panel = new JPanel();
		tables_panel.setLayout(new BoxLayout(tables_panel,BoxLayout.Y_AXIS));
		JScrollPane tables = new JScrollPane(tables_panel);

		DefaultTableModel model = new DefaultTableModel();
		model = generalDAO.getTable("SHOW tables FROM "+bdd);
		for(int i =0;i<model.getRowCount();i++) {
			String nom_table = model.getValueAt(i, 0).toString();
			JButton btn_tab = new JButton();
			btn_tab.setBackground(new Color(105,105,105));
			btn_tab.setForeground(Color.WHITE);
			btn_tab.setText(nom_table);
			btn_tab.setFont(new Font("Serif",Font.BOLD,85));
			btn_tab.setMaximumSize(new Dimension(500,120));
			btn_tab.addActionListener(e -> afficherBDD("SELECT * FROM "+nom_table,nom_table));
			tables_panel.add(Box.createVerticalStrut(25));
			

			tables_panel.add(btn_tab);	
			
		}

		tables_panel.add(Box.createHorizontalStrut(50));

		return tables;
	}
	
	private void ajouter() {

		JPanel Ajoutpanel = new JPanel();
		switch(tableChoisi) {
		case "carte":
			PanelAjout.removeAll();
			nomCart = new JTextField();
			nomCart.setPreferredSize(new Dimension(150,30));
			
			descriptionCart = new JTextArea(2,20);
			descriptionCart.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),1)));
			descriptionCart.setLineWrap(true);
			descriptionCart.setWrapStyleWord(true);
			JButton submitCart = new JButton("Ajouter");
			submitCart.setBackground(new Color(151,206,81));
			PanelAjout.add(new JLabel("Nom de la carte"));
			PanelAjout.add(nomCart);
			PanelAjout.add(new JLabel("Description"));
			PanelAjout.add(descriptionCart);
			PanelAjout.add(Box.createHorizontalStrut(30));
			PanelAjout.add(submitCart);
			PanelAjout.add(Box.createVerticalStrut(60));
			
			
			submitCart.addActionListener(e -> {
				String requete = "INSERT INTO carte(nom,description) VALUES('"+nomCart.getText()+"','"+descriptionCart.getText()+"')";

				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM carte","carte");

			}
					);
			System.out.println("1");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;

		case "categorie":
			PanelAjout.removeAll();
			nomCate = new JTextField(15);
			descriptionCate = new JTextArea(2,20);
			descriptionCate.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),1)));
			descriptionCate.setLineWrap(true);
			descriptionCate.setWrapStyleWord(true);
			idCarteCate = new JTextField(15);

			JButton submitCate = new JButton("Ajouter");
			submitCate.setBackground(new Color(151,206,81));

			PanelAjout.add(nomCate);
			PanelAjout.add(descriptionCate);
			PanelAjout.add(idCarteCate);
			PanelAjout.add(submitCate);
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitCate.addActionListener(e -> {
				String requete = "INSERT INTO categorie(nom,description,idCarte) VALUES('"+nomCate.getText()+"','"+descriptionCate.getText()+"','"+idCarteCate.getText()+"')";
				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM categorie","categorie");


			}
					);
			System.out.println("2");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;
			
		case "item":
			PanelAjout.removeAll();
			nomItem = new JTextField(15);
			prixItem = new JTextField(15);
			descriptionItem = new JTextArea(2,20);
			descriptionItem.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),1)));
			descriptionItem.setLineWrap(true);
			descriptionItem.setWrapStyleWord(true);
			idCategorieItem = new JTextField(15);
			JButton submitItem = new JButton("Ajouter");
			submitItem.setBackground(new Color(151,206,81));

			PanelAjout.add(nomItem);
			PanelAjout.add(prixItem);

			PanelAjout.add(descriptionItem);
			PanelAjout.add(idCategorieItem);

			PanelAjout.add(submitItem);
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitItem.addActionListener(e -> {
				String requete = "INSERT INTO item(nom,prix,description,idCategorie) VALUES('"+nomItem.getText()+"','"+prixItem.getText()+"','"+descriptionItem.getText()+"','"+idCategorieItem.getText()+"')";
				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM item","item");


			}
					);
			System.out.println("3");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;

		case "":
			break;
		}
	}

	private void modifier() {
		JPanel Ajoutpanel = new JPanel();
		switch(tableChoisi) {
		case "carte":
			PanelAjout.removeAll();

			idCarte = new JTextField(15);
			nomCart = new JTextField(15);
			descriptionCart = new JTextArea(2,20);
			descriptionCart.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),1)));
			descriptionCart.setLineWrap(true);
			descriptionCart.setWrapStyleWord(true);
			JButton submitCart = new JButton("Modifier");
			submitCart.setBackground(new Color(242,245,118));

			PanelAjout.add(new JLabel("Id Carte"));
			PanelAjout.add(idCarte);
			PanelAjout.add(nomCart);
			PanelAjout.add(descriptionCart);
			PanelAjout.add(submitCart);
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitCart.addActionListener(e -> {
				String requete = "UPDATE carte SET nom='"+nomCart.getText()+"', description='"+descriptionCart.getText()+"' WHERE idCarte='"+idCarte.getText()+"'";
				carteDAO.RequeteTableCarte(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM carte","carte");

			}
					);
			System.out.println("1");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;

		case "categorie":
			PanelAjout.removeAll();
			idCategorie = new JTextField(15);

			nomCate = new JTextField(15);
			descriptionCate = new JTextArea(2,20);
			descriptionCate.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),1)));
			descriptionCate.setLineWrap(true);
			descriptionCate.setWrapStyleWord(true);
			idCarteCate = new JTextField(15);

			JButton submitCate = new JButton("Modifier");
			submitCate.setBackground(new Color(242,245,118));

			PanelAjout.add(idCategorie);

			PanelAjout.add(nomCate);
			PanelAjout.add(descriptionCate);
			PanelAjout.add(idCarteCate);
			PanelAjout.add(submitCate);
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitCate.addActionListener(e -> {
				String requete = "UPDATE categorie SET nom='"+nomCate.getText()+"', description='"+descriptionCate.getText()+"', idCarte='"+idCarteCate.getText()+"' WHERE idCategorie='"+idCategorie.getText()+"'";
				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM categorie","categorie");

			}
					);
			System.out.println("2");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;
			
		case "item":
			PanelAjout.removeAll();
			idItem = new JTextField(15);

			nomItem = new JTextField(15);
			prixItem = new JTextField(15);
			descriptionItem = new JTextArea(2,20);
			descriptionItem.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),1)));
			descriptionItem.setLineWrap(true);
			descriptionItem.setWrapStyleWord(true);
			idCategorieItem = new JTextField(15);
			JButton submitItem = new JButton("Modifier");
			submitItem.setBackground(new Color(242,245,118));

			PanelAjout.add(idItem);

			PanelAjout.add(nomItem);
			PanelAjout.add(prixItem);

			PanelAjout.add(descriptionItem);
			PanelAjout.add(idCategorieItem);

			PanelAjout.add(submitItem);
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitItem.addActionListener(e -> {
				String requete = "UPDATE item SET nom='"+nomItem.getText()+"', prix='"+prixItem.getText()+"',description='"+descriptionItem.getText()+"',idCategorie='"+idCategorieItem.getText()+"' WHERE idItem='"+idItem.getText()+"'";
				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM item","item");

			}
					);
			System.out.println("3");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;

		case "":
			break;
		}	
	}
	private void supprimer() {
		switch(tableChoisi) {
		case "carte":
			PanelAjout.removeAll();
			idCarte = new JTextField(15);
		
			JButton submitCarte = new JButton("Supprimer");
			submitCarte.setBackground(new Color(205,90,81));
			PanelAjout.add(idCarte);

			PanelAjout.add(submitCarte);
			
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitCarte.addActionListener(e -> {
				String requete = "DELETE FROM carte WHERE idCarte='"+idCarte.getText()+"'";
				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM carte","carte");

			}
					);
			System.out.println("1");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;

		case "categorie":
			PanelAjout.removeAll();
			idCategorie = new JTextField(15);
		
			JButton submitCate = new JButton("Supprimer");
			submitCate.setBackground(new Color(205,90,81));

			PanelAjout.add(idCategorie);

			PanelAjout.add(submitCate);
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitCate.addActionListener(e -> {
				String requete = "DELETE FROM categorie WHERE idCategorie='"+idCategorie.getText()+"'";
				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM categorie","categorie");

			}
					);
			System.out.println("2");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;
			
		case "item":
			PanelAjout.removeAll();
			idItem = new JTextField(15);
		
			JButton submitItem = new JButton("Supprimer");
			submitItem.setBackground(new Color(205,90,81));

			PanelAjout.add(idItem);

			PanelAjout.add(submitItem);
			PanelAjout.add(Box.createVerticalStrut(60));

			
			submitItem.addActionListener(e -> {
				String requete = "DELETE FROM item WHERE idItem="+idItem.getText();
				generalDAO.RequeteTable(requete);
				System.out.println("Ajout BON");
				afficherBDD("SELECT * FROM item","item");

			}
					);

			System.out.println("3");
			PanelAjout.revalidate();
			PanelAjout.repaint();
			break;

		case "":
			break;
		}		
	}
	
	private void fillfield(DefaultTableModel model, int row) {
		switch(tableChoisi) {
		case "carte":
			if(nomCart!=null) {
				
			
			nomCart.setText(model.getValueAt(row,1).toString());
			descriptionCart.setText(model.getValueAt(row,2).toString());
			if(idCarte != null) {
				idCarte.setText(model.getValueAt(row,0).toString());

			}
			}
		break;
		case "categorie":
			if(nomCate!=null) {
				nomCate.setText(model.getValueAt(row,1).toString());
				descriptionCate.setText(model.getValueAt(row,2).toString());
				idCarteCate.setText(model.getValueAt(row,3).toString());
				if(idCategorie != null) {
					idCategorie.setText(model.getValueAt(row,0).toString());
					
				}
			}
		break;
		case "item":
			if(nomItem!=null) {
				nomItem.setText(model.getValueAt(row,1).toString());
				prixItem.setText(model.getValueAt(row,3).toString());				
				
				descriptionItem.setText(model.getValueAt(row,2).toString());
				idCategorieItem.setText(model.getValueAt(row,3).toString());	
				if(idItem != null) {
					idItem.setText(model.getValueAt(row,0).toString());
					
				}
			}
		break;
		}	
	}
	

	
	private void afficherBDD(String query,String nom_table) {
		PanelAjout.removeAll();
		PanelAjout.revalidate();
		PanelTri.removeAll();
		PanelTri.setLayout(new BoxLayout(PanelTri,BoxLayout.Y_AXIS));
		DefaultTableModel model = new DefaultTableModel();
		model = generalDAO.getTable(query);
		for(int i = 0; i<model.getColumnCount();i++) {
			final int colIndex = i;
			String nom_col = model.getColumnName(i);
			JButton nv_btn_tri = new JButton("Trier par "+nom_col);
			nv_btn_tri.addActionListener(e -> {
				if(tri_actif==false) {
					afficherBDD("SELECT * FROM "+nom_table+" ORDER BY "+nom_col,nom_table);


					tri_actif = true;
				} else {
					afficherBDD("SELECT * FROM "+nom_table+" ORDER BY "+nom_col+" DESC",nom_table);
					tri_actif = false;
					
					
				}
			});
			PanelTri.add(nv_btn_tri);
		}

		PanelTri.revalidate();
		PanelTri.repaint();
		
		table.setModel(model);

		System.out.println(nom_table);
		tableChoisi = nom_table;		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new ModifPanel("majesty");
	}

}