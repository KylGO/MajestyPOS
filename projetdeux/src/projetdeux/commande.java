package projetdeux;

import java.time.LocalDate;
import java.time.LocalTime;

public class commande {
	private int idCommande; // Pas fournir
	private int nbrClients;
	private int numTable;
	private	LocalDate date;
	private LocalTime heure;
	private double total;
	private boolean actif;
	public commande() {
		LocalDate date = rs.getDate("date_commande").toLocalDate();
		LocalTime heure = rs.getTime("heure_commande").toLocalTime();
	}
}
