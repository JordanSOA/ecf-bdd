
-- Récupérer la liste des développeurs (matricule, nom, prénom et le nom français de la technologie de prédilection) 
-- qui n’apprennent aucune autre technologie que celle de prédilection

SELECT dev.registration_id, dev.lastname, dev.firstname, tec.name_fr 
FROM developers dev 
JOIN technologies tec ON dev.favorite_tech_id = tec.id_technology
WHERE id_developer NOT IN 
(SELECT de.id_developer 
FROM developers de 
JOIN developers_technologies dt ON de.id_developer = dt.id_developer);

--Récupérer la liste des développeurs (matricule, nom, prénom, et le nombre de technologies apprises)
SELECT count(DISTINCT dt.id_technology) AS learn_count , de.registration_id, de.lastname, de.firstname FROM developers de 
JOIN developers_technologies dt ON de.id_developer = dt.id_developer
GROUP BY  de.registration_id, de.lastname, de.firstname;


-- Récupérer la liste des développeurs 
-- (matricule, nom, prénom, et le nom anglais de la technologie apprise) 
-- qui apprennent au moins une technologie en commun
SELECT de1.registration_id, de1.lastname, de1.firstname, t1.name_en 
FROM developers de1
INNER JOIN developers de2 ON de1.id_developer != de2.id_developer
JOIN developers_technologies dt1 ON dt1.id_developer = de1.id_developer
JOIN developers_technologies dt2 ON dt2.id_developer = de2.id_developer
JOIN technologies t1 ON t1.id_technology = dt1.id_technology
WHERE dt1.id_technology = dt2.id_technology;