------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------

DROP SCHEMA IF EXISTS parcoursup cascade;
CREATE SCHEMA parcoursup ;

------------------------------------------------------------
-- Table: Universite
------------------------------------------------------------
CREATE TABLE parcoursup.Universite(
	IdUniversite   INT  NOT NULL ,
	Nom            VARCHAR NOT NULL ,
	Adresse        VARCHAR NOT NULL ,
	Ville          VARCHAR NOT NULL ,
	Cp             VARCHAR NOT NULL  ,
	CONSTRAINT Universite_PK PRIMARY KEY (IdUniversite)
)WITHOUT OIDS;

INSERT INTO parcoursup.Universite (IdUniversite, Nom, Adresse, Ville, Cp) VALUES
(1, 'IUT Montreuil', '140 Rue de la Nouvelle France', 'Montreuil', '93100'),
(2, 'IUT de Paris - Rives de Seine - Université Paris Cité', '143 Av. de Versailles', 'Paris', '75016'),
(3, 'Université Panthéon Sorbonne', '12 place du Panthéon', 'Paris', '75231'),
(4, 'Université Paris Descartes', ' 12, rue Ecole de Médecine', 'Paris', '75270'),
(5, 'Université Vincennes Saint-Denis', '2 rue de la Liberté', 'Paris', '93526'),
(6, 'Université Paris Ouest Nanterre La Défense', '200 avenue de la République', 'Paris', '92001'),
(7, 'Université de Lille', '42 rue Paul Duez ', 'Lille', '59000'),
(8, 'Université de Limoges', '33 rue François Mitterrand ', 'Limoges', '87032'),
(9, 'Université Orléans', 'Château de la Source Avenue du Parc Floral', 'Orléans', '45067'),
(10, 'Université de Tours', '60 Rue du Plat Étain', 'Tours', '37020');

------------------------------------------------------------
-- Table: Etudiants
------------------------------------------------------------
CREATE TABLE parcoursup.Etudiants(
	IdEtudiants   INT  NOT NULL ,
	Nom           VARCHAR NOT NULL ,
	Prenom        VARCHAR NOT NULL ,
	Email         VARCHAR NOT NULL ,
	NumTel        VARCHAR NOT NULL  ,
	Sexe	      VARCHAR NOT NULL ,
	CONSTRAINT Etudiants_PK PRIMARY KEY (IdEtudiants)
)WITHOUT OIDS;

INSERT INTO parcoursup.Etudiants (IdEtudiants, Nom, Prenom, Email, NumTel, Sexe) VALUES
(1, 'Martin', 'Sophie', 'sophie.martin@yahoo.fr', '0734567890','F'),
(2, 'Dubois', 'Pierre', 'pierre.dubois@gmail.com', '0776543210','M'),
(3, 'Lefevre', 'Camille', 'camille.lefevre@gmail.com', '0751234567','F'),
(4, 'Moreau', 'Luc', 'luc.moreau@iut-paris8.fr', '0712233445','M'),
(5, 'Simon', 'Julie', 'julie.simon@gmail.com', '0788776655','F'),
(6, 'Leroy', 'Thomas', 'thomas.leroy@gmail.com', '0722334455','M'),
(7, 'Roux', 'Laura', 'laura.roux@gmail.com', '0778889999','F'),
(8, 'Fournier', 'Antoine', 'antoine.fournier@iut-paris8.fr', '0745556666','M'),
(9, 'Girard', 'Emma', 'emma.girard@gmail.com', '0776543210','F'),
(10, 'Barre', 'Hugo', 'hugo.barre@iut-paris8.fr', '0739876543','M');


------------------------------------------------------------
-- Table: Formation
------------------------------------------------------------
CREATE TABLE parcoursup.Formation(
	IDFormation      INT  NOT NULL ,
	NomFormation     VARCHAR NOT NULL ,
	DureeAnnee       INT NOT NULL ,
	ConditionAcces   VARCHAR NOT NULL ,
	Description      VARCHAR NOT NULL ,
	IdUniversite     INT    ,
	CONSTRAINT Formation_PK PRIMARY KEY (IDFormation)

	,CONSTRAINT Formation_Universite_FK FOREIGN KEY (IdUniversite) REFERENCES parcoursup.Universite(IdUniversite)
)WITHOUT OIDS;

