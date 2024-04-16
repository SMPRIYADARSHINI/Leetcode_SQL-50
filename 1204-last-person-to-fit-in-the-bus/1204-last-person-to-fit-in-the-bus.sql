# Write your MySQL query statement below
SELECT person_name
FROM (
    SELECT 
        person_name,
        weight,
        (SELECT SUM(weight) FROM Queue WHERE turn <= q.turn) AS total_weight
    FROM 
        Queue q
) AS cumulative_weight
WHERE 
    total_weight <= 1000
ORDER BY 
    total_weight DESC
LIMIT 1;
