--  Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.


SELECT model
FROM
(
SELECT PC.model, PC.price
FROM PC
WHERE price IN (SELECT max(price) as price FROM PC)
UNION
SELECT Laptop.model, Laptop.price
FROM Laptop
WHERE price IN (SELECT max(price) as price FROM Laptop)
UNION
SELECT Printer.model, Printer.price
FROM Printer
WHERE price IN (SELECT max(price) as price FROM Printer)
) AS max_price_models
WHERE price IN (
SELECT MAX(price) as price
FROM 
(SELECT max(price) as price FROM PC
UNION
SELECT max(price) as price FROM Laptop
UNION
SELECT max(price) as price FROM Printer) AS union_price
)
