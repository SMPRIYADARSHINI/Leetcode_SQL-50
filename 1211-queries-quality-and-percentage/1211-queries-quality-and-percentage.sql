# Write your MySQL query statement below
WITH query_quality AS (
    SELECT 
        query_name,
        AVG(rating / position) AS quality
    FROM 
        Queries
    GROUP BY 
        query_name
),
poor_query_count AS (
    SELECT 
        query_name,
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) AS poor_query_count,
        COUNT(*) AS total_query_count
    FROM 
        Queries
    GROUP BY 
        query_name
)
SELECT 
    Q.query_name,
    ROUND(Q.quality, 2) AS quality,
    ROUND((P.poor_query_count / P.total_query_count) * 100, 2) AS poor_query_percentage
FROM 
    query_quality Q
JOIN 
    poor_query_count P ON Q.query_name = P.query_name;
