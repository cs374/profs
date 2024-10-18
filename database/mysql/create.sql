CREATE TABLE `Organizer` (
  `Event_Year` int,
  `Person_Email` varchar(32),
  `Roles` varchar(512) NOT NULL COMMENT 'Comma-separated list of responsibilities',
  PRIMARY KEY (`Event_Year`, `Person_Email`)
);

CREATE TABLE `Person` (
  `Email` varchar(32) PRIMARY KEY COMMENT 'Use email as the unique identifier for all people',
  `Type` varchar(32) NOT NULL COMMENT 'Ex: student, faculty, other',
  `FirstName` varchar(32) NOT NULL,
  `LastName` varchar(32) NOT NULL,
  `Phone` varchar(10),
  `Department_Code` varchar(8) NOT NULL
);

CREATE TABLE `Department` (
  `Code` varchar(8) PRIMARY KEY COMMENT 'Ex: CS',
  `Name` varchar(64) NOT NULL,
  `AUHFullName` varchar(32) NOT NULL,
  `AUHEmail` varchar(32) NOT NULL,
  `College_Code` varchar(8) NOT NULL
);

CREATE TABLE `College` (
  `Code` varchar(8) PRIMARY KEY COMMENT 'Ex: CISE',
  `Name` varchar(64) NOT NULL,
  `DeanFullName` varchar(32) NOT NULL,
  `DeanEmail` varchar(32) NOT NULL,
  `DeanFirstName` varchar(32) NOT NULL
);

CREATE TABLE `Event` (
  `Year` int PRIMARY KEY COMMENT 'One event per year',
  `Date` date NOT NULL COMMENT 'The exact date of the event'
);

CREATE TABLE `Person_Workshop` (
  `Person_Email` varchar(32),
  `Workshop_ID` int,
  `Role` varchar(32) NOT NULL COMMENT 'Ex: organizer, volunteer',
  PRIMARY KEY (`Person_Email`, `Workshop_ID`)
);

CREATE TABLE `Workshop` (
  `ID` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Generated auto-increment ID because the title may be edited over time.  This ID is unique across years.',
  `State` varchar(32) NOT NULL COMMENT 'The state of the workshop -- proposed, accepted, file, etc.  The exact states are not fully defined.',
  `Title` varchar(64) NOT NULL,
  `Advertisement` varchar(512) COMMENT 'The workshop description to be shown on the website.',
  `Description` varchar(1024) COMMENT 'The full description of the workshop maybe with much more detail than the advertisement.',
  `Capacity` int COMMENT 'The max number of students that can be accommodated in this workshop.',
  `ComputerNeeds` varchar(128),
  `RoomNeeds` varchar(128),
  `MaxRepeat` int COMMENT 'The number of times this workshop can be offered during the day.',
  `ParentQuestions` varchar(1024) COMMENT 'Follow-up information/questions for the attendee to share with their parents post event.',
  `OtherInformation` varchar(512) COMMENT 'Any other information about the workshop to be shared with the organizers.',
  `Event_Year` int NOT NULL COMMENT 'Not part of the key, but required.',
  `Room_Name` varchar(32) COMMENT 'The room is assigned later in the process, so it can be null.'
);

CREATE TABLE `Room` (
  `Name` varchar(32) PRIMARY KEY COMMENT 'The short name of the room, like King 250',
  `Type` varchar(32) NOT NULL COMMENT 'Ex: classroom, lab',
  `Capacity` int NOT NULL,
  `Notes` varchar(64)
);

CREATE TABLE `TimeSlot` (
  `Event_Year` int,
  `ID` int COMMENT 'The slots are numbered 1..N from earliest to latest',
  `Name` varchar(32) NOT NULL COMMENT 'Ex: registration, lunch, speaker, workshops',
  `BegTime` time NOT NULL,
  `EndTime` time NOT NULL,
  PRIMARY KEY (`Event_Year`, `ID`)
);

CREATE TABLE `Workshop_TimeSlot` (
  `Workshop_ID` int,
  `TimeSlot_Event_Year` int,
  `TimeSlot_ID` int,
  PRIMARY KEY (`Workshop_ID`, `TimeSlot_Event_Year`, `TimeSlot_ID`)
);

CREATE TABLE `Room_Feature` (
  `Room_Name` varchar(32),
  `Feature_Name` varchar(32),
  PRIMARY KEY (`Room_Name`, `Feature_Name`)
);

CREATE TABLE `Feature` (
  `Name` varchar(32) PRIMARY KEY,
  `Description` varchar(128)
);
