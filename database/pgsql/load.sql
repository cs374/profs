\copy "College" FROM '../data/College.csv' CSV HEADER
\copy "Department" FROM '../data/Department.csv' CSV HEADER

\copy "Room" FROM '../data/Room.csv' CSV HEADER
\copy "Feature" FROM '../data/Feature.csv' CSV HEADER
\copy "Room_Feature" FROM '../data/Room_Feature.csv' CSV HEADER

INSERT INTO "Event" VALUES
  (2024, '2024-03-23');

INSERT INTO "TimeSlot" VALUES
  (2024, 1, 'Workshop Period 1', '09:50', '10:50'),
  (2024, 2, 'Workshop Period 2', '11:00', '12:00'),
  (2024, 3, 'Workshop Period 3', '13:35', '14:35');
