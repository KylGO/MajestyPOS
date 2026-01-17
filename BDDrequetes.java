package MajestyPOS;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.mysql.cj.jdbc.MysqlDataSource;

public class BDDrequetes {
	
	private Connection BDD = null;
	
	private List<List<String>> elementsCarte = new ArrayList<>();
	
	private List<List<String>> elementsCategorie = new ArrayList<>();
	
	private List<List<String>> elementsItem = new ArrayList<>();
	
	private HashMap<Integer, List<String>> items = new HashMap<>(); // clé : id_item || valeur : list d'élément décrivant l'item

	
	
	public Connection getBDD() {
		return BDD;
	}

	public void setBDD(Connection bDD) {
		BDD = bDD;
	}

	public List<List<String>> getElementsCarte() {
		return elementsCarte;
	}

	public void setElementsCarte(List<List<String>> elementsCarte) {
		this.elementsCarte = elementsCarte;
	}

	public List<List<String>> getElementsCategorie() {
		return elementsCategorie;
	}

	public void setElementsCategorie(List<List<String>> elementsCategorie) {
		this.elementsCategorie = elementsCategorie;
	}

	public List<List<String>> getElementsItem() {
		return elementsItem;
	}

	public void setElementsItem(List<List<String>> elementsItem) {
		this.elementsItem = elementsItem;
	}

	public HashMap<Integer, List<String>> getItems() {
		return items;
	}

	public void setItems(HashMap<Integer, List<String>> items) {
		this.items = items;
	}

	
	
	
	
	public void connectionBDD() {
		String databaseName="majesty";
		String url="jdbc:mysql://localhost:3306/"+databaseName+"?serverTimezone=UTC";
		String login="root";
		String password="";
		
		// Creation d'une connexion avec MysqlDataSource
		MysqlDataSource mysqlDS = new MysqlDataSource();
		mysqlDS.setURL(url);
		mysqlDS.setUser(login);
		mysqlDS.setPassword(password);

		try {
			setBDD(mysqlDS.getConnection());
		} catch (SQLException e1) {
			System.err.println("Erreur de parcours de connexion");
			e1.printStackTrace();
		}
		
	}
	
	public void requeteCarte(){
		elementsCarte.clear();
		Statement st = null; // requête
		ResultSet rs = null; // résultat de la requête
		try {
			st = getBDD().createStatement();
			String sqlQuery = "SELECT * FROM carte";
			rs = st.executeQuery(sqlQuery);
		}
		catch(SQLException e) {
			System.err.println("Erreur requete carte SQL");
			e.printStackTrace();
		}
		
		
		try {
			while(rs.next()) {
				int idCarte = rs.getInt("idCarte");
				String nom = rs.getString("nom");
				String description = rs.getString("description");
				List<String> carte = new ArrayList<>();
				carte.add(Integer.toString(idCarte));
				carte.add(nom);
				carte.add(description);
				getElementsCarte().add(carte);
			}
		}
		catch(SQLException e) {
			System.err.println("Erreur de parcours de item");
			e.printStackTrace();
		}
		
	}
	
	public void requeteCategorie(int carte){
		elementsCategorie.clear();
		
		String sqlQuery = "SELECT idCategorie, nom, description FROM categorie WHERE idCarte = ?";

		try {
			PreparedStatement prepSqlQuery = getBDD().prepareStatement(sqlQuery);
			
			prepSqlQuery.setInt(1, carte);
			prepSqlQuery.execute();
			ResultSet rs = prepSqlQuery.executeQuery();
			
			while(rs.next()) {
				int idCategorie = rs.getInt("idCategorie");
				String nom = rs.getString("nom");
				String description = rs.getString("description");
				List<String> categorie = new ArrayList<>();
				categorie.add(Integer.toString(idCategorie));
				categorie.add(nom);
				categorie.add(description);
				getElementsCategorie().add(categorie);
			}
		}
		catch(SQLException e) {
			System.err.println("Erreur requete categorie SQL");
			e.printStackTrace();
		}
		
	}
	
