--  Для классов, имеющих потери в виде потопленных кораблей и не менее 3 кораблей в базе данных, вывести имя класса и число потопленных кораблей.


SELECT *
FROM
(SELECT Classes.class, COUNT(sunk_ships.ship) AS sunken
FROM Classes
LEFT JOIN
  (SELECT Outcomes.ship AS ship, Ships.class AS class
  FROM Outcomes
  LEFT JOIN Ships
  ON Outcomes.ship = Ships.name
  WHERE result = 'sunk') AS sunk_ships
ON sunk_ships.class = Classes.class OR sunk_ships.ship = Classes.class
WHERE Classes.class IN (
SELECT all_ships.class
FROM (
SELECT name, class FROM Ships
UNION
SELECT ship, ship FROM Outcomes) AS all_ships
JOIN Classes
ON Classes.class = all_ships.class
GROUP BY all_ships.class
HAVING
COUNT(all_ships.name) >= 3)
GROUP BY Classes.class
) AS count_sunk
WHERE sunken != 0
