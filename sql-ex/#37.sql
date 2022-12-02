--  Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).


SELECT Classes.class
FROM
Classes
LEFT JOIN
(SELECT class, name
FROM Ships
UNION
SELECT ship, ship
FROM Outcomes) AS S
ON Classes.class = S.class
GROUP BY 
Classes.class
HAVING
COUNT(name) = 1
