package MajestyPOS;

import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.awt.Desktop;

public class TicketPrinter {
	
	public static String generateTicketCuisineText(
			BDDrequetes bdd,
            int nbrClients,
            int numTable,
            BigDecimal total,
            HashMap<Integer, Integer> panier) {
		
		StringBuilder ticketCuisine = new StringBuilder();
		
        LocalDate date = LocalDate.now();
        LocalTime heure = LocalTime.now().withNano(0);

        // infos general
        ticketCuisine.append("=====COMMANDE=====\n");
        ticketCuisine.append("Date : ").append(LocalDate.now()).append("\n");
        ticketCuisine.append("Heure : ").append(LocalTime.now()).append("\n");
        ticketCuisine.append("Table : ").append(numTable).append("\n");
        ticketCuisine.append("Clients : ").append(nbrClients).append("\n\n");
        
        
        // produits
        
        for (Map.Entry<Integer, Integer> entry : panier.entrySet()) {
            int idProduit = entry.getKey();
            int quantite  = entry.getValue();
            String nomProduit = bdd.getItems().get(idProduit).get(0);

            int MAX_NOM = 15;
            String nom = nomProduit;
            int lignes = (int) Math.ceil((double) nom.length() / MAX_NOM);

            for (int i = 0; i < lignes; i++) {
                int start = i * MAX_NOM;
                int end = Math.min(start + MAX_NOM, nom.length());
                String nomPart = nom.substring(start, end);

                if (i == 0) {
                    ticketCuisine.append(String.format("%-15s x %2d \n",
                            nomPart, quantite));
                } else {
                    ticketCuisine.append(String.format("%-15s %2s \n",
                            nomPart, ""));
                }
            }
        }
        
        
        
        
        
		return (ticketCuisine.toString());
		
	}

    public static String generateTicketCaisseTextFromPanier(
            BDDrequetes bdd,
            int numTable,
            BigDecimal total,
            HashMap<Integer, Integer> panier
    ) {
        StringBuilder ticket = new StringBuilder();

        // infos generales
        ticket.append("============= TICKET =============\n");
        ticket.append("Date : ").append(LocalDate.now()).append("\n");
        ticket.append("Heure : ").append(LocalTime.now()).append("\n");
        ticket.append("Table : ").append(numTable).append("\n");

        // liste de produits
        ticket.append("Produits :\n");
        if (panier.isEmpty()) {
            ticket.append("Aucun produit\n");
        } else {
            for (Map.Entry<Integer, Integer> entry : panier.entrySet()) {
                int idProduit = entry.getKey();
                int quantite  = entry.getValue();
                
                String nomProduit = bdd.getItems().get(idProduit).get(0);
                String prixStr = bdd.getItems().get(idProduit).get(1);
                BigDecimal prixUnitaire = new BigDecimal(prixStr);
                BigDecimal totalLigne = prixUnitaire.multiply(new BigDecimal(quantite));
                
                int MAX_NOM = 15;
                String nom = nomProduit;
                int lignes = (int) Math.ceil((double) nom.length() / MAX_NOM);

                for (int i = 0; i < lignes; i++) {
                    int start = i * MAX_NOM;
                    int end = Math.min(start + MAX_NOM, nom.length());
                    String nomPart = nom.substring(start, end);

                    if (i == 0) {
                        ticket.append(String.format("%-15s %2d x %5.2f€ %6.2f€\n",
                                nomPart, quantite, prixUnitaire.doubleValue(), totalLigne.doubleValue()));
                    } else {
                        ticket.append(String.format("%-15s %2s   %5s  %6s\n",
                                nomPart, "", "", ""));
                    }
                }
            }
        }

        // totaux
        ticket.append("===================================\n");
        ticket.append("\nTotal : ").append(String.format("%.2f €\n",total));
        ticket.append("===================================\n");
        ticket.append("       Merci et à bientôt !\n");

        // test
        System.out.println(ticket.toString());

        return ticket.toString();
    }
    
    
    
    public static String generateTicketCaisseText(
            BDDrequetes bdd,
            int numTable
    ) {
        StringBuilder ticket = new StringBuilder();
        BigDecimal total = BigDecimal.ZERO;

        String nomResto = bdd.getNomRestaurant();
        String adresseResto = bdd.getAdresseRestaurant();
        String telephoneResto = bdd.getNumeroRestaurant();

        if (nomResto != null) {
            ticket.append(nomResto).append("\n\n");
        }
        if (adresseResto != null) {
            ticket.append(adresseResto).append("\n");
        }
        if (telephoneResto != null) {
            ticket.append("Tel : ").append(telephoneResto).append("\n");
        }
        ticket.append("\n");

        // heure sans les milisecondes
        LocalDate date = LocalDate.now();
        LocalTime heure = LocalTime.now().withNano(0);

        ticket.append("============= TICKET =============\n");
        ticket.append("Date : ").append(date).append("\n");
        ticket.append("Heure : ").append(heure).append("\n");
        ticket.append("Table : ").append(numTable).append("\n\n");

        ticket.append("Produits :\n");

        // bdd
        List<String[]> lignes = bdd.requeteTicketTable(numTable);

        if (lignes.isEmpty()) {
            ticket.append("Aucun produit\n");
        } else {
            for (String[] ligne : lignes) {
                String nom = ligne[0];
                int quantite = Integer.parseInt(ligne[1]);
                BigDecimal prixUnitaire = new BigDecimal(ligne[2]);

                BigDecimal totalLigne = prixUnitaire.multiply(
                        BigDecimal.valueOf(quantite)
                );
                total = total.add(totalLigne);

                // alignement nom
                final int MAX = 15;
                int nbLignes = (int) Math.ceil((double) nom.length() / MAX);

                for (int i = 0; i < nbLignes; i++) {
                    int start = i * MAX;
                    int end = Math.min(start + MAX, nom.length());
                    String part = nom.substring(start, end);

                    if (i == 0) {
                        ticket.append(String.format(
                                "%-15s %2d x %5.2f€ %6.2f€\n",
                                part,
                                quantite,
                                prixUnitaire.doubleValue(),
                                totalLigne.doubleValue()
                        ));
                    } else {
                        ticket.append(String.format(
                                "%-15s\n",
                                part
                        ));
                    }
                }
            }
        }

        ticket.append("\n=================================\n");
        ticket.append(String.format("\nTotal : %.2f €\n", total.doubleValue()));
        ticket.append("=================================\n");
        ticket.append("       Merci et à bientôt !\n");

        return ticket.toString();
    }
    
    
    

    public static void printTicket(String ticketText) {
        try {
            // crée le fichier temporaire
            File file = new File("C:\\temp\\ticket.txt");
            file.getParentFile().mkdirs();
            try (FileWriter writer = new FileWriter(file)) {
                writer.write(ticketText);
            }

            // imprimme avec Desktop ca marchait pas avec javax print
            if (Desktop.isDesktopSupported()) {
                Desktop.getDesktop().print(file);
                System.out.println("Ticket envoyé à l'imprimante par Desktop.print()");
            } else {
                System.err.println("Desktop.print() non supporté sur cette machine.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
