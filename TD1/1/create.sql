CREATE TABLE grades (
    id_grade INTEGER PRIMARY KEY,
    nom_grade TEXT NOT NULL UNIQUE,
    salaire_mensuel NOT NULL
);

CREATE TABLE employes (
    id_employe INTEGER PRIMARY KEY,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    date_embauche DATE NOT NULL,
    id_grade INTEGER NOT NULL,
    FOREIGN KEY (id_grade) REFERENCES grades(id_grade)
);

CREATE TABLE diplomes (
    id_diplome INTEGER PRIMARY KEY,
    nom_diplome TEXT NOT NULL UNIQUE
);

CREATE TABLE employe_diplome (
    id_employe INTEGER NOT NULL,
    id_diplome INTEGER NOT NULL,
    PRIMARY KEY (id_employe, id_diplome),
    FOREIGN KEY (id_employe) REFERENCES employes(id_employe) ON DELETE CASCADE,
    FOREIGN KEY (id_diplome) REFERENCES diplomes(id_diplome) ON DELETE CASCADE
);
