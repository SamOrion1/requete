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

--Liste nom personnage + compétence (fonctionne pas, à faire)
SELECT Nom, CompetenceID
FROM Heros
INNER JOIN Competence-Heros
ON Competence-Heros.CompetenceID = Heros.ID

--Liste compétences : nom, types, effet (fonctionne pas, à faire)
SELECT Effet, `Type`, Nom
FROM Competence
INNER JOIN Competence-Heros
ON Competence.Effet, `Type`=Competence-Heros.Nom