INSERT INTO parcoursup.Formation (IDFormation, NomFormation, DureeAnnee, ConditionAcces, Description, IdUniversite) VALUES
(1, 'Informatique', '3', 'Bac S', 'Formation en informatique générale', 8),
(2, 'Droit', '4', 'Bac L, Bac ES, Bac S', 'Formation en droit et sciences politiques',9),
(3, 'Médecine', '6', 'Bac S', 'Formation médicale pour devenir médecin',1),
(4, 'Économie', '3', 'Bac ES, Bac S', 'Formation en sciences économiques',8),
(5, 'Art et Design', '4', 'Bac Arts Appliqués', 'Formation artistique et design',2),
(6, 'Génie Civil', '5', 'Bac S', 'Formation en génie civil et construction',3),
(7, 'Biologie', '3', 'Bac S', 'Formation en sciences de la vie',4),
(8, 'Langues Étrangères', '3', 'Bac L', 'Formation en langues étrangères et littérature',5),
(9, 'Marketing', '2', 'Bac STG, Bac ES', 'Formation en marketing et gestion commerciale',7),
(10, 'Physique-Chimie', '4', 'Bac S', 'Formation en physique et chimie',NULL),
(11, 'Psychologie', '3', 'Bac L, Bac ES, Bac S', 'Formation en psychologie',7),
(12, 'Architecture', '5', 'Bac S', 'Formation en architecture et urbanisme',10),
(13, 'Mathématiques Appliquées', '3', 'Bac S', 'Formation en mathématiques appliquées',NULL),
(14, 'Sciences de l''Environnement', '4', 'Bac S', 'Formation en sciences de l''environnement',4),
(15, 'Communication', '3', 'Bac L, Bac ES', 'Formation en communication et médias',1),
(16, 'Histoire de l''Art', '3', 'Bac L', 'Formation en histoire de l''art',2),
(17, 'Énergie Renouvelable', '4', 'Bac S', 'Formation en énergies renouvelables',3),
(18, 'Sociologie', '3', 'Bac L, Bac ES', 'Formation en sociologie',1),
(19, 'Gestion des Ressources Humaines', '2', 'Bac STG, Bac ES', 'Formation en gestion des RH',NULL),
(20, 'Chimie Industrielle', '4', 'Bac S', 'Formation en chimie industrielle',1);


------------------------------------------------------------
-- Table: Dossier
------------------------------------------------------------
CREATE TABLE parcoursup.Dossier(
	IDDossiers              INT  NOT NULL ,
	LettreDeMotivation      TEXT NOT NULL,
	ProjetFormationMotive   TEXT NOT NULL,
	InteretPersonnel        TEXT NOT NULL,
	VoeuxSouhaiter          INT,
	CONSTRAINT Dossier_PK PRIMARY KEY (IDDossiers),
	CONSTRAINT Dossier_Formation_FK FOREIGN KEY (VoeuxSouhaiter) REFERENCES parcoursup.Formation(IDFormation)
)WITHOUT OIDS;

