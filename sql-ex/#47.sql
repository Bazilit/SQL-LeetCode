--  Определить страны, которые потеряли в сражениях все свои корабли.


SELECT Ship_A.country
FROM
	(SELECT country, COUNT(name) as count
		FROM
		(SELECT country, name
		FROM Classes
		JOIN Ships
		ON Ships.class= Classes.class
	UNION
		SELECT country, ship
		FROM Classes
		JOIN Outcomes
		ON Outcomes.ship= Classes.class
		) AS all_ships
		GROUP BY country) AS Ship_A
JOIN
	(SELECT country, COUNT(name) as count
		FROM
		(SELECT country, name
		FROM Classes
		JOIN Ships
		ON Ships.class= Classes.class
		WHERE name IN (SELECT ship FROM Outcomes WHERE result = 'sunk')
	UNION
		SELECT country, ship
		FROM Classes
		JOIN Outcomes
		ON Outcomes.ship= Classes.class
		WHERE result = 'sunk'
		) AS all_ships
		GROUP BY country) AS Ship_B
ON Ship_A.country = Ship_B.country AND Ship_A.count = Ship_B.count
