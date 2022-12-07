--  Для каждого класса определите число кораблей этого класса, потопленных в сражениях. Вывести: класс и число потопленных кораблей.


SELECT Classes.class, COUNT(sunk_ships.ship)
FROM Classes
LEFT JOIN
  (SELECT Outcomes.ship AS ship, Ships.class AS class
  FROM Outcomes
  LEFT JOIN Ships
  ON Outcomes.ship = Ships.name
  WHERE result = 'sunk') AS sunk_ships
ON sunk_ships.class = Classes.class OR sunk_ships.ship = Classes.class
GROUP BY Classes.class
