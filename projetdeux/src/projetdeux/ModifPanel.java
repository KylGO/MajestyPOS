package projetdeux;
import javax.swing.JPanel;
import javax.swing.border.TitledBorder;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;

import javax.swing.*;

public class ModifPanel extends JFrame{
	private JTable table;
	private JPanel PanelDonne;
	private JPanel PanelAjout;
	private JPanel PanelDelete;
	private String tableChoisi = "";
	public ModifPanel() {
		setTitle("Majesty.sql");
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		setLayout(new BorderLayout());
		JLabel titre = new JLabel();
		titre.setText("Panel de modification de Majesty.SQL");
		titre.setFont(new Font("Serif",Font.BOLD,25));
		
		add(titre,BorderLayout.NORTH);
		add(TablePanelGauche(),BorderLayout.WEST);
		add(TablePanelHaut(),BorderLayout.CENTER);
		

		setVisible(true);

		
				
	}
	
	private JPanel TablePanelHaut() {
		JPanel options = new JPanel();
		options.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),4)));

		
		JButton ajout = new JButton();
		ajout.setText("Ajouter");
		ajout.setFont(new Font("Serif",Font.BOLD,85));
		ajout.setMaximumSize(new Dimension(500,120));
		ajout.addActionListener(e -> ajouter());
		options.add(ajout,BorderLayout.NORTH);
		
		JButton modif = new JButton();
		modif.setText("Modifier");
		modif.setFont(new Font("Serif",Font.BOLD,85));
		modif.setMaximumSize(new Dimension(500,120));
		modif.addActionListener(e -> modifier());

		options.add(modif,BorderLayout.NORTH);
		
		JButton delete = new JButton();
		delete.setText("Supprimer");
		delete.setFont(new Font("Serif",Font.BOLD,85));
		delete.setMaximumSize(new Dimension(500,120));
		delete.addActionListener(e -> supprimer());

		options.add(delete,BorderLayout.NORTH);	
		
		table = new JTable();
		JScrollPane scroll = new JScrollPane(table);
		
		PanelAjout = new JPanel();
		options.add(PanelAjout,BorderLayout.SOUTH);
		PanelDelete = new JPanel();

		options.add(PanelDelete,BorderLayout.SOUTH);

		options.add(table,BorderLayout.CENTER);
		return options;
	}
	
	private JPanel TablePanelGauche() {
		JPanel tables = new JPanel();
		tables.setLayout(new BoxLayout(tables,BoxLayout.Y_AXIS));
		JButton carte = new JButton();
		carte.setText("Carte");
		carte.setFont(new Font("Serif",Font.BOLD,85));
		carte.setMaximumSize(new Dimension(500,120));
		carte.addActionListener(e -> afficherCarte());
		tables.add(Box.createVerticalStrut(160));

		tables.add(carte);
		
		
		
		JButton categorie = new JButton();
		categorie.setText("Catégorie");
		categorie.setFont(new Font("Serif",Font.BOLD,85));
		categorie.setMaximumSize(new Dimension(500,120));
		categorie.addActionListener(e -> afficherCategorie());
		tables.add(Box.createVerticalStrut(50));

		tables.add(categorie);
		
		
		JButton item = new JButton();
		item.setText("Item");
		item.setFont(new Font("Serif",Font.BOLD,85));
		item.setMaximumSize(new Dimension(500,120));
		item.addActionListener(e -> afficherItem());
		tables.add(Box.createVerticalStrut(50));

		tables.add(item);
		JButton test = new JButton();
		test.setText("test");
		test.setFont(new Font("Serif",Font.BOLD,85));
		test.setMaximumSize(new Dimension(500,120));
		tables.add(Box.createVerticalStrut(50));

		tables.add(test);

		return tables;
	}
	
	private void ajouter() {
		JPanel Ajoutpanel = new JPanel();
		switch(tableChoisi) {
		case "carte":
			PanelAjout.removeAll();
			JTextField nomCart = new JTextField();
			JTextField descriptionCart = new JTextField();
			JButton submitCart = new JButton("Ajouter");

			PanelAjout.add(nomCart);
			PanelAjout.add(descriptionCart);
			PanelAjout.add(submitCart);

			
			submitCart.addActionListener(e -> {
				String requete = "INSERT INTO carte(nom,description) VALUES('"+nomCart.getText()+"','"+descriptionCart.getText()+"')";
				carteDAO.addTableCarte(requete);
				System.out.println("Ajout BON");

			}
					);
			System.out.println("1");
			break;

		case "categorie":
			PanelAjout.removeAll();
			JTextField nomCate = new JTextField();
			JTextField descriptionCate = new JTextField();
			JTextField idCarteCate = new JTextField();

			JButton submitCate = new JButton("Ajouter");

			PanelAjout.add(nomCate);
			PanelAjout.add(descriptionCate);
			PanelAjout.add(idCarteCate);
			PanelAjout.add(submitCate);

			
			submitCate.addActionListener(e -> {
				String requete = "INSERT INTO categorie(nom,description,idCarte) VALUES('"+nomCate.getText()+"','"+descriptionCate.getText()+"','"+idCarteCate.getText()+"')";
				categorieDAO.addTableCategorie(requete);
				System.out.println("Ajout BON");

			}
					);
			System.out.println("2");
			break;
			
		case "item":
			PanelAjout.removeAll();
			JTextField nomItem = new JTextField();
			JTextField prixItem = new JTextField();
			JTextField descriptionItem = new JTextField();
			JTextField idCategorieItem = new JTextField();
			JButton submitItem = new JButton("Ajouter");

			PanelAjout.add(nomItem);
			PanelAjout.add(prixItem);

			PanelAjout.add(descriptionItem);
			PanelAjout.add(idCategorieItem);

			PanelAjout.add(submitItem);

			
			submitItem.addActionListener(e -> {
				String requete = "INSERT INTO item(nom,prix,description,idCategorie) VALUES('"+nomItem.getText()+"','"+prixItem.getText()+"','"+descriptionItem.getText()+"','"+idCategorieItem.getText()+"')";
				itemDAO.addTableItem(requete);
				System.out.println("Ajout BON");

			}
					);
			System.out.println("3");
			break;

		case "":
			break;
		}
	}

	private void modifier() {
		switch(tableChoisi) {
		case "carte":
			System.out.println("1");
			break;

		case "categorie":
			System.out.println("2");
			break;
			
		case "item":
			System.out.println("3");
			break;

		case "":
			break;
		}		
	}
	private void supprimer() {
		switch(tableChoisi) {
		case "carte":
			PanelDelete.removeAll();
			JTextField idCarte = new JTextField();
		
			JButton submitCarte = new JButton("Supprimer");

			PanelDelete.add(idCarte);

			PanelDelete.add(submitCarte);

			
			submitCarte.addActionListener(e -> {
				String requete = "DELETE FROM carte WHERE idCarte='"+idCarte.getText()+"'";
				carteDAO.deleteTableCarte(requete);
				System.out.println("Ajout BON");

			}
					);
			System.out.println("1");
			break;

		case "categorie":
			PanelDelete.removeAll();
			JTextField idCategorie = new JTextField();
		
			JButton submitCate = new JButton("Supprimer");

			PanelDelete.add(idCategorie);

			PanelDelete.add(submitCate);

			
			submitCate.addActionListener(e -> {
				String requete = "DELETE FROM categorie WHERE idCategorie='"+idCategorie.getText()+"'";
				categorieDAO.deleteTableCategorie(requete);
				System.out.println("Ajout BON");

			}
					);
			System.out.println("2");
			break;
			
		case "item":
			PanelDelete.removeAll();
			JTextField idItem = new JTextField();
		
			JButton submitItem = new JButton("Supprimer");

			PanelDelete.add(idItem);

			PanelDelete.add(submitItem);

			
			submitItem.addActionListener(e -> {
				String requete = "DELETE FROM item WHERE idItem="+idItem.getText();
				itemDAO.deleteTableItem(requete);
				System.out.println("Ajout BON");

			}
					);

			System.out.println("3");
			break;

		case "":
			break;
		}		
	}
	
	private void afficherCarte() {

		table.setModel(carteDAO.getTableCartes());
		System.out.println("carte");
		tableChoisi = "carte";
		
	}
	private void afficherCategorie() {
		table.setModel(categorieDAO.getTableCategorie());
		System.out.println("carte");
		tableChoisi = "categorie";
	}
	private void afficherItem() {
		table.setModel(itemDAO.getTableItem());

		System.out.println("carte");
		tableChoisi = "item";
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new ModifPanel();
	}

}