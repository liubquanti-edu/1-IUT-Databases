INSERT INTO grades (id_grade, nom_grade, salaire_mensuel) VALUES (1, 'A', 5000);
INSERT INTO grades (id_grade, nom_grade, salaire_mensuel) VALUES (2, 'B', 4000);
INSERT INTO grades (id_grade, nom_grade, salaire_mensuel) VALUES (3, 'C', 3000);

INSERT INTO employes (id_employe, nom, prenom, date_embauche, id_grade) VALUES (1, 'Doe', 'John', '2020-01-15', 1);
INSERT INTO employes (id_employe, nom, prenom, date_embauche, id_grade) VALUES (2, 'Smith', 'Jane', '2019-03-22', 2);
INSERT INTO employes (id_employe, nom, prenom, date_embauche, id_grade) VALUES (3, 'Brown', 'Charlie', '2021-07-30', 3);

INSERT INTO diplomes (id_diplome, nom_diplome) VALUES (1, 'Bachelor');
INSERT INTO diplomes (id_diplome, nom_diplome) VALUES (2, 'Master');
INSERT INTO diplomes (id_diplome, nom_diplome) VALUES (3, 'PhD');

INSERT INTO employe_diplome (id_employe, id_diplome) VALUES (1, 1);
INSERT INTO employe_diplome (id_employe, id_diplome) VALUES (1, 2);
INSERT INTO employe_diplome (id_employe, id_diplome) VALUES (2, 1);
INSERT INTO employe_diplome (id_employe, id_diplome) VALUES (3, 1);
INSERT INTO employe_diplome (id_employe, id_diplome) VALUES (3, 3);