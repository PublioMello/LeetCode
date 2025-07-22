-- Report for every three line segments whether they can form a triangle.

-- Return the result table in any order.

select *, 
    CASE
    When (x+y)>z and (x+z)>y and (y+z)>x then 'Yes'
     ELSE 'No'
    end as Triangle
from Triangle