INSERT INTO parcoursup.Dossier (IDDossiers, LettreDeMotivation, ProjetFormationMotive, InteretPersonnel, VoeuxSouhaiter) VALUES
(1, 'Je suis passionné par les mathématiques et souhaite approfondir mes connaissances dans le domaine.', 'Mon projet de formation est de devenir ingénieur en informatique.', 'En dehors de mes études, je m intéresse à la programmation et aux projets open source.', 1),
(2, 'L histoire a toujours été ma matière préférée, et je souhaite poursuivre des études en histoire de l art.', 'Je souhaite approfondir mes connaissances en histoire ancienne et en art médiéval.', 'J ai participé à des projets de bénévolat liés à la préservation du patrimoine.', 5),
(3, 'Je suis passionné par la biologie et souhaite contribuer à la recherche en sciences de la vie.', 'Mon projet professionnel est de devenir chercheur en biologie moléculaire.', 'Je participe activement à des projets de recherche à l université.', 6),
(4, 'Mon intérêt pour les mathématiques m a conduit à envisager une carrière dans le domaine des statistiques.', 'Je souhaite appliquer mes compétences en mathématiques à des problèmes du monde réel.', 'Je suis membre d''un club de statistiques à l école.', 4),
(5, 'Ma passion pour la langue anglaise m a inspiré à poursuivre des études en langues étrangères et littérature.', 'Je souhaite devenir enseignant en anglais et promouvoir la littérature anglaise.', 'J''ai participé à des événements littéraires et des ateliers d''écriture.', 2),
(6, 'Je suis fasciné par la biologie marine et souhaite contribuer à la préservation des écosystèmes marins.', 'Mon projet est de travailler dans le domaine de la conservation marine.', 'Je participe régulièrement à des activités de nettoyage des plages.', 17),
(7, 'Mon intérêt pour la chimie industrielle m a conduit à envisager une carrière dans l industrie chimique.', 'Je souhaite contribuer au développement de nouvelles technologies écologiques.', 'J ai effectué un stage dans une entreprise chimique.', NULL),
(8, 'Les mathématiques ont toujours été ma matière forte, et je souhaite poursuivre des études en mathématiques appliquées.', 'Je veux appliquer mes compétences mathématiques à des problèmes concrets.', 'Je participe à des compétitions mathématiques depuis plusieurs années.', 1),
(9, 'Mon intérêt pour la physique m a conduit à envisager une carrière dans la recherche en physique.', 'Je souhaite contribuer à la compréhension des phénomènes naturels.', 'Je suis membre d un club de physique à l école.', 9),
(10, 'Ma passion pour la langue anglaise m a inspiré à poursuivre des études en langues étrangères et littérature.', 'Je souhaite devenir enseignant en anglais et promouvoir la littérature anglaise.', 'J ai participé à des événements littéraires et des ateliers d écriture.', 13);

------------------------------------------------------------
-- Table: Bulletins
------------------------------------------------------------
CREATE TABLE parcoursup.Bulletins(
	IDBulletins   INT  NOT NULL ,
	Matieres      VARCHAR NOT NULL ,
	Moyenne       FLOAT  NOT NULL ,
	Annee         VARCHAR NOT NULL ,
	IdEtudiants   INT  NOT NULL  ,
	CONSTRAINT Bulletins_PK PRIMARY KEY (IDBulletins,IdEtudiants)

	,CONSTRAINT Bulletins_Etudiants_FK FOREIGN KEY (IdEtudiants) REFERENCES parcoursup.Etudiants(IdEtudiants)
)WITHOUT OIDS;

INSERT INTO parcoursup.Bulletins (IDBulletins, Matieres, Moyenne, Annee, IdEtudiants) VALUES


-- Eleve 1

--S1
(1,'Français', 14, '2022-2022', 1),
(2,'Histoire-géographie', 12, '2022-2022', 1),
(3,'Anglais', 7, '2022-2022', 1),
(4,'Sciences économiques et sociales', 14, '2022-2022', 1),
(5,'Mathématiques', 10, '2022-2022', 1),
(6,'Physique-chimie', 5, '2022-2022', 1),
(7,'Sciences de la vie et de la Terre', 16, '2022-2022', 1),
(8,'Éducation physique et sportive', 17, '2022-2022', 1),
(9,'Enseignement moral et civique', 18, '2022-2022', 1),

--S2
(10,'Français', 13, '2022-2023', 1),
(11,'Histoire-géographie', 9, '2022-2023', 1),
(12,'Anglais', 10, '2022-2023', 1),
(13,'Sciences économiques et sociales', 12, '2022-2023', 1),
(14,'Mathématiques', 11, '2022-2023', 1),
(15,'Physique-chimie', 8, '2022-2023', 1),
(16,'Sciences de la vie et de la Terre', 14, '2022-2023', 1),
(17,'Éducation physique et sportive', 15, '2022-2023', 1),
(18,'Enseignement moral et civique', 16, '2022-2023', 1),

