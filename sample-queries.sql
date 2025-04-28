-- Count motorcycles by make
SELECT make, COUNT(*) AS bike_count
FROM Motorcycle
GROUP BY make
ORDER BY bike_count DESC;

-- More To-dos