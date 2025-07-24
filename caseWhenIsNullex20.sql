-- Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0.

-- Return the result table in any order.

-- The result format is in the following example.



select 
p.product_id,
case 
when sum(us.units) is null or sum(us.units)=0 then 0 
ELSE Round(sum(us.units*p.price)::numeric/sum(us.units),2)
end as average_price
from Prices as p
left join UnitsSold as us on p.product_id = us.product_id
and us.purchase_date BETWEEN p.start_date and p.end_date
group by p.product_id


-- Explanation: 
-- Average selling price = Total Price of Product / Number of products sold.
-- Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
-- Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96