--S3
(19,'Français', 15, '2023-2023', 1),
(20,'Histoire-géographie', 14, '2023-2023', 1),
(21,'Anglais', 4, '2023-2023', 1),
(22,'Sciences économiques et sociales', 17, '2023-2023', 1),
(23,'Mathématiques', 11, '2023-2023', 1),
(24,'Physique-chimie', 17, '2023-2023', 1),
(25,'Sciences de la vie et de la Terre', 15, '2023-2023', 1),
(26,'Éducation physique et sportive', 10, '2023-2023', 1),
(27,'Enseignement moral et civique', 13, '2023-2023', 1),

-- Eleve 2

--S1
(1, 'Français', 18, '2022-2022', 2),
(2, 'Histoire-géographie', 15, '2022-2022', 2),
(3, 'Anglais', 14, '2022-2022', 2),
(4, 'Sciences économiques et sociales', 17, '2022-2022', 2),
(5, 'Mathématiques', 13, '2022-2022', 2),
(6, 'Physique-chimie', 19, '2022-2022', 2),
(7, 'Sciences de la vie et de la Terre', 14, '2022-2022', 2),
(8, 'Éducation physique et sportive', 17, '2022-2022', 2),
(9, 'Enseignement moral et civique', 19, '2022-2022', 2),
--S2
 (10, 'Français', 12.5, '2022-2022', 2),
(11, 'Histoire-géographie', 12.0, '2022-2022', 2),
(12, 'Anglais', 7.2, '2022-2022', 2), 
(13, 'Sciences économiques et sociales', 14.3, '2022-2022', 2),
(14, 'Mathématiques', 10.7, '2022-2022', 2),
(15, 'Physique-chimie', 5.2, '2022-2022', 2),
(16, 'Sciences de la vie et de la Terre', 16.1, '2022-2022', 2),
(17, 'Éducation physique et sportive', 17.6, '2022-2022', 2),
(18, 'Enseignement moral et civique', 18.9, '2022-2022', 2),

--S3
(19,'Français', 18, '2023-2023', 2),
(20,'Histoire-géographie', 8, '2023-2023', 2),
(21,'Anglais', 14, '2023-2023', 2),
(22,'Sciences économiques et sociales', 19, '2023-2023', 2),
(23,'Mathématiques', 16, '2023-2023', 2),
(24,'Physique-chimie', 7, '2023-2023', 2),
(25,'Sciences de la vie et de la Terre', 18, '2023-2023', 2),
(26,'Éducation physique et sportive', 10, '2023-2023', 2),
(27,'Enseignement moral et civique', 12, '2023-2023', 2),

-- Eleve 3

--S1
(1, 'Français', 17, '2022-2022', 3),
(2, 'Histoire-géographie', 14, '2022-2022', 3),
(3, 'Anglais', 20, '2022-2022', 3),
(4, 'Sciences économiques et sociales', 16, '2022-2022', 3),
(5, 'Mathématiques', 19, '2022-2022', 3),
(6, 'Physique-chimie', 14, '2022-2022', 3),
(7, 'Sciences de la vie et de la Terre', 11, '2022-2022', 3),
(8, 'Éducation physique et sportive', 13, '2022-2022', 3),
(9, 'Enseignement moral et civique', 14, '2022-2022', 3),
--S2
 (10, 'Français', 12.5, '2022-2022', 3),
(11, 'Histoire-géographie', 12.0, '2022-2022', 3),
(12, 'Anglais', 7.2, '2022-2022', 3), 
(13, 'Sciences économiques et sociales', 14.3, '2022-2022', 3),
(14, 'Mathématiques', 10.7, '2022-2022', 3),
(15, 'Physique-chimie', 5.2, '2022-2022', 3),
(16, 'Sciences de la vie et de la Terre', 16.1, '2022-2022', 3),
(17, 'Éducation physique et sportive', 17.6, '2022-2022', 3),
(18, 'Enseignement moral et civique', 18.9, '2022-2022', 3),

--S3
(19,'Français', 16, '2023-2023', 3),
(20,'Histoire-géographie',19, '2023-2023', 3),
(21,'Anglais', 12, '2023-2023', 3),
(22,'Sciences économiques et sociales', 14, '2023-2023', 3),
(23,'Mathématiques', 13, 2023-2023, 3),
(24,'Physique-chimie', 18, 2023-2023, 3),
(25,'Sciences de la vie et de la Terre', 16, '2023-2023', 3),
(26,'Éducation physique et sportive', 17, '2023-2023', 3),
(27,'Enseignement moral et civique', 9, '2023-2023', 3),


