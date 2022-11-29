--  Одной из характеристик корабля является половина куба калибра его главных орудий (mw).
-- С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных.


SELECT
SC.country,
CONVERT(NUMERIC(6,2),AVG((POWER(SC.bore, 3)/2)*1.0)) AS mv
FROM
(
		SELECT country, Classes.class, bore, Ships.name 
		FROM Classes 
		LEFT JOIN Ships 
		ON Classes.class=Ships.class
		WHERE Ships.name IS NOT NULL
	UNION ALL
		SELECT DISTINCT country, class, bore, ship 
		FROM Classes
		LEFT JOIN Outcomes
		ON Classes.class = Outcomes.ship
		WHERE ship IS NOT NULL AND ship NOT IN (SELECT name FROM Ships)
) AS SC
GROUP BY
SC.country
