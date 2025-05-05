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
-- 1. Count motorcycles by make

-- Description: Count the number of motorcycles for each make, sorted by the count in descending order.

SELECT make, COUNT(*) AS bike_count
FROM Motorcycle
GROUP BY make
ORDER BY bike_count DESC;

-- 2. List all upcoming events with their routes and organizers

-- Description: Retrieve the name, date, route name, route difficulty, and organizer’s name for all upcoming events, joining the Event, RideRoute, and Member tables.

SELECT e.name, e.date, r.name AS route, r.difficulty, m.name AS organizer
FROM Event AS e
JOIN RideRoute AS r ON e.route_id = r.route_id
JOIN Member AS m ON e.organizer_id = m.rider_id
WHERE e.date > NOW();

-- 3. Find the top 3 members who have participated in the most events, including their total maintenance costs for their motorcycles.

-- Description: Retrieve the top 3 members with the highest number of event participations, along with the total maintenance cost for their motorcycles, only for members who have at least one motorcycle and have participated in events with a 'hard' or 'expert' difficulty route.

WITH MemberParticipation AS (
    SELECT 
        m.rider_id, 
        m.name, 
        COUNT(ep.event_id) AS event_count,
        SUM(mt.cost) AS total_maintenance_cost
    FROM Member m
    LEFT JOIN Motorcycle mc ON m.rider_id = mc.member_id
    LEFT JOIN Maintenance mt ON mc.bike_id = mt.bike_id
    JOIN EventParticipation ep ON m.rider_id = ep.rider_id
    JOIN Event e ON ep.event_id = e.event_id
    JOIN RideRoute r ON e.route_id = r.route_id
    WHERE r.difficulty IN ('hard', 'expert')
    GROUP BY m.rider_id, m.name
    HAVING COUNT(mc.bike_id) > 0
)
SELECT 
    name, 
    event_count, 
    COALESCE(total_maintenance_cost, 0) AS total_maintenance_cost
FROM MemberParticipation
ORDER BY event_count DESC
LIMIT 3;

-- 4. List events with their sponsors and the average skill level of participants

-- Description: For each event that has at least one sponsor, show the event name, date, total sponsorship amount, and the average skill level of participants (converted to a numeric scale: beginner=1, intermediate=2, expert=3), ordered by total sponsorship amount.

SELECT 
    e.name AS event_name, 
    e.date, 
    SUM(es.contribution_amount) AS total_sponsorship,
    AVG(CASE m.skill_level 
        WHEN 'beginner' THEN 1 
        WHEN 'intermediate' THEN 2 
        WHEN 'expert' THEN 3 
        END) AS avg_skill_level
FROM Event e
JOIN EventSponsor es ON e.event_id = es.event_id
JOIN Sponsor s ON es.sponsor_id = s.sponsor_id
JOIN EventParticipation ep ON e.event_id = ep.event_id
JOIN Member m ON ep.rider_id = m.rider_id
GROUP BY e.event_id, e.name, e.date
HAVING total_sponsorship > 0
ORDER BY total_sponsorship DESC;

-- 5. Identify members who own motorcycles with above-average engine size and have never participated in an event

-- Description: Find members who own at least one motorcycle with an engine size greater than the average engine size across all motorcycles, but have not participated in any events.

WITH AvgEngineSize AS (
    SELECT AVG(engine_size) AS avg_engine
    FROM Motorcycle
)
SELECT 
    m.name, 
    m.email, 
    mc.make, 
    mc.model, 
    mc.engine_size
FROM Member m
JOIN Motorcycle mc ON m.rider_id = mc.member_id
CROSS JOIN AvgEngineSize
WHERE mc.engine_size > (SELECT avg_engine FROM AvgEngineSize)
AND NOT EXISTS (
    SELECT 1 
    FROM EventParticipation ep 
    WHERE ep.rider_id = m.rider_id
)
ORDER BY mc.engine_size DESC;

-- 6. Calculate the total distance of routes taken by each member across all events, ranking them

-- Description: For each member who has participated in at least one event, calculate the total distance of all routes they’ve ridden (based on event routes), and rank them using a window function, only including members with a total distance greater than 100 miles.

SELECT 
    m.name, 
    SUM(r.distance) AS total_distance,
    RANK() OVER (ORDER BY SUM(r.distance) DESC) AS distance_rank
FROM Member m
JOIN EventParticipation ep ON m.rider_id = ep.rider_id
JOIN Event e ON ep.event_id = e.event_id
JOIN RideRoute r ON e.route_id = r.route_id
GROUP BY m.rider_id, m.name
HAVING total_distance > 100
ORDER BY total_distance DESC;

