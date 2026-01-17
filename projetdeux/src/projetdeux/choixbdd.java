package projetdeux;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class choixbdd extends JFrame{
	private JTextField user_input;
	public choixbdd() {
		setTitle("Majesty.sql");
		setExtendedState(JFrame.MAXIMIZED_BOTH);
		setLayout(new BorderLayout(5,10));
		JLabel titre = new JLabel();
		titre.setText("Choisissez la BDD");
		titre.setFont(new Font("Serif",Font.BOLD,25));
		add(titre,BorderLayout.NORTH);
		JPanel tab_input = new JPanel();
		user_input = new JTextField(20);
		user_input.setBorder(BorderFactory.createTitledBorder(BorderFactory.createLineBorder(new Color(156,156,158),1)));
	
		tab_input.add(user_input);
		JButton envoyer = new JButton("Confirmer");
		envoyer.addActionListener(e -> {
			dispose();
			new ModifPanel(user_input.getText());
		});
		tab_input.add(envoyer);
		add(tab_input,BorderLayout.CENTER);
		
		setVisible(true);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new choixbdd();
	}

}
