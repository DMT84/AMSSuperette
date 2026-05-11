package AMS;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

    private static final String URL = "jdbc:postgresql://pedago01c.univ-avignon.fr:5432/etd"; 
    private static final String USER = "uapv2401163";
    private static final String PASSWORD = "vB5Xex";

    private Connection connection;
    public Connection connect() {
        try {
            if (connection == null || connection.isClosed()) { 
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Connexion réussie !");
            } else {
                System.out.println("Connexion déjà établie.");
            }
        } catch (SQLException e) {
            System.out.println("Erreur de connexion à la base de données : " + e.getMessage());
            e.printStackTrace();
            connection = null;
        }
        return connection;
    }

    public void close() {
        if (connection != null) {
            try {
                connection.close();
                System.out.println("Connexion fermée.");
            } catch (SQLException e) {
                System.out.println("Erreur lors de la fermeture de la connexion : " + e.getMessage());
                e.printStackTrace();
            } finally {
                connection = null;
            }
        } else {
            System.out.println("Aucune connexion active à fermer.");
        }
    }

    
    
}