-- 7. Find events where the organizer’s skill level is lower than the average skill level of participants

-- Description: Identify events where the organizer’s skill level (beginner=1, intermediate=2, expert=3) is less than the average skill level of the event’s participants, including the event name, organizer’s name, and skill level differences.

WITH ParticipantSkill AS (
    SELECT 
        e.event_id, 
        AVG(CASE m.skill_level 
            WHEN 'beginner' THEN 1 
            WHEN 'intermediate' THEN 2 
            WHEN 'expert' THEN 3 
            END) AS avg_participant_skill
    FROM Event e
    JOIN EventParticipation ep ON e.event_id = ep.event_id
    JOIN Member m ON ep.rider_id = m.rider_id
    GROUP BY e.event_id
)
SELECT 
    e.name AS event_name, 
    mo.name AS organizer, 
    (CASE mo.skill_level 
        WHEN 'beginner' THEN 1 
        WHEN 'intermediate' THEN 2 
        WHEN 'expert' THEN 3 
        END) AS organizer_skill,
    ps.avg_participant_skill,
    (ps.avg_participant_skill - (CASE mo.skill_level 
        WHEN 'beginner' THEN 1 
        WHEN 'intermediate' THEN 2 
        WHEN 'expert' THEN 3 
        END)) AS skill_gap
FROM Event e
JOIN Member mo ON e.organizer_id = mo.rider_id
JOIN ParticipantSkill ps ON e.event_id = ps.event_id
WHERE (CASE mo.skill_level 
        WHEN 'beginner' THEN 1 
        WHEN 'intermediate' THEN 2 
        WHEN 'expert' THEN 3 
        END) < ps.avg_participant_skill
ORDER BY skill_gap DESC;

-- 8. List sponsors who have contributed to multiple events with above-average contribution amounts

-- Description: Find sponsors who have sponsored at least two events, where each contribution amount is greater than the average contribution amount across all event sponsorships, showing the sponsor’s name and total contribution.

WITH AvgContribution AS (
    SELECT AVG(contribution_amount) AS avg_contribution
    FROM EventSponsor
)
SELECT 
    s.name AS sponsor_name, 
    COUNT(es.event_id) AS event_count, 
    SUM(es.contribution_amount) AS total_contribution
FROM Sponsor s
JOIN EventSponsor es ON s.sponsor_id = es.sponsor_id
CROSS JOIN AvgContribution
WHERE es.contribution_amount > (SELECT avg_contribution FROM AvgContribution)
GROUP BY s.sponsor_id, s.name
HAVING COUNT(es.event_id) >= 2
ORDER BY total_contribution DESC;

-- 9. Identify motorcycles that have had maintenance costs exceeding the average cost per bike in the last year

-- Description: List motorcycles that have incurred maintenance costs in the last year higher than the average maintenance cost per bike, including the member’s name, motorcycle details, and total cost.

WITH BikeMaintenance AS (
    SELECT 
        mc.bike_id, 
        m.name AS member_name, 
        mc.make, 
        mc.model, 
        SUM(mt.cost) AS total_cost
    FROM Motorcycle mc
    JOIN Member m ON mc.member_id = m.rider_id
    JOIN Maintenance mt ON mc.bike_id = mt.bike_id
    WHERE mt.service_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY mc.bike_id, m.name, mc.make, mc.model
),
AvgMaintenance AS (
    SELECT AVG(total_cost) AS avg_cost
    FROM BikeMaintenance
)
SELECT 
    bm.member_name, 
    bm.make, 
    bm.model, 
    bm.total_cost
FROM BikeMaintenance bm
CROSS JOIN AvgMaintenance
WHERE bm.total_cost > (SELECT avg_cost FROM AvgMaintenance)
ORDER BY bm.total_cost DESC;

-- 10. Find routes that have been used in events with participants of all skill levels

-- Description: Identify ride routes that have been used in events where participants included at least one beginner, one intermediate, and one expert rider, showing the route name and total distance.

SELECT 
    r.name AS route_name, 
    r.distance
FROM RideRoute r
JOIN Event e ON r.route_id = e.route_id
JOIN EventParticipation ep ON e.event_id = ep.event_id
JOIN Member m ON ep.rider_id = m.rider_id
GROUP BY r.route_id, r.name, r.distance
HAVING 
    COUNT(DISTINCT CASE WHEN m.skill_level = 'beginner' THEN m.rider_id END) > 0
    AND COUNT(DISTINCT CASE WHEN m.skill_level = 'intermediate' THEN m.rider_id END) > 0
    AND COUNT(DISTINCT CASE WHEN m.skill_level = 'expert' THEN m.rider_id END) > 0
ORDER BY r.distance DESC;