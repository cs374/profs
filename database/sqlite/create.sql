-- Tracks the roles of the madiSTEM organizers by year (M-N with event).
CREATE TABLE organizer (
  event_year int,
  person_email varchar(32),
  roles varchar(512) NOT NULL,  -- Comma-separated list of responsibilities
  PRIMARY KEY (event_year, person_email),
  FOREIGN KEY (event_year) REFERENCES event (year),
  FOREIGN KEY (person_email) REFERENCES person (email)
);

-- The super class entity for all types of people, with their basic information.
CREATE TABLE person (
  email varchar(32) PRIMARY KEY,  -- Use email as the unique identifier for all people
  type varchar(32) NOT NULL,  -- Ex: student, faculty, other
  first_name varchar(32) NOT NULL,
  last_name varchar(32) NOT NULL,
  phone varchar(16),
  department_code varchar(8) NOT NULL,
  FOREIGN KEY (department_code) REFERENCES department (code)
);

-- Needed for name lookups and thank-you emails.
CREATE TABLE department (
  code varchar(8) PRIMARY KEY,  -- Ex: CS
  name varchar(64) NOT NULL,
  auh_full_name varchar(32) NOT NULL,
  auh_email varchar(32) NOT NULL,
  college_code varchar(8) NOT NULL,
  FOREIGN KEY (college_code) REFERENCES college (code)
);

-- Needed for name lookups and thank-you emails.
CREATE TABLE college (
  code varchar(8) PRIMARY KEY,  -- Ex: CISE
  name varchar(64) NOT NULL,
  dean_full_name varchar(32) NOT NULL,
  dean_email varchar(32) NOT NULL,
  dean_first_name varchar(32) NOT NULL
);

-- More attributes to be added later: guest speaker, theme, etc.
CREATE TABLE event (
  year int PRIMARY KEY,  -- One event per year
  date date NOT NULL  -- The exact date of the event
);

-- Connects a person to a workshop with a specific role.
CREATE TABLE person_workshop (
  person_email varchar(32),
  workshop_id int,
  role varchar(32) NOT NULL,  -- Ex: organizer, volunteer
  PRIMARY KEY (person_email, workshop_id),
  FOREIGN KEY (person_email) REFERENCES person (email),
  FOREIGN KEY (workshop_id) REFERENCES workshop (id)
);

-- Holds all the workshop information.
CREATE TABLE workshop (
  id integer PRIMARY KEY AUTOINCREMENT,  -- Generated auto-increment ID because the title may be edited over time.  This ID is unique across years.
  state varchar(32) NOT NULL,  -- The state of the workshop -- proposed, accepted, file, etc.  The exact states are not fully defined.
  title varchar(64) NOT NULL,
  advertisement varchar(512),  -- The workshop description to be shown on the website.
  description varchar(1024),  -- The full description of the workshop maybe with much more detail than the advertisement.
  capacity int,  -- The max number of students that can be accommodated in this workshop.
  computer_needs varchar(128),
  room_needs varchar(128),
  max_repeat int,  -- The number of times this workshop can be offered during the day.
  parent_questions varchar(1024),  -- Follow-up information/questions for the attendee to share with their parents post event.
  other_information varchar(512),  -- Any other information about the workshop to be shared with the organizers.
  event_year int NOT NULL,  -- Not part of the key, but required.
  room_name varchar(32),  -- The room is assigned later in the process, so it can be null.
  FOREIGN KEY (event_year) REFERENCES event (year),
  FOREIGN KEY (room_name) REFERENCES room (name)
);

-- Rooms on campus that may be used by madiSTEM.
CREATE TABLE room (
  name varchar(32) PRIMARY KEY,  -- The short name of the room, like King 250
  type varchar(32) NOT NULL,  -- Ex: classroom, lab
  capacity int NOT NULL,
  notes varchar(64)
);

-- An event is divided into time slots -- these are the schedule for the day.
CREATE TABLE timeslot (
  event_year int,
  id int,  -- The slots are numbered 1..N from earliest to latest
  name varchar(32) NOT NULL,  -- Ex: registration, lunch, speaker, workshops
  beg_time time NOT NULL,
  end_time time NOT NULL,
  PRIMARY KEY (event_year, id),
  FOREIGN KEY (event_year) REFERENCES event (year)
);

-- Connects the workshop to slot M-N, because many workshops can be scheduled in the same slot.
CREATE TABLE workshop_timeslot (
  workshop_id int,
  timeslot_event_year int,
  timeslot_id int,
  PRIMARY KEY (workshop_id, timeslot_event_year, timeslot_id),
  FOREIGN KEY (workshop_id) REFERENCES workshop (id),
  FOREIGN KEY (timeslot_event_year, timeslot_id) REFERENCES timeslot (event_year, id)
);

-- M-N connection between room and features (see https://www.lib.jmu.edu/tech-classrooms/)
CREATE TABLE room_feature (
  room_name varchar(32),
  feature_name varchar(32),
  PRIMARY KEY (room_name, feature_name),
  FOREIGN KEY (room_name) REFERENCES room (name),
  FOREIGN KEY (feature_name) REFERENCES feature (name)
);

-- Just to lookup some features like sink, computers, projector, etc.
CREATE TABLE feature (
  name varchar(32) PRIMARY KEY,
  description varchar(128)
);
