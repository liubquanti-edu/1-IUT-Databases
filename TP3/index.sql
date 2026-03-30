CREATE TABLE MODELE_BUS (
    id_modele INT PRIMARY KEY,
    nom_modele VARCHAR(50),
    nb_places INT,
    autonomie INT,
    poids INT
);

CREATE TABLE BUS (
    numero_immat VARCHAR(20) PRIMARY KEY,
    depot VARCHAR(50),
    id_modele INT,
    FOREIGN KEY (id_modele) REFERENCES MODELE_BUS(id_modele)
);

CREATE TABLE PERSONNEL (
    matricule INT PRIMARY KEY,
    nom VARCHAR(50),
    adresse VARCHAR(100),
    tel VARCHAR(20),
    salaire DECIMAL(10,2)
);

CREATE TABLE MECANICIEN (
    matricule INT PRIMARY KEY,
    specialite VARCHAR(50),
    FOREIGN KEY (matricule) REFERENCES PERSONNEL(matricule)
);

CREATE TABLE CONDUCTEUR (
    matricule INT PRIMARY KEY,
    visite_medicale DATE,
    FOREIGN KEY (matricule) REFERENCES PERSONNEL(matricule)
);

CREATE TABLE HABILITATION (
    id_modele INT,
    matricule INT,
    date_debut DATE,
    date_fin DATE,
    PRIMARY KEY (id_modele, matricule, date_debut),
    FOREIGN KEY (id_modele) REFERENCES MODELE_BUS(id_modele),
    FOREIGN KEY (matricule) REFERENCES MECANICIEN(matricule)
);

CREATE TABLE TRAJET (
    numero_trajet INT PRIMARY KEY,
    numero_immat VARCHAR(20),
    matricule INT,
    ville_dep VARCHAR(50),
    ville_arr VARCHAR(50),
    h_dep TIME,
    h_arr TIME,
    FOREIGN KEY (numero_immat) REFERENCES BUS(numero_immat),
    FOREIGN KEY (matricule) REFERENCES CONDUCTEUR(matricule)
);

CREATE TABLE CONTROLE (
    numero_controle INT PRIMARY KEY,
    nom VARCHAR(50),
    seuil INT,
    date_controle DATE,
    etat VARCHAR(20),
    numero_immat VARCHAR(20),
    FOREIGN KEY (numero_immat) REFERENCES BUS(numero_immat)
);

INSERT INTO MODELE_BUS VALUES
(1,'Iveco',50,600,12000),
(2,'Mercedes',55,650,12500),
(3,'Volvo',60,700,13000);

INSERT INTO BUS VALUES
('AA-101-AA','Clermont-Ferrand',1),
('BB-202-BB','Paris',2),
('CC-303-CC','Lyon',3);

INSERT INTO PERSONNEL VALUES
(201,'Martin','Paris','0102030405',2500),
(305,'Durand','Clermont-Ferrand','0607080910',2600),
(410,'Bernard','Lyon','0203040506',2400),
(500,'Petit','Paris','0304050607',2800);

INSERT INTO CONDUCTEUR VALUES
(201,'2025-01-10'),
(305,'2024-12-05'),
(500,'2025-02-20');

INSERT INTO MECANICIEN VALUES
(410,'Moteur');

INSERT INTO HABILITATION VALUES
(1,410,'2024-01-01','2026-01-01');

INSERT INTO TRAJET VALUES
(1,'AA-101-AA',201,'Clermont-Ferrand','Paris','19:00','23:00'),
(2,'BB-202-BB',305,'Clermont-Ferrand','Lyon','10:00','13:00'),
(3,'AA-101-AA',500,'Paris','Lyon','08:00','11:00'),
(4,'CC-303-CC',201,'Clermont-Ferrand','Paris','20:00','23:30');

INSERT INTO CONTROLE VALUES
(1,'Freins',50,'2025-01-10','OK','AA-101-AA'),
(2,'Moteur',70,'2025-02-12','OK','AA-101-AA'),
(3,'Freins',50,'2025-03-01','A revoir','BB-202-BB');

SELECT matricule
FROM CONDUCTEUR;

SELECT *
FROM TRAJET
WHERE ville_dep = 'Clermont-Ferrand';

SELECT matricule, ville_dep
FROM TRAJET;

SELECT *
FROM TRAJET
WHERE ville_dep = 'Clermont-Ferrand'
AND ville_arr = 'Paris'
AND h_dep > '18:00';

SELECT P.nom
FROM PERSONNEL P
JOIN CONDUCTEUR C ON P.matricule = C.matricule
JOIN TRAJET T ON C.matricule = T.matricule
JOIN BUS B ON T.numero_immat = B.numero_immat
JOIN MODELE_BUS M ON B.id_modele = M.id_modele
WHERE P.adresse = 'Paris'
AND T.ville_dep = 'Paris'
AND M.nom_modele = 'Iveco';

SELECT M.nom_modele, COUNT(*) AS nb_trajets
FROM TRAJET T
JOIN BUS B ON T.numero_immat = B.numero_immat
JOIN MODELE_BUS M ON B.id_modele = M.id_modele
WHERE T.ville_dep = 'Clermont-Ferrand'
GROUP BY M.nom_modele;

SELECT numero_immat, COUNT(*) AS nb_controles
FROM CONTROLE
GROUP BY numero_immat;

SELECT *
FROM TRAJET
WHERE matricule IN (201,305);

SELECT nom, salaire
FROM PERSONNEL
WHERE salaire = (
    SELECT MAX(salaire)
    FROM PERSONNEL
);