-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.


SELECT DISTINCT maker
FROM Product
WHERE maker NOT IN (
	SELECT maker
	FROM Product 
	WHERE type='PC'
	INTERSECT
	SELECT maker
	FROM Product 
	WHERE type ='Laptop'
) AND (type  = 'PC')
