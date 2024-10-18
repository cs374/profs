COMMENT ON TABLE "Organizer" IS 'Tracks the roles of the madiSTEM organizers by year (M-N with event).';

COMMENT ON COLUMN "Organizer"."Roles" IS 'Comma-separated list of responsibilities';

COMMENT ON TABLE "Person" IS 'The super class entity for all types of people, with their basic information.';

COMMENT ON COLUMN "Person"."Email" IS 'Use email as the unique identifier for all people';

COMMENT ON COLUMN "Person"."Type" IS 'Ex: student, faculty, other';

COMMENT ON TABLE "Department" IS 'Needed for name lookups and thank-you emails.';

COMMENT ON COLUMN "Department"."Code" IS 'Ex: CS';

COMMENT ON TABLE "College" IS 'Needed for name lookups and thank-you emails.';

COMMENT ON COLUMN "College"."Code" IS 'Ex: CISE';

COMMENT ON TABLE "Event" IS 'More attributes to be added later: guest speaker, theme, etc.';

COMMENT ON COLUMN "Event"."Year" IS 'One event per year';

COMMENT ON COLUMN "Event"."Date" IS 'The exact date of the event';

COMMENT ON TABLE "Person_Workshop" IS 'Connects a person to a workshop with a specific role.';

COMMENT ON COLUMN "Person_Workshop"."Role" IS 'Ex: organizer, volunteer';

COMMENT ON TABLE "Workshop" IS 'Holds all the workshop information.';

COMMENT ON COLUMN "Workshop"."ID" IS 'Generated auto-increment ID because the title may be edited over time.  This ID is unique across years.';

COMMENT ON COLUMN "Workshop"."State" IS 'The state of the workshop -- proposed, accepted, file, etc.  The exact states are not fully defined.';

COMMENT ON COLUMN "Workshop"."Advertisement" IS 'The workshop description to be shown on the website.';

COMMENT ON COLUMN "Workshop"."Description" IS 'The full description of the workshop maybe with much more detail than the advertisement.';

COMMENT ON COLUMN "Workshop"."Capacity" IS 'The max number of students that can be accommodated in this workshop.';

COMMENT ON COLUMN "Workshop"."MaxRepeat" IS 'The number of times this workshop can be offered during the day.';

COMMENT ON COLUMN "Workshop"."ParentQuestions" IS 'Follow-up information/questions for the attendee to share with their parents post event.';

COMMENT ON COLUMN "Workshop"."OtherInformation" IS 'Any other information about the workshop to be shared with the organizers.';

COMMENT ON COLUMN "Workshop"."Event_Year" IS 'Not part of the key, but required.';

COMMENT ON COLUMN "Workshop"."Room_Name" IS 'The room is assigned later in the process, so it can be null.';

COMMENT ON TABLE "Room" IS 'Rooms on campus that may be used by madiSTEM.';

COMMENT ON COLUMN "Room"."Name" IS 'The short name of the room, like King 250';

COMMENT ON COLUMN "Room"."Type" IS 'Ex: classroom, lab';

COMMENT ON TABLE "TimeSlot" IS 'An event is divided into time slots -- these are the schedule for the day.';

COMMENT ON COLUMN "TimeSlot"."ID" IS 'The slots are numbered 1..N from earliest to latest';

COMMENT ON COLUMN "TimeSlot"."Name" IS 'Ex: registration, lunch, speaker, workshops';

COMMENT ON TABLE "Workshop_TimeSlot" IS 'Connects the workshop to slot M-N, because many workshops can be scheduled in the same slot.';

COMMENT ON TABLE "Room_Feature" IS 'M-N connection between room and features (see https://www.lib.jmu.edu/tech-classrooms/).';

COMMENT ON TABLE "Feature" IS 'Just to lookup some features like sink, computers, projector, etc.';
