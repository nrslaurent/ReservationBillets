CREATE DATABASE ReservationBillets;
USE ReservationBillets;

CREATE TABLE Cinemas
(
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(250) NOT NULL,
  adresse VARCHAR(250) NOT NULL,
  nombreSalles INT(11) NOT NULL
);

CREATE TABLE Salles
(
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  numero INT(11) NOT NULL,
  capacite INT(2) NOT NULL,
  idCinema INT(11) NOT NULL,
  FOREIGN KEY(idCinema)
    REFERENCES Cinemas (id)
);

CREATE TABLE Employes
(
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(250) NOT NULL,
  prenom VARCHAR(250) NOT NULL,
  dateArrivee DATE NOT NULL,
  dateDepart DATE NULL,
  email VARCHAR(250) NOT NULL,
  password VARCHAR(250) NOT NULL,
  lieuTravail INT(1) NULL,
  role INT(1) NOT NULL
);

CREATE TABLE Films
(
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  titre VARCHAR(250) NOT NULL,
  type VARCHAR(250) NOT NULL,
  dateSortie DATE NOT NULL,
  blockbuster TINYINT(1) NOT NULL DEFAULT 0,
  idEmploye INT(11) NOT NULL,
  FOREIGN KEY(idEmploye)
    REFERENCES Employes (id)
);

CREATE TABLE Seances
(
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  jour DATE NOT NULL,
  heure TIME NOT NULL,
  placesRestantes INT(11) NOT NULL,
  idSalle INT(11) NOT NULL,
  FOREIGN KEY(idSalle)
    REFERENCES Salles (id),
  idFilm INT(11) NOT NULL,
  FOREIGN KEY(idFilm)
    REFERENCES Films (id),
  idEmploye INT(11) NOT NULL,
  FOREIGN KEY(idEmploye)
    REFERENCES Employes (id)
);

CREATE TABLE Clients
(
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nom VARCHAR(250) NOT NULL,
  prenom VARCHAR(250) NOT NULL,
  email VARCHAR(250) NOT NULL,
  password VARCHAR(250) NOT NULL,
  dateInscription DATE NOT NULL,
  dateDesinscription DATE NULL
);

CREATE TABLE Billets
(
  id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  numeroPlace INT(2) NOT NULL,
  prix INT(1) NOT NULL DEFAULT 0,
  typePaiement INT(1) NOT NULL DEFAULT 0,
  reserve TINYINT(1) NOT NULL DEFAULT 0,
  paye TINYINT(1) NOT NULL DEFAULT 0,
  idSeance INT(11) NOT NULL,
  FOREIGN KEY(idSeance)
    REFERENCES Seances (id),
  idClient INT(11) NULL,
  FOREIGN KEY(idClient)
    REFERENCES Clients (id)
);

INSERT INTO Cinemas (nom, adresse, nombreSalles) VALUES ('UGC', '1 rue de sardines, 75010 Paris', 2);
INSERT INTO Cinemas (nom, adresse, nombreSalles) VALUES ('CineKartier', '3 boulevard capucine, 75014', 1);
INSERT INTO Salles (numero, capacite, idCinema) VALUES (1, 3, 1);
INSERT INTO Salles (numero, capacite, idCinema) VALUES (1, 2, 2);
INSERT INTO Employes (nom, prenom, email, password, dateArrivee, lieuTravail, role) VALUES ( 'DOE', 'John', 'john.doe@doe.fr', SHA2('EmployeePassword',224), '2021-07-05', 1, 1);
INSERT INTO Films (titre, type, dateSortie, idEmploye) VALUES ('Akira', 'Animation, science-fiction', '1988-07-16',1);
INSERT INTO Seances (jour, heure, idSalle, idFilm, idEmploye, placesRestantes) VALUES ('2021-07-07', '11:00', 1, 1, 1, 10);
INSERT INTO Clients (nom, prenom, email, password, dateInscription) VALUES ('MARTIN', 'Jean', 'jean.martin@email.fr', SHA2('ClientPassword',224), '2021-07-05');
INSERT INTO Billets (numeroPlace, idSeance) VALUES (1, 1); 
UPDATE Billets SET idClient = 1, reserve = 1, prix = 2 WHERE id = 1;
