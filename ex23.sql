
-- Write a solution to report the distance traveled by each user.

-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.


SELECT
    u.name,
    case 
     when SUM(r.distance) is null then 0::numeric
     else sum(r.distance)
     end as travelled_distance
FROM
    Users u
LEft JOIN 
    Rides r on u.id=r.user_id
group by
    u.name,u.id
ORDER BY travelled_distance desc, u.name ASC