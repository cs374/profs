LOAD DATA LOCAL INFILE '../data/college.csv'
INTO TABLE college
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '../data/department.csv'
INTO TABLE department
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '../data/room.csv'
INTO TABLE room
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '../data/feature.csv'
INTO TABLE feature
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '../data/room_feature.csv'
INTO TABLE room_feature
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

INSERT INTO event VALUES
  (2024, '2024-03-23');

INSERT INTO timeslot VALUES
  (2024, 1, 'Workshop Period 1', '09:50', '10:50'),
  (2024, 2, 'Workshop Period 2', '11:00', '12:00'),
  (2024, 3, 'Workshop Period 3', '13:35', '14:35');
