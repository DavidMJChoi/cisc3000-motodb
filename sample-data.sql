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