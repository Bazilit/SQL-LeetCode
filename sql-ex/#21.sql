--  Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
--  Вывести: maker, максимальная цена.


SELECT maker, max(price) AS Max_price
FROM Product
JOIN PC
ON Product.model = PC.model
WHERE type = 'PC'
GROUP BY maker