	public void requeteItem(int carte){
		elementsItem.clear();
		
		String sqlQuery = "SELECT idItem, nom, prix, description FROM item WHERE idCategorie = ?";

		try {
			PreparedStatement prepSqlQuery = getBDD().prepareStatement(sqlQuery);
			
			prepSqlQuery.setInt(1, carte);
			prepSqlQuery.execute();
			ResultSet rs = prepSqlQuery.executeQuery();
			
			
			
			while(rs.next()) {
				int idItem = rs.getInt("idItem");
				String nom = rs.getString("nom");
				BigDecimal prix = rs.getBigDecimal("prix");
				String description = rs.getString("description");
				List<String> item = new ArrayList<>();
				item.add(Integer.toString(idItem));
				item.add(nom);
				item.add(prix.toString());
				item.add(description);
				getElementsItem().add(item);
				
				List<String> items = new ArrayList<>(); // on crée une liste pour stocker les items du récap
				items.add(nom);
				items.add(prix.toString());
				items.add(description);
				
				getItems().put(idItem,items);
			}
		}
		catch(SQLException e) {
			System.err.println("Erreur requete item SQL");
			e.printStackTrace();
		}
		
	}
	
	public void envoyerCommande(int nbrClients, int numTable, LocalDate date, LocalTime heure, BigDecimal total, HashMap<Integer, Integer> panier) {

		try {
			System.out.println("reçu par la fonction envoyerCommande");
			// création de la commande
			String sqlCreateCommande = "INSERT INTO commande (nbrClients, numTable, date, heure, total, actif) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement prepSqlCreateCommande = getBDD().prepareStatement(sqlCreateCommande, Statement.RETURN_GENERATED_KEYS);
			
			prepSqlCreateCommande.setInt(1, nbrClients);
			prepSqlCreateCommande.setInt(2, numTable);
			prepSqlCreateCommande.setDate(3, Date.valueOf(date));
			prepSqlCreateCommande.setTime(4, Time.valueOf(heure));
			prepSqlCreateCommande.setBigDecimal(5, total);
			prepSqlCreateCommande.setBoolean(6, true);

			prepSqlCreateCommande.executeUpdate();
			
			ResultSet rsCommande = prepSqlCreateCommande.getGeneratedKeys();

			int idCommande = 0;
			if (rsCommande.next()) {
			    idCommande = rsCommande.getInt(1);
			}
			
			// ajout des items de la commande
			String sqlCreateCommandeItem = "INSERT INTO commandeItem (idCommande, idItem, quantite, prixItemUnite) VALUES (?, ?, ?, ?)";
			PreparedStatement prepSqlCreateCommandeItem = getBDD().prepareStatement(sqlCreateCommandeItem);

	    	for (int idItem : panier.keySet()) { // on récupère le set de clé de panier
			    int quantite = panier.get(idItem); // on récupère les valeurs associées
			    BigDecimal prixItemUnite = new BigDecimal(getItems().get(idItem).get(1));
				
			    prepSqlCreateCommandeItem.setInt(1, idCommande);
			    prepSqlCreateCommandeItem.setInt(2, idItem);
			    prepSqlCreateCommandeItem.setInt(3, quantite);
			    prepSqlCreateCommandeItem.setBigDecimal(4, prixItemUnite);

			    prepSqlCreateCommandeItem.addBatch();
			}

			prepSqlCreateCommandeItem.executeBatch();
			System.out.println("envoyé à la bdd, idCommande : " + idCommande);
		}
		catch(SQLException e) {
			System.err.println("Erreur création requete commande SQL");
			e.printStackTrace();
		}
	}

	
	
//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	
	public HashMap<Integer, Integer> requetePanierTable(int numTable) {

	    HashMap<Integer, Integer> panier = new HashMap<>();

	    String sqlQuery =
	        "SELECT ci.idItem, SUM(ci.quantite) AS totalQuantite " +
	        "FROM commande c " +
	        "JOIN commandeItem ci ON c.idCommande = ci.idCommande " +
	        "WHERE c.numTable = " + numTable + " " +
	        "GROUP BY ci.idItem";

	    try {
	        Statement stmt = getBDD().createStatement();
	        ResultSet rs = stmt.executeQuery(sqlQuery);

	        while (rs.next()) {
	            int idItem = rs.getInt("idItem");
	            int quantite = rs.getInt("totalQuantite");

	            panier.put(idItem, quantite);
	        }

	    } catch (SQLException e) {
	        System.err.println("Erreur r�cup�ration panier par table");
	        e.printStackTrace();
	    }


	    System.out.println(panier);

	    return panier;
	}
	
