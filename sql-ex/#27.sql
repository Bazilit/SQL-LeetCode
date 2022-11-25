--  Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.


SELECT maker, AVG(hd) AS AVG_hd
FROM PC
JOIN
Product
ON PC.model = Product.model
WHERE maker IN (
	SELECT maker
	FROM Product
	WHERE type = 'PC'
INTERSECT
	SELECT maker
	FROM Product
	WHERE type = 'Printer'
)
GROUP BY
maker
