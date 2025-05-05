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


USE bike_club;
START TRANSACTION;

-- Member: Insert 10 additional records (total 15 with existing 5)
INSERT INTO Member (name, phone, email, join_date, skill_level) VALUES
('Frank Spoke', '555-0206', 'frank.spoke@gmail.com', '2020-04-22', 'beginner'),
('Grace Pedal', '555-0207', 'grace.pedal@gmail.com', '2021-08-30', 'intermediate'),
('Henry Crank', '555-0208', 'henry.crank@gmail.com', '2022-11-10', 'expert'),
('Isabel Chain', '555-0209', 'isabel.chain@gmail.com', '2023-02-14', 'beginner'),
('Jack Sprocket', '555-0210', 'jack.sprocket@gmail.com', '2019-07-19', 'intermediate'),
('Kelly Frame', '555-0211', 'kelly.frame@gmail.com', '2021-12-05', 'expert'),
('Liam Hub', '555-0212', 'liam.hub@gmail.com', '2022-06-25', 'beginner'),
('Mia Fork', '555-0213', 'mia.fork@gmail.com', '2020-10-08', 'intermediate'),
('Noah Rim', '555-0214', 'noah.rim@gmail.com', '2023-05-17', 'expert'),
('Olivia Tire', '555-0215', 'olivia.tire@gmail.com', '2021-03-01', 'beginner');

-- Motorcycle: Insert 10 additional records (total 15 with existing 5)
INSERT INTO Motorcycle (make, model, year, engine_size, member_id) VALUES
('Honda', 'CBR1000RR', 2020, 1.00, 6),
('Yamaha', 'YZF-R1', 2021, 1.00, 7),
('Harley-Davidson', 'Sportster', 2019, 0.88, 8),
('KTM', 'Duke 390', 2022, 0.39, 9),
('Ducati', 'Monster 821', 2020, 0.82, 10),
('Kawasaki', 'Versys 650', 2021, 0.65, 11),
('BMW', 'R1250GS', 2022, 1.25, 12),
('Suzuki', 'SV650', 2019, 0.65, 13),
('Triumph', 'Bonneville T120', 2020, 1.20, 14),
('Honda', 'CB500F', 2021, 0.50, 15);

-- RideRoute: Insert 10 additional records (total 15 with existing 5)
INSERT INTO RideRoute (name, difficulty, distance, description) VALUES
('City Circuit', 'easy', 25.50, 'Urban ride through downtown with light traffic.'),
('Canyon Carve', 'hard', 90.75, 'Twisty route through narrow canyon roads.'),
('Lakeside Loop', 'medium', 60.25, 'Scenic ride around a serene lake.'),
('Highway Haul', 'easy', 150.00, 'Long, straight ride on open highways.'),
('Cliffside Cruise', 'expert', 110.50, 'Challenging ride along steep cliffs.'),
('Prairie Path', 'easy', 45.00, 'Flat, open ride through grasslands.'),
('Hill Climb', 'hard', 80.25, 'Steep ascents and descents in hilly terrain.'),
('River Run', 'medium', 70.50, 'Ride following a winding river.'),
('Night Ride', 'expert', 55.75, 'After-dark ride with illuminated paths.'),
('Vineyard Venture', 'easy', 35.25, 'Gentle ride through wine country.');

-- Event: Insert 10 additional records (total 15 with existing 5)
-- Dates are in the future to satisfy the check_event_date trigger
INSERT INTO Event (name, date, location, description, route_id, organizer_id) VALUES
('City Sprint', '2025-11-01 10:00:00', 'San Diego, CA', 'Fast-paced urban group ride.', 6, 6),
('Canyon Quest', '2025-12-15 08:30:00', 'Flagstaff, AZ', 'Thrilling canyon group adventure.', 7, 7),
('Lakeside Rally', '2026-01-10 09:00:00', 'Lake Tahoe, NV', 'Scenic group ride with camping.', 8, 8),
('Highway Journey', '2025-11-20 07:00:00', 'Phoenix, AZ', 'Long-distance group cruise.', 9, 9),
('Cliffside Challenge', '2026-02-05 06:30:00', 'Big Sur, CA', 'Expert-level coastal ride.', 10, 10),
('Prairie Picnic', '2025-10-25 11:00:00', 'Omaha, NE', 'Relaxed ride with group picnic.', 11, 11),
('Hilltop Hustle', '2025-12-01 09:30:00', 'Boulder, CO', 'Challenging hill climb event.', 12, 12),
('River Rally', '2026-03-15 10:30:00', 'Asheville, NC', 'Group ride along scenic rivers.', 13, 13),
('Night Cruise', '2025-11-15 19:00:00', 'Miami, FL', 'Evening ride with city lights.', 14, 14),
('Vineyard Voyage', '2026-04-10 12:00:00', 'Sonoma, CA', 'Wine country group ride.', 15, 15);

