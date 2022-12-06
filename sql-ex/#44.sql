--  Найдите названия всех кораблей в базе данных, начинающихся с буквы R.


SELECT all_ships.ship
FROM (
SELECT ship
FROM Outcomes
WHERE ship NOT IN (SELECT name FROM Ships)
UNION
SELECT name
FROM Ships) AS all_ships
WHERE all_ships.ship LIKE 'R%'
