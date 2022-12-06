--  Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).


SELECT name
FROM Ships
WHERE class IN (
	SELECT class
	FROM Classes
	WHERE bore = 16)

UNION

SELECT ship
FROM Outcomes
WHERE ship IN (
	SELECT class
	FROM Classes
	WHERE bore = 16)
