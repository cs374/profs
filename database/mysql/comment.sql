ALTER TABLE organizer COMMENT = 'Tracks the roles of the madiSTEM organizers by year (M-N with event).';

ALTER TABLE person COMMENT = 'The super class entity for all types of people, with their basic information.';

ALTER TABLE department COMMENT = 'Needed for name lookups and thank-you emails.';

ALTER TABLE college COMMENT = 'Needed for name lookups and thank-you emails.';

ALTER TABLE event COMMENT = 'More attributes to be added later: guest speaker, theme, etc.';

ALTER TABLE person_workshop COMMENT = 'Connects a person to a workshop with a specific role.';

ALTER TABLE workshop COMMENT = 'Holds all the workshop information.';

ALTER TABLE room COMMENT = 'Rooms on campus that may be used by madiSTEM.';

ALTER TABLE timeslot COMMENT = 'An event is divided into time slots -- these are the schedule for the day.';

ALTER TABLE workshop_timeslot COMMENT = 'Connects the workshop to slot M-N, because many workshops can be scheduled in the same slot.';

ALTER TABLE room_feature COMMENT = 'M-N connection between room and features (see https://www.lib.jmu.edu/tech-classrooms/).';

ALTER TABLE feature COMMENT = 'Just to lookup some features like sink, computers, projector, etc.';
