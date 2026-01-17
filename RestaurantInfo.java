package MajestyPOS;

import javax.swing.*;
import java.awt.*;

public class RestaurantInfo extends JDialog {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JTextField nomField;
    private JTextField adresseField;
    private JTextField telephoneField;

    private String nomRestaurant;
    private String adresseRestaurant;
    private String telephoneRestaurant;

    public RestaurantInfo(JFrame parent) {
        super(parent, "Configuration du restaurant", true); // modal
        setSize(400, 250);
        setLocationRelativeTo(parent);
        setLayout(new BorderLayout(10, 10));

        JPanel formPanel = new JPanel(new GridLayout(3, 2, 10, 10));
        formPanel.setBorder(BorderFactory.createEmptyBorder(20, 20, 20, 20));

        formPanel.add(new JLabel("Nom du restaurant :"));
        nomField = new JTextField();
        formPanel.add(nomField);

        formPanel.add(new JLabel("Adresse :"));
        adresseField = new JTextField();
        formPanel.add(adresseField);

        formPanel.add(new JLabel("Téléphone :"));
        telephoneField = new JTextField();
        formPanel.add(telephoneField);

        JButton btnValider = new JButton("Valider");

        btnValider.addActionListener(e -> {
            nomRestaurant = nomField.getText().trim();
            adresseRestaurant = adresseField.getText().trim();
            telephoneRestaurant = telephoneField.getText().trim();

            if (nomRestaurant.isEmpty()) {
                JOptionPane.showMessageDialog(
                        this,
                        "Le nom du restaurant est obligatoire",
                        "Erreur",
                        JOptionPane.ERROR_MESSAGE
                );
                return;
            }

            dispose(); // ferme le popup
        });

        add(formPanel, BorderLayout.CENTER);
        add(btnValider, BorderLayout.SOUTH);
    }

    public String getNomRestaurant() {
        return nomRestaurant;
    }

    public String getAdresseRestaurant() {
        return adresseRestaurant;
    }

    public String getTelephoneRestaurant() {
        return telephoneRestaurant;
    }
    
    public void setNom(String nom) {
        nomField.setText(nom);
    }

    public void setAdresse(String adresse) {
        adresseField.setText(adresse);
    }

    public void setTelephone(String telephone) {
        telephoneField.setText(telephone);
    }
}
