-- 1 Selectionner les nom des université qui porpose des formations en informatique : 

SELECT Universite.nom 
FROM parcoursup.Universite NATURAL JOIN parcoursup.Formation
WHERE NomFormation='Informatique';

          nom          
-----------------------
 Université de Limoges
(1 ligne)


-- 2 Selectionner les dossiers de Martin Sophie :

SELECT Dossier.IDDossiers
FROM parcoursup.Dossier NATURAL JOIN parcoursup.CreationDossiers NATURAL JOIN parcoursup.Etudiants
WHERE Etudiants.Nom='Martin' and Etudiants.Prenom='Sophie';

 iddossiers 
------------
          7
(1 ligne)


-- 3 Selectionner les université qui porpose plus de 1 formations :

SELECT count(IdUniversite), Universite.Nom
FROM parcoursup.Universite NATURAL JOIN parcoursup.Formation
GROUP BY IdUniversite
HAVING count(IdUniversite) >=2;

 count |                          nom                          
-------+-------------------------------------------------------
     2 | Université Paris Descartes
     2 | IUT de Paris - Rives de Seine - Université Paris Cité
     2 | Université Panthéon Sorbonne
     2 | Université de Lille
     4 | IUT Montreuil
     2 | Université de Limoges
(6 lignes)


-- 4 Selectionner les élèves qui ont des moyennes inférieure à 10 dans une quelconque matières: 

SELECT IdEtudiants
FROM parcoursup.Bulletins
WHERE Moyenne<10
GROUP BY IdEtudiants;

 idetudiants 
-------------
           8
          10
           9
           1
           5
           4
           2
           6
           3
(9 lignes)

-- 5 Selectionner les université qui porpose des formations en Informatique et Économie

SELECT Universite.Nom
FROM parcoursup.Universite NATURAL JOIN parcoursup.Formation
WHERE NomFormation='Informatique'

UNION

SELECT Universite.Nom
FROM parcoursup.Universite NATURAL JOIN parcoursup.Formation
WHERE NomFormation='Économie';

          nom          
-----------------------
 Université de Limoges
(1 ligne)


-- 6 Selectionner les voeux refusé qui ont demander des écoles en informatique : 

SELECT DISTINCT ReponseVoeux.IDDossiers
FROM parcoursup.ReponseVoeux  NATURAL JOIN parcoursup.Dossier NATURAL JOIN parcoursup.CreationDossiers NATURAL JOIN parcoursup.Formation
WHERE ReponseVoeux.ReponseUniversite = 'Refusé' AND Formation.NomFormation = 'Informatique';

 iddossiers 
------------
(0 ligne)

-- 7 Selectionner les étudiants avec une moyenne général supérieur à 10 lors du premiers semestre : 

SELECT Etudiants.Nom, Etudiants.IdEtudiants
FROM parcoursup.Etudiants NATURAL JOIN parcoursup.Bulletins
WHERE Bulletins.Annee = '2022-2022'
GROUP BY Etudiants.IdEtudiants
HAVING AVG(Moyenne) > 10;

   nom    | idetudiants 
----------+-------------
 Girard   |           9
 Lefevre  |           3
 Simon    |           5
 Moreau   |           4
 Barre    |          10
 Leroy    |           6
 Dubois   |           2
 Roux     |           7
 Martin   |           1
 Fournier |           8

-- 8 Selectionner les université dont leur code postale commence par 75 et que ces universités porpose des formations de 3 ans et plus : 

SELECT Universite.Nom
FROM parcoursup.Universite NATURAL JOIN parcoursup.Formation
WHERE Cp LIKE '75%' and DureeAnnee>3;

                          nom                          
-------------------------------------------------------
 IUT de Paris - Rives de Seine - Université Paris Cité
 Université Panthéon Sorbonne
 Université Paris Descartes
 Université Panthéon Sorbonne

-- 9 Selectionner les évlèves qui ont souhaiter des études en Informatique dont la moyenne en mathématique est supérieur à 10 :

SELECT Etudiants.Nom, Etudiants.IdEtudiants
FROM parcoursup.Etudiants NATURAL JOIN parcoursup.CreationDossiers NATURAL JOIN parcoursup.Bulletins NATURAL JOIN parcoursup.Dossier
WHERE Dossier.VoeuxSouhaiter=(SELECT Formation.IDFormation FROM parcoursup.Formation WHERE NomFormation='Informatique') AND Matieres='Mathématiques'
GROUP BY Etudiants.IdEtudiants
HAVING AVG(Moyenne) > 10;

  nom   | idetudiants 
--------+-------------
 Moreau |           4
 Leroy  |           6
(2 lignes)

-- 10 Selectionner les étudiants qui ont un mail qui se fini par '@iut-paris8.fr' : 

SELECT Etudiants.Nom
FROM parcoursup.Etudiants 
WHERE Email LIKE '%@iut-paris8.fr';

   nom    
----------
 Moreau
 Fournier
 Barre
(3 lignes)

