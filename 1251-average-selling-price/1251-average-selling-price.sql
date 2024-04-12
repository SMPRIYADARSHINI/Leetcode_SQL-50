# Write your MySQL query statement below
SELECT p.product_id,
IFNULL(ROUND(SUM(u.units*p.price)/SUM(u.units),2),0)
AS average_price
from prices p
Left join UnitsSold u ON p.product_id=u.product_id 
and u.purchase_date between p.start_date AND p.end_date
GROUP BY 
p.product_id