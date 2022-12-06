--  Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).


WITH Ships_A AS (SELECT name, numGuns, displacement
FROM (
SELECT name, class
FROM Ships
UNION
SELECT ship, ship
FROM Outcomes) AS All_ships
JOIN Classes
ON Classes.class = All_ships.class),

Ships_B AS (SELECT MAX(numGuns) as MaxGuns, displacement
FROM (
SELECT name, class
FROM Ships
UNION
SELECT ship, ship
FROM Outcomes) AS All_ships
JOIN Classes
ON Classes.class = All_ships.class
GROUP BY displacement)


SELECT Ships_A.name, Ships_A.displacement, Ships_B.MaxGuns
FROM Ships_A
JOIN Ships_B
ON Ships_A.displacement = Ships_B.displacement AND Ships_A.numGuns = Ships_B.MaxGuns
