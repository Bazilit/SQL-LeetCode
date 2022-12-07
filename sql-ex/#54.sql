--  С точностью до 2-х десятичных знаков определите среднее число орудий всех линейных кораблей (учесть корабли из таблицы Outcomes).


SELECT CAST(AVG(numGuns*1.0) AS NUMERIC(6,2)) AS Avg_numG
FROM 
(SELECT name, class FROM Ships
UNION
SELECT ship, ship FROM Outcomes) AS All_ships
JOIN Classes
ON All_ships.class = Classes.class
WHERE type = 'bb'
