--==========DEBUT SLIDE 42==========--

--Liste nom hero -> ordre alphabétique
SELECT Nom FROM Heros
ORDER BY Nom

--Liste personnage -> 40 pv
SELECT Nom, PV FROM Heros
WHERE PV LIKE "40"

--Liste Nb personnage -> 40 pv
SELECT COUNT(PV) FROM Heros 
WHERE PV = 40

--Liste personnage -> PV de - à +
SELECT Nom, PV FROM Heros
ORDER BY PV

--Personnage qui a le + PV
SELECT Nom, PV FROM Heros
ORDER BY PV DESC
LIMIT 1

--Calcule PV de tout personnage
SELECT SUM(PV) FROM Heros

--Liste nom personnage + compétence 
SELECT Heros.Nom, CompetenceHeros.Nom
FROM Heros
JOIN CompetenceHeros
ON CompetenceHeros.CompetenceID = Heros.ID

--Liste compétences : nom, types, effet 
SELECT Competence.`Type`, Competence.Effet, CompetenceHeros.Nom
FROM Competence
JOIN CompetenceHeros
ON CompetenceHeros.CompetenceID = Competence.ID

--Liste compétence partagé + nom hero
SELECT CompetenceHeros.Nom, Heros.Nom 
FROM CompetenceHeros
JOIN Heros
ON CompetenceHeros.HerosID = Heros.ID
WHERE CompetenceHeros.Nom IN
(
   SELECT CompetenceHeros.Nom FROM CompetenceHeros
   GROUP BY CompetenceHeros.Nom
   HAVING COUNT(CompetenceHeros.Nom)>1
)

--Liste compétence partagé
SELECT DISTINCT CompetenceHeros.Nom 
FROM CompetenceHeros
JOIN Heros
ON CompetenceHeros.HerosID = Heros.ID
WHERE CompetenceHeros.Nom IN
(
   SELECT CompetenceHeros.Nom FROM CompetenceHeros
   GROUP BY CompetenceHeros.Nom
   HAVING COUNT(CompetenceHeros.Nom)>1
)

--Liste personnage qui on une Arme
SELECT Nom
FROM Heros
WHERE ArmeEnMain = 1 

--Liste personnage avec arme + competence
SELECT Heros.Nom, CompetenceHeros.Nom
FROM Heros
JOIN CompetenceHeros
ON CompetenceHeros.HerosID = Heros.ArmeEnMain

--==========FIN SLIDE 42==========--




--==========DEBUT SLIDE 43==========--
