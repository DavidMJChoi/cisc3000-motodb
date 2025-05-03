-- 1. Count motorcycles by make

SELECT make, COUNT(*) AS bike_count
FROM Motorcycle
GROUP BY make
ORDER BY bike_count DESC;

-- 2. List all upcoming events with their routes and organizers

SELECT e.name, e.date, r.name AS route, r.difficulty, m.name AS organizer
FROM Event AS e
JOIN RideRoute AS r ON e.route_id = r.route_id
JOIN Member AS m ON e.organizer_id = m.rider_id
WHERE e.date > NOW();

-- 3. 

-- More To-dos