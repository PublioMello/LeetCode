-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

-- Return the result table in any order.

SELECT DISTINCT a1.actor_id, a1.director_id
FROM ActorDirector a1
WHERE (
    SELECT COUNT(*) 
    FROM ActorDirector a2 
    WHERE a2.actor_id = a1.actor_id 
    AND a2.director_id = a1.director_id
) >= 3;