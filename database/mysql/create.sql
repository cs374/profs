CREATE TABLE organizer (
  event_year int,
  person_email varchar(32),
  roles varchar(512) NOT NULL COMMENT 'Comma-separated list of responsibilities',
  PRIMARY KEY (event_year, person_email)
);

CREATE TABLE person (
  email varchar(32) PRIMARY KEY COMMENT 'Use email as the unique identifier for all people',
  type varchar(32) NOT NULL COMMENT 'Ex: student, faculty, other',
  first_name varchar(32) NOT NULL,
  last_name varchar(32) NOT NULL,
  phone varchar(16),
  department_code varchar(8) NOT NULL
);

CREATE TABLE department (
  code varchar(8) PRIMARY KEY COMMENT 'Ex: CS',
  name varchar(64) NOT NULL,
  auh_full_name varchar(32) NOT NULL,
  auh_email varchar(32) NOT NULL,
  college_code varchar(8) NOT NULL
);

CREATE TABLE college (
  code varchar(8) PRIMARY KEY COMMENT 'Ex: CISE',
  name varchar(64) NOT NULL,
  dean_full_name varchar(32) NOT NULL,
  dean_email varchar(32) NOT NULL,
  dean_first_name varchar(32) NOT NULL
);

CREATE TABLE event (
  year int PRIMARY KEY COMMENT 'One event per year',
  date date NOT NULL COMMENT 'The exact date of the event'
);

CREATE TABLE person_workshop (
  person_email varchar(32),
  workshop_id int,
  role varchar(32) NOT NULL COMMENT 'Ex: organizer, volunteer',
  PRIMARY KEY (person_email, workshop_id)
);

CREATE TABLE workshop (
  id int PRIMARY KEY AUTO_INCREMENT COMMENT 'Generated auto-increment ID because the title may be edited over time.  This ID is unique across years.',
  state varchar(32) NOT NULL COMMENT 'The state of the workshop -- proposed, accepted, file, etc.  The exact states are not fully defined.',
  title varchar(64) NOT NULL,
  advertisement varchar(512) COMMENT 'The workshop description to be shown on the website.',
  description varchar(1024) COMMENT 'The full description of the workshop maybe with much more detail than the advertisement.',
  capacity int COMMENT 'The max number of students that can be accommodated in this workshop.',
  computer_needs varchar(128),
  room_needs varchar(128),
  max_repeat int COMMENT 'The number of times this workshop can be offered during the day.',
  parent_questions varchar(1024) COMMENT 'Follow-up information/questions for the attendee to share with their parents post event.',
  other_information varchar(512) COMMENT 'Any other information about the workshop to be shared with the organizers.',
  event_year int NOT NULL COMMENT 'Not part of the key, but required.',
  room_name varchar(32) COMMENT 'The room is assigned later in the process, so it can be null.'
);

CREATE TABLE room (
  name varchar(32) PRIMARY KEY COMMENT 'The short name of the room, like King 250',
  type varchar(32) NOT NULL COMMENT 'Ex: classroom, lab',
  capacity int NOT NULL,
  notes varchar(64)
);

CREATE TABLE timeslot (
  event_year int,
  id int COMMENT 'The slots are numbered 1..N from earliest to latest',
  name varchar(32) NOT NULL COMMENT 'Ex: registration, lunch, speaker, workshops',
  beg_time time NOT NULL,
  end_time time NOT NULL,
  PRIMARY KEY (event_year, id)
);

CREATE TABLE workshop_timeslot (
  workshop_id int,
  timeslot_event_year int,
  timeslot_id int,
  PRIMARY KEY (workshop_id, timeslot_event_year, timeslot_id)
);

CREATE TABLE room_feature (
  room_name varchar(32),
  feature_name varchar(32),
  PRIMARY KEY (room_name, feature_name)
);

CREATE TABLE feature (
  name varchar(32) PRIMARY KEY,
  description varchar(128)
);
