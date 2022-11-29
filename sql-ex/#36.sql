--  Перечислите названия головных кораблей, имеющихся в базе данных (учесть корабли в Outcomes).


SELECT S.ship
FROM (
	SELECT DISTINCT ship
	FROM Outcomes
	WHERE ship NOT IN (SELECT name FROM Ships)
	UNION
	SELECT DISTINCT name
	FROM Ships
) AS S
WHERE S.ship IN (SELECT class FROM Classes)
