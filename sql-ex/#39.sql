--  Найдите корабли, `сохранившиеся для будущих сражений`; т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.


SELECT DISTINCT Q.ship
FROM Outcomes AS Q
JOIN Battles AS E
ON Q.battle = E.name
WHERE result = 'damaged'
AND
EXISTS (
SELECT ship 
FROM Outcomes 
JOIN Battles
ON Outcomes.battle = Battles.name
WHERE E.date < Battles.date AND Q.ship = Outcomes.ship)
