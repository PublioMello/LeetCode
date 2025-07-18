-- Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

-- Return the result table in any order.

select e.name,b.bonus
from Employee as e
left join Bonus as b on e.empId = b.empId
where b.bonus < 1000 or b.bonus is null