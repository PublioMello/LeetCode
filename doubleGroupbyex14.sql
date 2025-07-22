-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

-- Return the result table in any order.

SELECT actor_id, director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

-- What it does

-- | actor_id | director_id | timestamp |
-- |----------|-------------|-----------|
-- | 1        | 2           | 100       | ← Grupo 1
-- | 1        | 2           | 200       | ← Grupo 1
-- | 1        | 2           | 300       | ← Grupo 1
-- | 1        | 3           | 400       | ← Grupo 2
-- | 2        | 2           | 500       | ← Grupo 3