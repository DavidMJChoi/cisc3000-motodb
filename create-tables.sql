-- DDL includes
-- * Create tables
-- * Create Views
-- * Create Functions
-- * Create Procedures


CREATE TABLE Member (
    rider_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    join_date DATE NOT NULL,
    skill_level ENUM('beginner', 'intermediate', 'expert') NOT NULL
);

CREATE TABLE Motorcycle (
    bike_id INT AUTO_INCREMENT PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT CHECK (year > 1900),
    engine_size DECIMAL(5,2),
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(rider_id)
);

CREATE TABLE RideRoute (
    route_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    difficulty ENUM('easy', 'medium', 'hard', 'expert'),
    distance DECIMAL(6,2),
    description TEXT
);

CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date DATETIME NOT NULL,
    location VARCHAR(200) NOT NULL,
    description TEXT,
    route_id INT,
    organizer_id INT,
    FOREIGN KEY (route_id) REFERENCES RideRoute(route_id),
    FOREIGN KEY (organizer_id) REFERENCES Member(rider_id),
    CHECK (date > NOW())
);

CREATE TABLE EventParticipation (
    participation_id INT AUTO_INCREMENT PRIMARY KEY,
    event_id INT,
    rider_id INT,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (rider_id) REFERENCES Member(rider_id),
    UNIQUE (event_id, rider_id)
);

CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    bike_id INT,
    service_date DATE NOT NULL,
    service_type VARCHAR(100) NOT NULL,
    cost DECIMAL(8,2) CHECK (cost > 0),
    notes TEXT,
    FOREIGN KEY (bike_id) REFERENCES Motorcycle(bike_id)
);

CREATE TABLE Sponsor (
    sponsor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    partnership_level ENUM('bronze', 'silver', 'gold', 'platinum')
);

CREATE TABLE EventSponsor (
    event_id INT,
    sponsor_id INT,
    contribution_amount DECIMAL(10,2),
    PRIMARY KEY (event_id, sponsor_id),
    FOREIGN KEY (event_id) REFERENCES Event(event_id),
    FOREIGN KEY (sponsor_id) REFERENCES Sponsor(sponsor_id)
);



-- Create Views

CREATE VIEW UpcomingEvents AS
SELECT e.name, e.date, e.location, r.name AS route, m.name AS organizer
FROM Event e
JOIN RideRoute r ON e.route_id = r.route_id
JOIN Member m ON e.organizer_id = m.rider_id
WHERE e.date > NOW()
ORDER BY e.date;

CREATE VIEW MemberBikes AS
SELECT m.name AS member, mc.make, mc.model, mc.year, mc.engine_size
FROM Member m
JOIN Motorcycle mc ON m.rider_id = mc.member_id
ORDER BY m.name, mc.year DESC;



-- Create Functions and Procedures

-- Functions

DELIMITER //
CREATE FUNCTION CalculateRideDuration(ride_distance DECIMAL(6,2), avg_speed DECIMAL(5,2))
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE duration DECIMAL(5,2);
    SET duration = ride_distance / avg_speed;
    RETURN duration;
END //
DELIMITER ;

-- Procedures

DELIMITER //
CREATE PROCEDURE GetMembersBySkillLevel(IN skill VARCHAR(20))
BEGIN
    SELECT name, email, phone, join_date
    FROM Member
    WHERE skill_level = skill
    ORDER BY join_date;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ScheduleMaintenance(
    IN bike_id INT,
    IN service_type VARCHAR(100),
    IN estimated_cost DECIMAL(8,2),
    IN notes TEXT
)
BEGIN
    INSERT INTO Maintenance (bike_id, service_date, service_type, cost, notes)
    VALUES (bike_id, CURDATE(), service_type, estimated_cost, notes);
END //
DELIMITER ;