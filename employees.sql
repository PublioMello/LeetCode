-- For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

-- Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

-- Return the result table ordered by employee_id.

select
    rt.employee_id,
    rt.name,
    count(rt.employee_id) as reports_count,
    round(avg(e.age)) as average_age
FROM Employees e
join Employees rt on e.reports_to = rt.employee_id
group by rt.employee_id,rt.name
order by rt.employee_id