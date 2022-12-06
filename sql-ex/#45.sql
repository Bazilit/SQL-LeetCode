--  Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
--  Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.


SELECT all_ships.ship
FROM (SELECT ship
	FROM Outcomes
	WHERE ship NOT IN (SELECT name FROM Ships)
	UNION
	SELECT name
	FROM Ships) AS all_ships
WHERE all_ships.ship LIKE'% % %'
