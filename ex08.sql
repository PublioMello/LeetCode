-- Write a solution to find the customer_number for the customer who has placed the largest number of orders.

-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.
select customer_number
from Orders
group by customer_number
order by count(*) desc
limit 1