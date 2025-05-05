-- Member sample data

INSERT INTO Member (name, phone, email, join_date, skill_level) VALUES
('John Rider', '555-0101', 'john@example.com', '2020-05-15', 'intermediate'),
('Sarah Cruiser', '555-0102', 'sarah@example.com', '2019-08-22', 'expert'),
('Mike Biker', '555-0103', 'mike@example.com', '2021-03-10', 'beginner');



-- Motorcycle sample data

INSERT INTO Motorcycle (make, model, year, engine_size, member_id) VALUES
('Harley-Davidson', 'Street Glide', 2020, 107.0, 1),
('Honda', 'CBR600RR', 2018, 0.6, 2),
('Yamaha', 'MT-07', 2019, 0.7, 3);

-- More To-dos


-- BANKEY 2025-05-05
Use bike_club;
START TRANSACTION;
-- Member data
INSERT INTO Member (name, phone, email, join_date, skill_level) VALUES
('Alice Wheeler', '555-0201', 'alice.wheeler@gmail.com', '2021-06-10', 'expert'),
('Bob Throttle', '555-0202', 'bob.throttle@gmail.com', '2022-01-15', 'intermediate'),
('Carol Gear', '555-0203', 'carol.gear@gmail.com', '2020-09-05', 'beginner'),
('David Spark', '555-0204', 'david.spark@gmail.com', '2019-11-20', 'expert'),
('Emma Brake', '555-0205', 'emma.brake@gmail.com', '2023-03-12', 'intermediate');

-- Motorcycle data
INSERT INTO Motorcycle (make, model, year, engine_size, member_id) VALUES
('Ducati', 'Panigale V4', 2021, 1.10, 1),
('Kawasaki', 'Ninja ZX-10R', 2019, 1.00, 2),
('BMW', 'S1000RR', 2020, 1.00, 3),
('Triumph', 'Street Triple', 2022, 0.77, 4),
('Suzuki', 'GSX-R750', 2018, 0.75, 5);

-- RideRoute data
INSERT INTO RideRoute (name, difficulty, distance, description) VALUES
('Coastal Cruise', 'easy', 50.25, 'Scenic ride along the coastline with gentle curves.'),
('Mountain Challenge', 'hard', 120.50, 'Thrilling route through steep mountain passes.'),
('Valley Loop', 'medium', 75.75, 'Moderate ride through rolling hills and valleys.'),
('Desert Dash', 'expert', 200.00, 'Demanding ride across desert terrain with extreme conditions.'),
('Forest Trail', 'easy', 30.00, 'Relaxing ride through lush forest paths.');

-- Event data
INSERT INTO Event (name, date, location, description, route_id, organizer_id) VALUES
('Summer Rally', '2025-07-15 09:00:00', 'Santa Cruz, CA', 'Annual motorcycle rally with group rides and shows.', 1, 1),
('Mountain Run', '2025-08-20 08:00:00', 'Aspen, CO', 'Challenging group ride through the Rockies.', 2, 4),
('Valley Ride', '2025-06-10 10:00:00', 'Napa, CA', 'Casual ride with wine tasting stops.', 3, 2),
('Desert Blitz', '2025-09-05 07:00:00', 'Las Vegas, NV', 'High-speed desert adventure.', 4, 5),
('Forest Escape', '2025-10-12 11:00:00', 'Portland, OR', 'Relaxed ride through scenic forests.', 5, 3);

-- EventParticipation data
INSERT INTO EventParticipation (event_id, rider_id) VALUES
(1, 1),
(1, 2),
(2, 4),
(3, 2),
(3, 3),
(4, 5),
(5, 3),
(5, 1);

-- Maintenance data
INSERT INTO Maintenance (bike_id, service_date, service_type, cost, notes) VALUES
(1, '2025-01-10', 'Oil Change', 75.50, 'Used synthetic oil.'),
(2, '2025-02-15', 'Tire Replacement', 250.00, 'Replaced both tires.'),
(3, '2025-03-20', 'Chain Adjustment', 45.75, 'Adjusted and lubricated chain.'),
(4, '2025-04-05', 'Brake Service', 120.00, 'Replaced brake pads.'),
(5, '2025-05-01', 'Full Service', 350.00, 'Complete tune-up and inspection.');

-- Sponsor data
INSERT INTO Sponsor (name, contact_person, phone, email, partnership_level) VALUES
('MotoGear', 'Lisa Smith', '555-0301', 'lisa.smith@gmail.com', 'gold'),
('SpeedParts', 'Tom Jones', '555-0302', 'tom.jones@gmail.com', 'silver'),
('RideSafe', 'Anna Brown', '555-0303', 'anna.brown@gmail.com', 'bronze'),
('TurboTires', 'Mark Wilson', '555-0304', 'mark.wilson@gmail.com', 'platinum'),
('GearUp', 'Sarah Lee', '555-0305', 'sarah.lee@gmail.com', 'silver');

-- EventSponsor data
INSERT INTO EventSponsor (event_id, sponsor_id, contribution_amount) VALUES
(1, 1, 5000.00),
(1, 3, 1500.00),
(2, 2, 3000.00),
(3, 4, 7000.00),
(4, 5, 2500.00),
(5, 1, 4000.00);

COMMIT;