-- Eleve 4

--S1
(1, 'Français', 15, '2022-2022', 4),
(2, 'Histoire-géographie', 10, '2022-2022', 4),
(3, 'Anglais', 14, '2022-2022', 4),
(4, 'Sciences économiques et sociales', 15, '2022-2022', 4),
(5, 'Mathématiques', 6, '2022-2022', 4),
(6, 'Physique-chimie', 4, '2022-2022', 4),
(7, 'Sciences de la vie et de la Terre', 14, '2022-2022', 4),
(8, 'Éducation physique et sportive', 18, '2022-2022', 4),
(9, 'Enseignement moral et civique', 16, '2022-2022', 4),
--S2
(10, 'Français', 17, '2022-2022', 4),
(11, 'Histoire-géographie', 12.7, '2022-2022', 4),
(12, 'Anglais', 7.9, '2022-2022', 4),
(13, 'Sciences économiques et sociales', 14.8, '2022-2022', 4),
(14, 'Mathématiques', 10.6, '2022-2022', 4),
(15, 'Physique-chimie', 5.7, '2022-2022', 4),
(16, 'Sciences de la vie et de la Terre', 16.3, '2022-2022', 4),
(17, 'Éducation physique et sportive', 17.8, '2022-2022', 4),
(18, 'Enseignement moral et civique', 18.3, '2022-2022', 4),
--S3
(19,'Français', 17, '2023-2023', 4),
(20,'Histoire-géographie', 17, '2023-2023', 4),
(21,'Anglais', 18, '2023-2023', 4),
(22,'Sciences économiques et sociales', 16, '2023-2023', 4),
(23,'Mathématiques', 16, '2023-2023', 4),
(24,'Physique-chimie', 18, '2023-2023', 4),
(25,'Sciences de la vie et de la Terre', 16, '2023-2023', 4),
(26,'Éducation physique et sportive', 12, '2023-2023', 4),
(27,'Enseignement moral et civique', 11, '2023-2023', 4),

-- Eleve 5

--S1
(1, 'Français', 14, '2022-2022', 5),
(2, 'Histoire-géographie', 18, '2022-2022', 5),
(3, 'Anglais', 17, '2022-2022', 5),
(4, 'Sciences économiques et socales', 15, '2022-2022', 5),
(5, 'Mathématiques', 15, '2022-2022', 5),
(6, 'Physique-chimie', 12, '2022-2022', 5),
(7, 'Sciences de la vie et de la Terre', 11, '2022-2022', 5),
(8, 'Éducation physique et sportive', 13, '2022-2022', 5),
(9, 'Enseignement moral et civique', 16.7, '2022-2022', 5),
--S2
(10, 'Français', 12.4, '2022-2022', 5),
(11, 'Histoire-géographie', 12.7, '2022-2022', 5),
(12, 'Anglais', 7.8, '2022-2022', 5),
(13, 'Sciences économiques et sociales', 14.3, '2022-2022', 5),
(14, 'Mathématiques', 10.9, '2022-2022', 5),
(15, 'Physique-chimie', 15.5, '2022-2022', 5),
(16, 'Sciences de la vie et de la Terre', 16.4, '2022-2022', 5),
(17, 'Éducation physique et sportive', 17.7, '2022-2022', 5),
(18, 'Enseignement moral et civique', 18.9, '2022-2022', 5),
--S3
(19,'Français', 14.7, '2023-2023', 5),
(20,'Histoire-géographie', 16.8, '2023-2023', 5),
(21,'Anglais', 15.7, '2023-2023', 5),
(22,'Sciences économiques et sociales', 19.5, '2023-2023', 5),
(23,'Mathématiques', 16.5, '2023-2023', 5),
(24,'Physique-chimie', 17.6, '2023-2023', 5),
(25,'Sciences de la vie et de la Terre', 17.8, '2023-2023', 5),
(26,'Éducation physique et sportive', 19.99, '2023-2023', 5),
(27,'Enseignement moral et civique', 17.3, '2023-2023', 5),

