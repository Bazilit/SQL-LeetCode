--  Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed


SELECT DISTINCT Product.type, Laptop.model, Laptop.speed
FROM Laptop, Product
WHERE speed < ALL (SELECT speed FROM PC) 
AND Product.type = 'Laptop'
