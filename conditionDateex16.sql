-- Write a solution to report the products that were only sold in the first quarter of 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.

-- Return the result table in any order.


select distinct p.product_id, p.product_name
from Product as p
join Sales as s on p.product_id= s.product_id
where s.sale_date>='2019-01-01' and s.sale_date<='2019-03-31' and
p.product_id not in(
    select product_id from Sales
    where sale_date< '2019-01-01' or sale_date>'2019-03-31'
)