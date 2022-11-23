-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).


SELECT PC.model, PC.price
FROM Product
JOIN PC
ON Product.model = PC.model
WHERE maker = 'B'
UNION
SELECT Laptop.model, Laptop.price
FROM Product
JOIN Laptop
ON Product.model = Laptop.model
WHERE maker = 'B'
UNION
SELECT Printer.model, Printer.price
FROM Product
JOIN Printer
ON Product.model = Printer.model
WHERE maker = 'B'
