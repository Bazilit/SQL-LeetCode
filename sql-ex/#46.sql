--  Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.


SELECT ship, displacement, numGuns
FROM Outcomes
LEFT JOIN (
	SELECT ship AS name, ship AS class
	FROM Outcomes
	WHERE ship NOT IN (SELECT name FROM Ships)
	UNION
	SELECT name, class
	FROM Ships
) AS all_ships
ON all_ships.name = Outcomes.ship
LEFT JOIN Classes
ON all_ships.class = Classes.class
WHERE battle = 'Guadalcanal'
