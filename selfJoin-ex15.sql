-- Write a solution to find the employees who earn more than their managers.

-- Return the result table in any order.

select e.name as Employee
from Employee as e
join Employee as m on e.managerId =m.id
where e.salary > m.salary

-- foi adicionado que o managerid referente ao employee e depois traz o id desse manager com suas infos

-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

-- Return the result table in any order.

select w1.id as "Id"
from Weather as w1
join Weather as w2 
ON w1.recordDate - w2.recordDate = 1
where w1.temperature> w2.temperature



-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".

-- Return the result table in any order.

select
    sp.name
from 
    SalesPerson as sp
where   
    sp.name 
    not in
        (select sp.name
        from SalesPerson as sp
        left join Orders as o on sp.sales_id = o.sales_id
        left join Company as c on o.com_id = c.com_id
        where c.name='RED')