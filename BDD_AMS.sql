DROP TABLE IF EXISTS contactvente CASCADE;
DROP TABLE IF EXISTS contactcontrat CASCADE;
DROP TABLE IF EXISTS vente CASCADE;
DROP TABLE IF EXISTS lot CASCADE;
DROP TABLE IF EXISTS achat CASCADE;
DROP TABLE IF EXISTS contrat CASCADE;
DROP TABLE IF EXISTS produitAMS CASCADE;
DROP TABLE IF EXISTS contact CASCADE;
DROP TABLE IF EXISTS fournisseur CASCADE;
DROP TABLE IF EXISTS commande CASCADE;

CREATE TABLE fournisseur (
    id_fournisseur SERIAL PRIMARY KEY, 
    nom VARCHAR(30) NOT NULL,
    num_siret NUMERIC(15) NOT NULL,
    adresse VARCHAR(50),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE produitAMS (
    id_produit SERIAL PRIMARY KEY,
    nom VARCHAR(30) NOT NULL,
    descr VARCHAR(100),
    categorie VARCHAR(30),
    prix NUMERIC(10, 2)
);

CREATE TABLE achat (
    id_achat SERIAL PRIMARY KEY,
    id_fournisseur INT REFERENCES fournisseur(id_fournisseur) ON DELETE CASCADE,
    id_produit INT REFERENCES produitAMS(id_produit) ON DELETE CASCADE,
    prix_unitaire NUMERIC(10, 2),
    quantite_achat NUMERIC(10),
    date_achat DATE,
    date_peremp DATE
);

CREATE TABLE lot (
    id_lot SERIAL PRIMARY KEY,
    id_achat INT REFERENCES achat(id_achat) ON DELETE CASCADE,
    quantite NUMERIC(6),
    date_achat DATE,
    date_peremption DATE 
);

CREATE TABLE contrat (
    id_contrat SERIAL PRIMARY KEY, 
    id_fournisseur INT REFERENCES fournisseur(id_fournisseur) ON DELETE CASCADE,
    id_produit INT REFERENCES produitAMS(id_produit) ON DELETE CASCADE,
    quantite NUMERIC(4),
    date_debut DATE,
    date_fin DATE,
    prix NUMERIC(10, 2)
);

CREATE TABLE contact (
    id_contact SERIAL PRIMARY KEY,
    id_fournisseur INT REFERENCES fournisseur(id_fournisseur),
    fonction VARCHAR(30),
    nom VARCHAR(30),
    prenom VARCHAR(30),
    telephone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE vente (
    id_vente SERIAL PRIMARY KEY,
    id_lot INT REFERENCES lot(id_lot),
    date_vente DATE DEFAULT CURRENT_DATE,
    prix NUMERIC(10, 2),
    quantite NUMERIC(4)
);

CREATE TABLE contactvente (
    id_contact INT REFERENCES contact(id_contact) ON DELETE CASCADE,
    id_vente INT REFERENCES vente(id_vente) ON DELETE CASCADE,
    PRIMARY KEY (id_contact, id_vente)
);

CREATE TABLE contactcontrat (
    id_contact INT REFERENCES contact(id_contact) ON DELETE CASCADE,
    id_contrat INT REFERENCES contrat(id_contrat) ON DELETE CASCADE,
    PRIMARY KEY (id_contact, id_contrat)
);

CREATE TABLE commande (
    id_commande SERIAL PRIMARY KEY,
    id_lot INT REFERENCES lot(id_lot) ,
    quantite_commande NUMERIC(10),
    statut VARCHAR(20) DEFAULT 'En attente',
    id_fournisseur INT REFERENCES fournisseur(id_fournisseur) ,
    date_commande DATE DEFAULT CURRENT_DATE
);

INSERT INTO fournisseur (nom, num_siret, adresse, email) VALUES
('Cristiano', 12345678901234, 'Portugal', 'cristiano@portugal.com'),
('Messi', 98765432109876, 'Argentine', 'messi@argentina.com'),
('Neymar', 45678912345678, 'Bresil', 'neymar@brasil.com'),
('Mbappe', 32165498701234, 'France', 'mbappe@france.com'),
('Modric', 74125896314785, 'Croatie', 'modric@croatia.com'),
('De Bruyne', 85296374125896, 'Belgique', 'debruyne@belgium.com'),
('Lewandowski', 96325874136985, 'Pologne', 'lewa@poland.com'),
('Kane', 14736985214725, 'Angleterre', 'kane@uk.com'),
('Salah', 25874136925874, 'Egypte', 'salah@egypt.com'),
('Son', 36914725836912, 'Coree du Sud', 'son@korea.com');

INSERT INTO produitAMS (nom, descr, categorie, prix) VALUES
('Prince', 'Biscuit chocolat', 'Biscuit', 10),
('Oreo', 'Biscuit noir et blanc', 'Biscuit', 10),
('Nutella', 'Pate a tartiner noisette', 'Pate', 10),
('Coca-Cola', 'Boisson gazeuse', 'Boisson', 10),
('Pepsi', 'Boisson gazeuse', 'Boisson', 10),
('Lays', 'Chips nature', 'Snack', 10),
('Pringles', 'Chips saveur', 'Snack', 10),
('KitKat', 'Barre chocolatee', 'Snack', 10),
('Twix', 'Barre chocolatee', 'Snack', 10),
('Mars', 'Barre chocolatee', 'Snack', 10);


INSERT INTO achat (id_fournisseur, id_produit, prix_unitaire, quantite_achat, date_achat, date_peremp) VALUES
(1, 1, 1.50, 1000, '2023-06-01', '2025-06-01'),
(2, 2, 2.00, 800, '2023-06-15', '2025-06-15'),
(3, 3, 4.00, 500, '2023-07-01', '2025-07-01'),
(4, 4, 1.20, 1200, '2023-07-10', '2025-07-10'),
(5, 5, 1.10, 900, '2023-08-01', '2025-08-01'),
(6, 6, 1.70, 1100, '2023-08-15', '2025-08-15'),
(7, 7, 1.90, 600, '2023-09-01', '2025-09-01'),
(8, 8, 1.60, 700, '2023-09-10', '2025-09-10'),
(9, 9, 2.00, 400, '2023-09-20', '2025-09-20'),
(10, 10, 2.50, 300, '2023-10-01', '2025-10-01');

INSERT INTO lot (id_achat, quantite, date_achat, date_peremption) VALUES
(1, 1000, '2023-06-01', '2025-06-01'),
(2, 800, '2023-06-15', '2025-06-15'),
(3, 500, '2023-07-01', '2025-07-01'),
(4, 1200, '2023-07-10', '2025-07-10'),
(5, 900, '2023-08-01', '2025-08-01'),
(6, 1100, '2023-08-15', '2025-08-15'),
(7, 600, '2023-09-01', '2025-09-01'),
(8, 700, '2023-09-10', '2025-09-10'),
(9, 400, '2023-09-20', '2025-09-20'),
(10, 300, '2023-10-01', '2025-10-01');

INSERT INTO commande (id_lot, quantite_commande, statut, id_fournisseur, date_commande) VALUES
(1, 500, 'En attente', NULL, CURRENT_DATE),
(2, 300, 'En attente', NULL, CURRENT_DATE),
(4, 1000, 'En attente', NULL, CURRENT_DATE);
