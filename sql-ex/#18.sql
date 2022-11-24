--  Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price


SELECT DISTINCT Product.maker, Printer.price
FROM Product, Printer
WHERE Product.model = Printer.model
AND Printer.color = 'y'
AND Printer.price = (
	SELECT MIN(price)
	FROM Printer
	WHERE Printer.color = 'y'
)