-- Eleve 6

--S1
(1, 'Français', 15.5, '2022-2022', 6),
(2, 'Histoire-géographie', 8.9, '2022-2022', 6),
(3, 'Anglais', 18.7, '2022-2022', 6),
(4, 'Sciences économiques et socales', 5.5, '2022-2022', 6),
(5, 'Mathématiques', 12.9, '2022-2022', 6),
(6, 'Physique-chimie', 20, '2022-2022', 6),
(7, 'Sciences de la vie et de la Terre', 19, '2022-2022', 6),
(8, 'Éducation physique et sportive', 14.7, '2022-2022', 6),
(9, 'Enseignement moral et civique', 19.6, '2022-2022', 6),
--S2
(10, 'Français', 17, '2022-2022', 6),
(11, 'Histoire-géographie', 12.3, '2022-2022', 6),
(12, 'Anglais', 15.9, '2022-2022', 6),
(13, 'Sciences économiques et sociales', 14.8, '2022-2022', 6),
(14, 'Mathématiques', 18.5, '2022-2022', 6),
(15, 'Physique-chimie', 14.6, '2022-2022', 6),
(16, 'Sciences de la vie et de la Terre', 6.1, '2022-2022', 6),
(17, 'Éducation physique et sportive', 7.6, '2022-2022', 6),
(18, 'Enseignement moral et civique', 20, '2022-2022', 6),
--S3
(19,'Français', 12.4, '2023-2023', 6),
(20,'Histoire-géographie', 1.79, '2023-2023', 6),
(21,'Anglais', 15.70, '2023-2023', 6),
(22,'Sciences économiques et sociales', 14.12, '2023-2023', 6),
(23,'Mathématiques',15, '2023-2023', 6),
(24,'Physique-chimie', 14.6, '2023-2023', 6),
(25,'Sciences de la vie et de la Terre', 18.7, '2023-2023', 6),
(26,'Éducation physique et sportive', 19.6, '2023-2023', 6),
(27,'Enseignement moral et civique', 16.3, '2023-2023', 6),

-- Eleve 7

--S1
(1, 'Français', 17.6, '2022-2022', 7),
(2, 'Histoire-géographie', 12.88, '2022-2022', 7),
(3, 'Anglais', 14, '2022-2022', 7),
(4, 'Sciences économiques et socales', 13, '2022-2022', 7),
(5, 'Mathématiques', 14, '2022-2022', 7),
(6, 'Physique-chimie', 17, '2022-2022', 7),
(7, 'Sciences de la vie et de la Terre', 16.2, '2022-2022', 7),
(8, 'Éducation physique et sportive', 14.4, '2022-2022', 7),
(9, 'Enseignement moral et civique', 16.18, '2022-2022', 7),
--S2
(10, 'Français', 13.5, '2022-2022', 7),
(11, 'Histoire-géographie', 17.8, '2022-2022', 7),
(12, 'Anglais', 17.2, '2022-2022', 7),
(13, 'Sciences économiques et sociales', 11.3, '2022-2022', 7),
(14, 'Mathématiques', 15.7, '2022-2022', 7),
(15, 'Physique-chimie', 12.2, '2022-2022', 7),
(16, 'Sciences de la vie et de la Terre', 10.1, '2022-2022', 7),
(17, 'Éducation physique et sportive', 18.6, '2022-2022', 7),
(18, 'Enseignement moral et civique', 19.9, '2022-2022', 7),
--S3
(19,'Français', 13.6, '2023-2023', 7),
(20,'Histoire-géographie', 17.5, '2023-2023', 7),
(21,'Anglais', 10.4,' 2023-2023', 7),
(22,'Sciences économiques et sociales', 12.6,' 2023-2023', 7),
(23,'Mathématiques', 12.6, '2023-2023', 7),
(24,'Physique-chimie', 14.7,' 2023-2023', 7),
(25,'Sciences de la vie et de la Terre', 17.3, '2023-2023', 7),
(26,'Éducation physique et sportive', 15.4,' 2023-2023', 7),
(27,'Enseignement moral et civique', 16.7, '2023-2023', 7),

-- Eleve 8

