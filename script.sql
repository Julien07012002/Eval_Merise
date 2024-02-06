CREATE TABLE Utilisateur (
    ID_Utilisateur INT PRIMARY KEY,
    Nom VARCHAR(255),
    Prenom VARCHAR(255),
    Email VARCHAR(255),
    MotDePasse VARCHAR(255),
    Type VARCHAR(50)
);

CREATE TABLE Session (
    ID_Session INT PRIMARY KEY,
    Nom_Unique VARCHAR(255) UNIQUE,
    Date_Debut DATE,
    Date_Fin DATE
);

CREATE TABLE Cours (
    ID_Cours INT PRIMARY KEY,
    Nom_Cours VARCHAR(255),
    ID_Session INT,
    FOREIGN KEY (ID_Session) REFERENCES Session(ID_Session)
);

CREATE TABLE Utilisateur_Session (
    ID_Utilisateur INT,
    ID_Session INT,
    PRIMARY KEY (ID_Utilisateur, ID_Session),
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur),
    FOREIGN KEY (ID_Session) REFERENCES Session(ID_Session)
);

CREATE TABLE Evaluation (
    ID_Evaluation INT PRIMARY KEY,
    Type_Evaluation VARCHAR(50),
    ID_Formateur INT,
    ID_Session INT,
    FOREIGN KEY (ID_Formateur) REFERENCES Utilisateur(ID_Utilisateur),
    FOREIGN KEY (ID_Session) REFERENCES Session(ID_Session)
);

CREATE TABLE Note (
    ID_Note INT PRIMARY KEY,
    Note INT,
    ID_Evaluation INT,
    ID_Utilisateur INT,
    FOREIGN KEY (ID_Evaluation) REFERENCES Evaluation(ID_Evaluation),
    FOREIGN KEY (ID_Utilisateur) REFERENCES Utilisateur(ID_Utilisateur)
);