-- EventParticipation: Insert 15 additional records (total 23 with existing 8)
INSERT INTO EventParticipation (event_id, rider_id) VALUES
(6, 6), (6, 7), (6, 8),
(7, 7), (7, 9),
(8, 8), (8, 10), (8, 11),
(9, 9), (9, 12),
(10, 10), (10, 13),
(11, 11), (11, 14), (11, 15);

-- Maintenance: Insert 10 additional records (total 15 with existing 5)
INSERT INTO Maintenance (bike_id, service_date, service_type, cost, notes) VALUES
(6, '2025-03-01', 'Oil Change', 80.00, 'Standard oil change.'),
(7, '2025-04-10', 'Tire Replacement', 220.00, 'Replaced rear tire.'),
(8, '2025-05-15', 'Brake Service', 130.00, 'New brake pads installed.'),
(9, '2025-06-20', 'Chain Adjustment', 50.00, 'Tightened and lubricated.'),
(10, '2025-07-01', 'Full Service', 400.00, 'Comprehensive maintenance.'),
(11, '2025-08-05', 'Oil Change', 90.00, 'Used high-performance oil.'),
(12, '2025-09-10', 'Tire Replacement', 270.00, 'Both tires replaced.'),
(13, '2025-10-15', 'Brake Service', 140.00, 'Brake fluid flush.'),
(14, '2025-11-20', 'Chain Adjustment', 55.00, 'Adjusted chain tension.'),
(15, '2025-12-01', 'Full Service', 380.00, 'Annual tune-up.');

-- Sponsor: Insert 10 additional records (total 15 with existing 5)
INSERT INTO Sponsor (name, contact_person, phone, email, partnership_level) VALUES
('BikeZone', 'James Carter', '555-0306', 'james.carter@gmail.com', 'gold'),
('SpeedShop', 'Emily Davis', '555-0307', 'emily.davis@gmail.com', 'silver'),
('RideNow', 'Michael Chen', '555-0308', 'michael.chen@gmail.com', 'bronze'),
('CycleWorks', 'Sophie Adams', '555-0309', 'sophie.adams@gmail.com', 'platinum'),
('MotoHub', 'Daniel Kim', '555-0310', 'daniel.kim@gmail.com', 'silver'),
('GearZone', 'Rachel Patel', '555-0311', 'rachel.patel@gmail.com', 'gold'),
('SpeedTire', 'Chris Evans', '555-0312', 'chris.evans@gmail.com', 'bronze'),
('BikeCraft', 'Laura White', '555-0313', 'laura.white@gmail.com', 'silver'),
('RideFast', 'Steven Brown', '555-0314', 'steven.brown@gmail.com', 'platinum'),
('CycleGear', 'Megan Lee', '555-0315', 'megan.lee@gmail.com', 'gold');

-- EventSponsor: Insert 10 additional records (total 16 with existing 6)
INSERT INTO EventSponsor (event_id, sponsor_id, contribution_amount) VALUES
(6, 6, 4500.00),
(7, 7, 2000.00),
(8, 8, 1000.00),
(9, 9, 6000.00),
(10, 10, 3500.00),
(11, 11, 4000.00),
(12, 12, 1200.00),
(13, 13, 2500.00),
(14, 14, 5500.00),
(15, 15, 3000.00);

COMMIT;