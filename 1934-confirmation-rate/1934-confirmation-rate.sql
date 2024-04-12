# Write your MySQL query statement below
SELECT Signups.user_id, 
       ROUND(ifnull(avg(action = 'confirmed'), 0),2) as confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Confirmations.user_id = Signups.user_id
GROUP BY Signups.user_id;
