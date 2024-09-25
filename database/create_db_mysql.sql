-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `MADISTEM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MADISTEM` ;

CREATE TABLE IF NOT EXISTS `MADISTEM` (
  `Year` INT NOT NULL COMMENT 'The event year',
  `Date` DATE NULL COMMENT 'The exact date of the event',
  PRIMARY KEY (`Year`))
ENGINE = InnoDB
COMMENT = 'Holds the year and exact date of each event, for organizing.  More attributes to be added - guest speaker, theme, etc.';


-- -----------------------------------------------------
-- Table `ROOM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ROOM` ;

CREATE TABLE IF NOT EXISTS `ROOM` (
  `ID` VARCHAR(32) NOT NULL COMMENT 'The short name of the room, like King250',
  `Building` VARCHAR(45) NULL,
  `RoomNum` VARCHAR(45) NULL,
  `Capacity` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
COMMENT = 'Rooms on campus that may be used by madistem';


-- -----------------------------------------------------
-- Table `WORKSHOP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WORKSHOP` ;

CREATE TABLE IF NOT EXISTS `WORKSHOP` (
  `ID` INT NOT NULL AUTO_INCREMENT COMMENT 'Generated auto-increment ID because the title may be edited over time.  This ID is unique across years.',
  `State` VARCHAR(45) NULL COMMENT 'The state of the workshop - proposed, accepted, file, etc. - the exact states are not fully defined.',
  `Title` VARCHAR(128) NULL,
  `Advertisement` VARCHAR(512) NULL COMMENT 'The workshop description to be shown on the website.',
  `Description` VARCHAR(1024) NULL COMMENT 'The full description of the workshop maybe with much more detail than the advertisement.',
  `Capacity` INT NULL COMMENT 'The max number of students that can be accomodated in this workshop',
  `ComputerNeeds` VARCHAR(128) NULL,
  `RoomNeeds` VARCHAR(128) NULL,
  `MaxRepeat` INT NULL COMMENT 'The number of times this workshop can be offered during the day',
  `ParentQuestions` VARCHAR(1024) NULL COMMENT 'Follow-up information/questions for the attendee to share with their parents post event.',
  `OtherInformation` VARCHAR(512) NULL COMMENT 'Any other information about the workshop to be shared with the organizers.',
  `MADISTEM_Year` INT NOT NULL COMMENT 'Not part of the key, but required.',
  `ROOM_ID` VARCHAR(32) NULL COMMENT 'The room is assigned later in the process, so it can be null.',
  PRIMARY KEY (`ID`),
  INDEX `fk_WORKSHOP_MADISTEM1_idx` (`MADISTEM_Year` ASC) VISIBLE,
  INDEX `fk_WORKSHOP_ROOM1_idx` (`ROOM_ID` ASC) VISIBLE,
  CONSTRAINT `fk_WORKSHOP_MADISTEM1`
    FOREIGN KEY (`MADISTEM_Year`)
    REFERENCES `MADISTEM` (`Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WORKSHOP_ROOM1`
    FOREIGN KEY (`ROOM_ID`)
    REFERENCES `ROOM` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Holds all the workshop information.';


-- -----------------------------------------------------
-- Table `COLLEGE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COLLEGE` ;

CREATE TABLE IF NOT EXISTS `COLLEGE` (
  `Code` VARCHAR(8) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `DeanFullName` VARCHAR(45) NULL,
  `DeanEmail` VARCHAR(45) NULL,
  `DeanFirstName` VARCHAR(45) NULL,
  PRIMARY KEY (`Code`))
ENGINE = InnoDB
COMMENT = 'Needed for name lookups and for thank-you emails';


-- -----------------------------------------------------
-- Table `DEPARTMENT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DEPARTMENT` ;

CREATE TABLE IF NOT EXISTS `DEPARTMENT` (
  `Code` VARCHAR(8) NOT NULL COMMENT 'JMU department code',
  `Name` VARCHAR(45) NOT NULL,
  `AUHEmail` VARCHAR(45) NULL,
  `AUHFullName` VARCHAR(45) NULL,
  `COLLEGE_Code` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`Code`),
  INDEX `fk_DEPARTMENT_COLLEGE_idx` (`COLLEGE_Code` ASC) VISIBLE,
  CONSTRAINT `fk_DEPARTMENT_COLLEGE`
    FOREIGN KEY (`COLLEGE_Code`)
    REFERENCES `COLLEGE` (`Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Needed for name lookup and thank-you emails';


-- -----------------------------------------------------
-- Table `PERSON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PERSON` ;

CREATE TABLE IF NOT EXISTS `PERSON` (
  `Email` VARCHAR(45) NOT NULL COMMENT 'Use email as the unique identifier for all people.',
  `Type` VARCHAR(45) NULL COMMENT 'student, faculty, other',
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `DEPARTMENT_Code` VARCHAR(8) NULL,
  PRIMARY KEY (`Email`),
  INDEX `fk_PERSON_DEPARTMENT1_idx` (`DEPARTMENT_Code` ASC) VISIBLE,
  CONSTRAINT `fk_PERSON_DEPARTMENT1`
    FOREIGN KEY (`DEPARTMENT_Code`)
    REFERENCES `DEPARTMENT` (`Code`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'The super class entity for all different types of people, with their basic information.';


-- -----------------------------------------------------
-- Table `ROOM_FEATURE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ROOM_FEATURE` ;

CREATE TABLE IF NOT EXISTS `ROOM_FEATURE` (
  `Name` INT NOT NULL,
  `Description` VARCHAR(45) NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB
COMMENT = 'Just to lookup some features like sink, computers, projector, etc.';


-- -----------------------------------------------------
-- Table `ROOM_has_ROOM_FEATURE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ROOM_has_ROOM_FEATURE` ;

CREATE TABLE IF NOT EXISTS `ROOM_has_ROOM_FEATURE` (
  `ROOM_ID` VARCHAR(32) NOT NULL,
  `ROOM_FEATURE_Name` INT NOT NULL,
  PRIMARY KEY (`ROOM_ID`, `ROOM_FEATURE_Name`),
  INDEX `fk_ROOM_has_ROOM_FEATURE_ROOM_FEATURE1_idx` (`ROOM_FEATURE_Name` ASC) VISIBLE,
  INDEX `fk_ROOM_has_ROOM_FEATURE_ROOM1_idx` (`ROOM_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ROOM_has_ROOM_FEATURE_ROOM1`
    FOREIGN KEY (`ROOM_ID`)
    REFERENCES `ROOM` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ROOM_has_ROOM_FEATURE_ROOM_FEATURE1`
    FOREIGN KEY (`ROOM_FEATURE_Name`)
    REFERENCES `ROOM_FEATURE` (`Name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'M-N connection between room and room features';


-- -----------------------------------------------------
-- Table `VOLUNTEER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VOLUNTEER` ;

CREATE TABLE IF NOT EXISTS `VOLUNTEER` (
  `PERSON_Email` VARCHAR(45) NOT NULL,
  `AssignedRole` VARCHAR(45) NULL COMMENT 'Various volunteer roles - need to consult Dr. Lam for details.  This is possibly multi-valued and could be promoted to part of the key.',
  `MADISTEM_Year` INT NOT NULL COMMENT 'Part of the key in case the same person works in different roles in different years.',
  PRIMARY KEY (`PERSON_Email`, `MADISTEM_Year`),
  INDEX `fk_VOLUNTEER_MADISTEM1_idx` (`MADISTEM_Year` ASC) VISIBLE,
  CONSTRAINT `fk_VOLUNTEER_PERSON1`
    FOREIGN KEY (`PERSON_Email`)
    REFERENCES `PERSON` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_VOLUNTEER_MADISTEM1`
    FOREIGN KEY (`MADISTEM_Year`)
    REFERENCES `MADISTEM` (`Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Event volunteers are managed separately from other workshop personnel, but they can be assigned to work in workshops.  These are the people usually managed by Dr.  Lam.  The madiSTEM year is part of the key as the same person may work as a volunteer in different years in different roles.';


-- -----------------------------------------------------
-- Table `PERSON_WORKSHOP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PERSON_WORKSHOP` ;

CREATE TABLE IF NOT EXISTS `PERSON_WORKSHOP` (
  `PERSON_Email` VARCHAR(45) NOT NULL,
  `WORKSHOP_ID` INT NOT NULL,
  `Role` VARCHAR(45) NULL,
  `Phone` VARCHAR(10) NULL,
  PRIMARY KEY (`PERSON_Email`, `WORKSHOP_ID`),
  INDEX `fk_PERSON_has_WORKSHOP_WORKSHOP1_idx` (`WORKSHOP_ID` ASC) VISIBLE,
  INDEX `fk_PERSON_has_WORKSHOP_PERSON1_idx` (`PERSON_Email` ASC) VISIBLE,
  CONSTRAINT `fk_PERSON_has_WORKSHOP_PERSON1`
    FOREIGN KEY (`PERSON_Email`)
    REFERENCES `PERSON` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PERSON_has_WORKSHOP_WORKSHOP1`
    FOREIGN KEY (`WORKSHOP_ID`)
    REFERENCES `WORKSHOP` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Connects a person to a workshop with a specific role and contact phone number.  Since the year is in the workshop table, this relationship is M-N.';


-- -----------------------------------------------------
-- Table `ORGANIZER`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ORGANIZER` ;

CREATE TABLE IF NOT EXISTS `ORGANIZER` (
  `PERSON_Email` VARCHAR(45) NOT NULL,
  `Role` VARCHAR(45) NULL,
  `MADISTEM_Year` INT NOT NULL,
  PRIMARY KEY (`PERSON_Email`, `MADISTEM_Year`),
  INDEX `fk_ORGANIZER_MADISTEM1_idx` (`MADISTEM_Year` ASC) VISIBLE,
  CONSTRAINT `fk_ORGANIZER_PERSON1`
    FOREIGN KEY (`PERSON_Email`)
    REFERENCES `PERSON` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ORGANIZER_MADISTEM1`
    FOREIGN KEY (`MADISTEM_Year`)
    REFERENCES `MADISTEM` (`Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'This table just tracks the madistem organizers and roles by year (like an M-N with event)';


-- -----------------------------------------------------
-- Table `SCHEDULE_SLOT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SCHEDULE_SLOT` ;

CREATE TABLE IF NOT EXISTS `SCHEDULE_SLOT` (
  `ID` INT NOT NULL COMMENT 'The slots are numbered 1 - N from earliest to latest',
  `Name` VARCHAR(45) NULL COMMENT 'What is this slot? registration, lunch, speaker, workshops',
  `From` TIME NULL COMMENT 'The starting time of this time block',
  `To` TIME NULL COMMENT 'end time of this slot',
  `MADISTEM_Year` INT NOT NULL,
  PRIMARY KEY (`ID`, `MADISTEM_Year`),
  INDEX `fk_SCHEDULE_SLOT_MADISTEM1_idx` (`MADISTEM_Year` ASC) VISIBLE,
  CONSTRAINT `fk_SCHEDULE_SLOT_MADISTEM1`
    FOREIGN KEY (`MADISTEM_Year`)
    REFERENCES `MADISTEM` (`Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'An event is divided into a schedule for the day - these are the time slots.';


-- -----------------------------------------------------
-- Table `WORKSHOP_in_SCHEDULE_SLOT`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WORKSHOP_in_SCHEDULE_SLOT` ;

CREATE TABLE IF NOT EXISTS `WORKSHOP_in_SCHEDULE_SLOT` (
  `WORKSHOP_ID` INT NOT NULL,
  `SCHEDULE_SLOT_ID` INT NOT NULL,
  `SCHEDULE_SLOT_MADISTEM_Year` INT NOT NULL,
  PRIMARY KEY (`WORKSHOP_ID`, `SCHEDULE_SLOT_ID`, `SCHEDULE_SLOT_MADISTEM_Year`),
  INDEX `fk_WORKSHOP_has_SCHEDULE_SLOT_SCHEDULE_SLOT1_idx` (`SCHEDULE_SLOT_ID` ASC, `SCHEDULE_SLOT_MADISTEM_Year` ASC) VISIBLE,
  INDEX `fk_WORKSHOP_has_SCHEDULE_SLOT_WORKSHOP1_idx` (`WORKSHOP_ID` ASC) VISIBLE,
  CONSTRAINT `fk_WORKSHOP_has_SCHEDULE_SLOT_WORKSHOP1`
    FOREIGN KEY (`WORKSHOP_ID`)
    REFERENCES `WORKSHOP` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_WORKSHOP_has_SCHEDULE_SLOT_SCHEDULE_SLOT1`
    FOREIGN KEY (`SCHEDULE_SLOT_ID` , `SCHEDULE_SLOT_MADISTEM_Year`)
    REFERENCES `SCHEDULE_SLOT` (`ID` , `MADISTEM_Year`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Connects the workshop to slot M-N, because many workshops can be scheduled in the same slot.';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
