# Write your MySQL query statement below
Select  
DISTINCT author_id AS id
from Views 
where author_id = viewer_id
ORDER BY id asc ; 