-- Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.


SELECT DISTINCT maker, speed
FROM Product
JOIN Laptop
ON Product.model = Laptop.model
WHERE (Product.type = 'Laptop') AND (Laptop.hd >= 10)
