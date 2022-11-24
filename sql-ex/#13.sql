--  Найдите среднюю скорость ПК, выпущенных производителем A. 


SELECT AVG(speed) AS AVG_speed
FROM PC
JOIN Product
ON PC.model = Product.model
WHERE maker = 'A'
