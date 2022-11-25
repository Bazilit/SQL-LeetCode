--  В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день [т.е. первичный ключ (пункт, дата)], 
--  написать запрос с выходными данными (пункт, дата, приход, расход). Использовать таблицы Income_o и Outcome_o.


SELECT Outcome_o.point, Outcome_o.date, inc, out
RIGHT JOIN
Outcome_o
ON (Income_o.date = Outcome_o.date AND Income_o.point = Outcome_o.point)
UNION
SELECT Income_o.point, Income_o.date, inc, out
FROM Income_o
LEFT JOIN
Outcome_o
ON (Income_o.date = Outcome_o.date AND Income_o.point = Outcome_o.point)