--S1
(1, 'Français', 10.3, '2022-2022', 8),
(2, 'Histoire-géographie', 11.7, '2022-2022', 8),
(3, 'Anglais', 15.5, '2022-2022', 8),
(4, 'Sciences économiques et socales', 9.3, '2022-2022', 8),
(5, 'Mathématiques', 12.3, '2022-2022', 8),
(6, 'Physique-chimie', 13.5, '2022-2022', 8),
(7, 'Sciences de la vie et de la Terre', 9, '2022-2022', 8),
(8, 'Éducation physique et sportive', 12, '2022-2022', 8),
(9, 'Enseignement moral et civique', 16, '2022-2022', 8),
--S2
(10, 'Français', 11, '2022-2022', 8),
(11, 'Histoire-géographie', 15, '2022-2022', 8),
(12, 'Anglais', 6, '2022-2022', 8),
(13, 'Sciences économiques et sociales', 0, '2022-2022', 8),
(14, 'Mathématiques', 11, '2022-2022', 8),
(15, 'Physique-chimie', 7, '2022-2022', 8),
(16, 'Sciences de la vie et de la Terre', 14, '2022-2022', 8),
(17, 'Éducation physique et sportive', 17, '2022-2022', 8),
(18, 'Enseignement moral et civique', 17, '2022-2022', 8),
--S3
(19,'Français', 14, '2023-2023', 8),
(20,'Histoire-géographie', 12, '2023-2023', 8),
(21,'Anglais', 16, '2023-2023', 8),
(22,'Sciences économiques et sociales', 15, '2023-2023', 8),
(23,'Mathématiques', 12, '2023-2023', 8),
(24,'Physique-chimie', 9, '2023-2023', 8),
(25,'Sciences de la vie et de la Terre', 11,' 2023-2023', 8),
(26,'Éducation physique et sportive', 16, '2023-2023', 8),
(27,'Enseignement moral et civique', 15, '2023-2023', 8),


-- Eleve 9

--S1
(1,'Français',2,'2022-2022',9),
(2,'Histoire-géographie',10,'2022-2022',9),
(3,'Anglais',10,'2022-2022',9),
(4,'Sciences économiques et socales', 7, '2022-2022', 9),
(5,'Mathématiques', 13, '2022-2022', 9),
(6,'Physique-chimie', 12, '2022-2022', 9),
(7,'Sciences de la vie et de la Terre', 14, '2022-2022', 9),
(8,'Éducation physique et sportive', 17, '2022-2022', 9),
(9,'Enseignement moral et civique', 16, '2022-2022', 9),
 --S2
(10,'Français', 9, '2022-2022', 9),
(11,'Histoire-géographie', 12.0, '2022-2022', 9),
(12,'Anglais', 8, '2022-2022', 9),
(13,'Sciences économiques et sociales', 11, '2022-2022', 9),
(14,'Mathématiques', 14, '2022-2022', 9),
(15,'Physique-chimie', 7, '2022-2022', 9),
(16,'Sciences de la vie et de la Terre', 16, '2022-2022', 9),
(17,'Éducation physique et sportive', 19, '2022-2022', 9),
(18,'Enseignement moral et civique', 17.9, '2022-2022', 9),
--S3
(19,'Français', 11, '2023-2023', 9),
(20,'Histoire-géographie', 10.2, '2023-2023', 9),
(21,'Anglais', 13.4, '2023-2023', 9),
(22,'Sciences économiques et sociales', 12.2, '2023-2023', 9),
(23,'Mathématiques', 14.3, '2023-2023', 9),
(24,'Physique-chimie', 8.5, '2023-2023', 9),
(25,'Sciences de la vie et de la Terre', 7.5, '2023-2023', 9),
(26,'Éducation physique et sportive', 12, '2023-2023', 9),
(27,'Enseignement moral et civique', 14, '2023-2023', 9),



-- Eleve 10

