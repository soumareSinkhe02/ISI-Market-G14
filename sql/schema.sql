CREATE DATABASE IF NOT EXISTS isi_market_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE isi_market_db;

DROP TABLE IF EXISTS Annonces;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Vendeurs;
CREATE TABLE Vendeurs (
    id_vendeur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    contact VARCHAR(150) NOT NULL,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;


CREATE TABLE Categories (
    id_categorie INT AUTO_INCREMENT PRIMARY KEY,
    libelle VARCHAR(100) NOT NULL,
    description_categorie TEXT
) ENGINE=InnoDB;


CREATE TABLE Annonces (
    id_annonce INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    description_annonce TEXT NOT NULL,
    prix DECIMAL(10, 2) NOT NULL,
    date_publication TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut VARCHAR(20) DEFAULT 'disponible',
    etat_objet VARCHAR(50) NOT NULL,
    localisation VARCHAR(100) NOT NULL,
    id_vendeur INT NOT NULL,
    id_categorie INT NOT NULL,
    CONSTRAINT chk_statut CHECK (statut IN ('disponible', 'vendu')),
    FOREIGN KEY (id_vendeur) REFERENCES Vendeurs(id_vendeur) ON DELETE CASCADE,
    FOREIGN KEY (id_categorie) REFERENCES Categories(id_categorie) ON DELETE RESTRICT
) ENGINE=InnoDB;