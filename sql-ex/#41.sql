--  Для каждого производителя, у которого присутствуют модели хотя бы в одной из таблиц PC, Laptop или Printer,
--  определить максимальную цену на его продукцию.
--  Вывод: имя производителя, если среди цен на продукцию данного производителя присутствует NULL, 
--  то выводить для этого производителя NULL, иначе максимальную цену.


SELECT maker, 
CASE 
WHEN MAX(CASE WHEN PRICE IS NULL THEN 1 ELSE 0 END) = 0 
THEN MAX(price)
END price
FROM (
SELECT maker, price FROM Product JOIN PC ON Product.model = PC.model
UNION
SELECT maker, price FROM Product JOIN Laptop ON Product.model = Laptop.model
UNION
SELECT maker, price FROM Product JOIN Printer ON Product.model = Printer.model
) this_table GROUP BY maker
