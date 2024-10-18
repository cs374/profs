ALTER TABLE `Organizer` COMMENT = 'Tracks the roles of the madiSTEM organizers by year (M-N with event).';

ALTER TABLE `Person` COMMENT = 'The super class entity for all types of people, with their basic information.';

ALTER TABLE `Department` COMMENT = 'Needed for name lookups and thank-you emails.';

ALTER TABLE `College` COMMENT = 'Needed for name lookups and thank-you emails.';

ALTER TABLE `Event` COMMENT = 'More attributes to be added later: guest speaker, theme, etc.';

ALTER TABLE `Person_Workshop` COMMENT = 'Connects a person to a workshop with a specific role.';

ALTER TABLE `Workshop` COMMENT = 'Holds all the workshop information.';

ALTER TABLE `Room` COMMENT = 'Rooms on campus that may be used by madiSTEM (see https://www.lib.jmu.edu/tech-classrooms/).';

ALTER TABLE `TimeSlot` COMMENT = 'An event is divided into time slots -- these are the schedule for the day.';

ALTER TABLE `Workshop_TimeSlot` COMMENT = 'Connects the workshop to slot M-N, because many workshops can be scheduled in the same slot.';

ALTER TABLE `Room_Feature` COMMENT = 'M-N connection between room and features.';

ALTER TABLE `Feature` COMMENT = 'Just to lookup some features like sink, computers, projector, etc.';
