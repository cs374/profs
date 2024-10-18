ALTER TABLE "Organizer" ADD FOREIGN KEY ("Event_Year") REFERENCES "Event" ("Year");

ALTER TABLE "Organizer" ADD FOREIGN KEY ("Person_Email") REFERENCES "Person" ("Email");

ALTER TABLE "Person" ADD FOREIGN KEY ("Department_Code") REFERENCES "Department" ("Code");

ALTER TABLE "Department" ADD FOREIGN KEY ("College_Code") REFERENCES "College" ("Code");

ALTER TABLE "Person_Workshop" ADD FOREIGN KEY ("Person_Email") REFERENCES "Person" ("Email");

ALTER TABLE "Person_Workshop" ADD FOREIGN KEY ("Workshop_ID") REFERENCES "Workshop" ("ID");

ALTER TABLE "Workshop" ADD FOREIGN KEY ("Event_Year") REFERENCES "Event" ("Year");

ALTER TABLE "Workshop" ADD FOREIGN KEY ("Room_Name") REFERENCES "Room" ("Name");

ALTER TABLE "TimeSlot" ADD FOREIGN KEY ("Event_Year") REFERENCES "Event" ("Year");

ALTER TABLE "Workshop_TimeSlot" ADD FOREIGN KEY ("Workshop_ID") REFERENCES "Workshop" ("ID");

ALTER TABLE "Workshop_TimeSlot" ADD FOREIGN KEY ("TimeSlot_Event_Year") REFERENCES "TimeSlot" ("Event_Year");

ALTER TABLE "Workshop_TimeSlot" ADD FOREIGN KEY ("TimeSlot_ID") REFERENCES "TimeSlot" ("ID");

ALTER TABLE "Room_Feature" ADD FOREIGN KEY ("Room_Name") REFERENCES "Room" ("Name");

ALTER TABLE "Room_Feature" ADD FOREIGN KEY ("Feature_Name") REFERENCES "Feature" ("Name");
