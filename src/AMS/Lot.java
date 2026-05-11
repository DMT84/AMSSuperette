package AMS;

import java.sql.SQLException;

public class Lot {
	public static void afficherLotsParDate(Gestion gestion) {
        System.out.println("=== Lots classés par date de péremption ===");
        try {
            gestion.afficherLotsParDate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'affichage des lots : " + e.getMessage());
        }
    }
}