--S1
(1, 'Français', 11.4, '2022-2022', 10),
(2, 'Histoire-géographie', 7, '2022-2022', 10),
(3, 'Anglais', 12, '2022-2022', 10),
(4, 'Sciences économiques et socales', 14, '2022-2022', 10),
(5, 'Mathématiques', 2.3, '2022-2022', 10),
(6, 'Physique-chimie', 6, '2022-2022', 10),
(7, 'Sciences de la vie et de la Terre', 12, '2022-2022', 10),
(8, 'Éducation physique et sportive', 13, '2022-2022', 10),
(9, 'Enseignement moral et civique', 14, '2022-2022', 10),
--S2
(10, 'Français', 15, '2022-2022', 10),
(11, 'Histoire-géographie', 16, '2022-2022', 10),
(12, 'Anglais', 7.2, '2022-2022', 10),
(13, 'Sciences économiques et sociales', 14, '2022-2022', 10),
(14, 'Mathématiques', 10, '2022-2022', 10),
(15, 'Physique-chimie', 5.2, '2022-2022', 10),
(16, 'Sciences de la vie et de la Terre', 10, '2022-2022', 10),
(17, 'Éducation physique et sportive', 11, '2022-2022', 10),
(18, 'Enseignement moral et civique', 12, '2022-2022', 10),
 --S3
(19,'Français', 10, '2023-2023', 10),
(20,'Histoire-géographie', 8, '2023-2023', 10),
(21,'Anglais', 4, '2023-2023', 10),
(22,'Sciences économiques et sociales', 14, '2023-2023', 10),
(23,'Mathématiques', 6, '2023-2023', 10),
(24,'Physique-chimie', 7, '2023-2023', 10),
(25,'Sciences de la vie et de la Terre', 12, '2023-2023', 10),
(26,'Éducation physique et sportive', 14.1, '2023-2023', 10),
(27,'Enseignement moral et civique', 12.3, '2023-2023', 10);
------------------------------------------------------------
-- Table: CreationDossiers
------------------------------------------------------------
CREATE TABLE parcoursup.CreationDossiers(
	IDDossiers    INT  NOT NULL ,
	IdEtudiants   INT  NOT NULL  ,
	CONSTRAINT CreationDossiers_PK PRIMARY KEY (IDDossiers,IdEtudiants)

	,CONSTRAINT CreationDossiers_Dossier_FK FOREIGN KEY (IDDossiers) REFERENCES parcoursup.Dossier(IDDossiers)
	,CONSTRAINT CreationDossiers_Etudiants0_FK FOREIGN KEY (IdEtudiants) REFERENCES parcoursup.Etudiants(IdEtudiants)
)WITHOUT OIDS;

INSERT INTO parcoursup.CreationDossiers (IDDossiers, IdEtudiants) VALUES
(1, 6),
(2, 7),
(3, 9),
(4, 8),
(5, 10),
(6, 2),
(7, 1),
(8, 4),
(9, 3),
(10, 5);


------------------------------------------------------------
-- Table: ReponseVoeux
------------------------------------------------------------
CREATE TABLE parcoursup.ReponseVoeux(
	IDFormation         INT  NOT NULL ,
	IDDossiers          INT  NOT NULL ,
	DateVoeux           DATE  NOT NULL ,
	ReponseUniversite   VARCHAR,
	CONSTRAINT ReponseVoeux_PK PRIMARY KEY (IDFormation,IDDossiers)
	,CONSTRAINT ReponseVoeux_Formation_FK FOREIGN KEY (IDFormation) REFERENCES parcoursup.Formation(IDFormation)
	,CONSTRAINT ReponseVoeux_Dossier0_FK FOREIGN KEY (IDDossiers) REFERENCES parcoursup.Dossier(IDDossiers)
)WITHOUT OIDS;

INSERT INTO parcoursup.ReponseVoeux (IDFormation, IDDossiers, DateVoeux, ReponseUniversite) VALUES
(11, 10, '2023-06-26', 'Accepté'),
(2, 2, '2023-06-27', 'Refusé'),
(9, 3, '2023-05-28', NULL),
(6, 4, '2023-07-29', NULL),
(17, 5, '2023-07-30', 'Accepté'),
(1, 6, '2023-07-31', 'Refusé'),
(12, 7, '2023-06-01', 'Refusé'),
(2, 8, '2023-07-02', 'Accepté'),
(2, 9, '2023-08-03', NULL),
(10, 1, '2023-08-04', NULL);