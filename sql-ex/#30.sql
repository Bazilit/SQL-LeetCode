--  В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз (первичным ключом в таблицах является столбец code),
--  требуется получить таблицу, в которой каждому пункту за каждую дату выполнения операций будет соответствовать одна строка.
--  Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc). Отсутствующие значения считать неопределенными (NULL).


WITH Income_sum AS (
SELECT point, date, SUM(inc) AS inc
FROM Income
GROUP BY
point, date), 
Outcome_sum AS (
SELECT point, date, SUM(out) AS out
FROM Outcome
GROUP BY
point, date)


SELECT Income_sum.point, Income_sum.date, Outcome_sum.out, Income_sum.inc
FROM Income_sum 
LEFT JOIN 
 Outcome_sum 
ON Income_sum.point = Outcome_sum.point AND
 Income_sum.date = Outcome_sum.date
UNION
SELECT Outcome_sum.point, Outcome_sum.date, Outcome_sum.out, Income_sum.inc
FROM Outcome_sum 
LEFT JOIN 
 Income_sum 
ON Income_sum.point = Outcome_sum.point AND
 Income_sum.date = Outcome_sum.date
