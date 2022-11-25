--  Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.


SELECT AVG(price_table.price) AS Avg_price
FROM (
	SELECT price
	FROM PC
	JOIN
	Product
	ON Product.model = PC.model
	WHERE maker = 'A'
UNION ALL
	SELECT price
	FROM Laptop
	JOIN
	Product
	ON Product.model = Laptop.model
	WHERE maker = 'A'
) AS price_table