	public List<String[]> requeteTicketTable(int numTable) {

	    List<String[]> lignes = new ArrayList<>();

	    String sql =
	        "SELECT i.nom, ci.quantite, ci.prixItemUnite " +
	        "FROM commande c " +
	        "JOIN commandeItem ci ON c.idCommande = ci.idCommande " +
	        "JOIN item i ON ci.idItem = i.idItem " +
	        "WHERE c.numTable = " + numTable + " " +
	        "AND c.actif = 1";

	    try {
	        Statement stmt = getBDD().createStatement();
	        ResultSet rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            lignes.add(new String[] {
	                rs.getString("nom"),
	                String.valueOf(rs.getInt("quantite")),
	                rs.getBigDecimal("prixItemUnite").toString()
	            });
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return lignes;
	}
	
	public String getNomRestaurant() {
	    try {
	        Statement stmt = getBDD().createStatement();
	        ResultSet rs = stmt.executeQuery("SELECT nom FROM restaurant");
	        if (rs.next()) {
	            return rs.getString("nom");
	        }
	    } catch (Exception e) {
	        System.err.println("erreur get nom restaurant");
	        e.printStackTrace();
	    }
	    return null;
	}

	public String getAdresseRestaurant() {
	    try {
	        Statement stmt = getBDD().createStatement();
	        ResultSet rs = stmt.executeQuery("SELECT adresse FROM restaurant");
	        if (rs.next()) {
	            return rs.getString("adresse");
	        }
	    } catch (Exception e) {
	        System.err.println("Erreur get adresse restaurant");
	        e.printStackTrace();
	    }
	    return null;
	}


	public String getNumeroRestaurant() {
	    try {
	        Statement stmt = getBDD().createStatement();
	        ResultSet rs = stmt.executeQuery("SELECT telephone FROM restaurant");
	        if (rs.next()) {
	            return rs.getString("telephone");
	        }
	    } catch (Exception e) {
	        System.err.println("erreur get telephone restaurant");
	        e.printStackTrace();
	    }
	    return null;
	}
	
	public void sauvegarderInfosRestaurant(String nom, String adresse, String telephone) {

	    nom = nom.replace("'", "''");
	    adresse = adresse.replace("'", "''");

	    try {
	        Statement stmt = getBDD().createStatement();

	        stmt.executeUpdate("DELETE FROM restaurant");
	        String sql = "INSERT INTO restaurant (nom, adresse, telephone) "
	        		+ "VALUES (" +"'" + nom + "', '" + adresse + "', '" + telephone + "')";
	        
	        stmt.executeUpdate(sql);

	    } catch (Exception e) {
	        System.err.println("Erreur sauvegarde infos restaurant en base de don�e");
	        e.printStackTrace();
	    }
	}
	
	public void mettreAJourInfosRestaurant(String nom, String adresse, String telephone) {
		nom = nom.replace("'", "''");
	    adresse = adresse.replace("'", "''");

	    try {
	        Statement stmt = getBDD().createStatement();

	        String sql = "UPDATE restaurant SET " +
	                     "nom = '" + nom + "', " +
	                     "adresse = '" + adresse + "', " +
	                     "telephone = '" + telephone + "'";
	        stmt.executeUpdate(sql);

	        System.out.println("Infos restaurant mises � jour en base");

	    } catch (Exception e) {
	        System.err.println("Erreur mise � jour infos restaurant");
	        e.printStackTrace();
	    }
	}

	
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	//RAJOUTER AU FINAL ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
	
	
	
	
	public static void main(String[] args) {
		
		BDDrequetes bdd = new BDDrequetes();
		
		bdd.connectionBDD();
		
		bdd.requeteCategorie(1);
		
		for (List<String> sousListe : bdd.getElementsCategorie()) {
		    //for (String element : sousListe) {
		    System.out.println(sousListe.get(1));
		    //}
		}
	}

}
