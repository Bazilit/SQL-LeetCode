--  Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.


SELECT DISTINCT A.model, B.model, A.speed, A.ram
FROM PC AS A, PC B
WHERE (A.ram = B.ram) AND (A.speed = B.speed) AND (A.model > B.model)
