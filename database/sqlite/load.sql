.import ../data/college.csv college --csv --skip 1
.import ../data/department.csv department --csv --skip 1

.import ../data/room.csv room --csv --skip 1
.import ../data/feature.csv feature --csv --skip 1
.import ../data/room_feature.csv room_feature --csv --skip 1

INSERT INTO event VALUES
  (2024, '2024-03-23');

INSERT INTO timeslot VALUES
  (2024, 1, 'Workshop Period 1', '09:50', '10:50'),
  (2024, 2, 'Workshop Period 2', '11:00', '12:00'),
  (2024, 3, 'Workshop Period 3', '13:35', '14:35');
