📦 Gestion de Stock et Commandes (Mini-ERP)
Cette application Java permet de gérer le cycle complet d'une activité commerciale : de l'approvisionnement auprès des fournisseurs jusqu'à la vente finale aux clients, en passant par le suivi statistique des performances.

🚀 Fonctionnalités Principales
Gestion des Acteurs : Administration complète des profils Clients, Fournisseurs et Vendeurs.

Suivi du Stock : Gestion des Produits organisés par Lots (permettant un suivi précis des arrivages et des quantités).

Cycle de Vente : Création et suivi des Commandes liant les clients aux produits disponibles.

Module de Statistiques : Analyse des données pour générer des rapports sur les ventes et l'état de l'activité.

Interface de Gestion : Centralisation de la logique métier via une classe de contrôle dédiée (Gestion).

🏗️ Architecture du Projet
Le projet est découpé en classes représentant les entités du monde réel :

Acteurs : Client.java, Fournisseur.java, Vendeur.java.

Logistique : Produit.java (caractéristiques générales) et Lot.java (quantités spécifiques).

Transaction : Commande.java (regroupement des articles et lien avec le client).

Cœur Logiciel :

Gestion.java : Le contrôleur qui orchestre les interactions.

Connexion.java : Gère l'accès aux données ou la persistance.

Statistique.java : Calcul des indicateurs de performance.

🛠️ Technologies Utilisées
Langage : Java

Paradigme : Programmation Orientée Objet (POO)

Outils : Standard Java Library (Collections, I/O)

💻 Utilisation
Compilation :

javac *.java
Exécution :
Le point d'entrée principal se trouve dans la classe de test :

java Test
