# Write your MySQL query statement below
WITH first_orders AS (
    SELECT 
        customer_id,
        MIN(order_date) AS first_order_date
    FROM 
        Delivery
    GROUP BY 
        customer_id
),
immediate_orders AS (
    SELECT 
        COUNT(*) AS immediate_count
    FROM 
        Delivery D
    JOIN 
        first_orders FO ON D.customer_id = FO.customer_id
    WHERE 
        D.order_date = FO.first_order_date
        AND D.customer_pref_delivery_date = D.order_date
)
SELECT 
    ROUND(
        (SELECT immediate_count FROM immediate_orders) * 100.0 / 
        (SELECT COUNT(*) FROM first_orders), 
        2
    ) AS immediate_percentage;
