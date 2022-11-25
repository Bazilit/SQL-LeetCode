--  Используя таблицу Product, определить количество производителей, выпускающих по одной модели.


SELECT COUNT(counter.maker) AS qty
FROM
(
	SELECT maker, COUNT(model) AS count
	FROM Product
	GROUP BY
	maker
	HAVING
	COUNT(model) = 1
) AS counter
