--
-- Workshops by department/college of faculty leader
--
CREATE VIEW `Workshop_Department` AS
  SELECT
    `ID`, `State`, `Title`,
    `Email` AS `Leader`, `FirstName`, `LastName`,
    `Department_Code`, `College_Code`
  FROM `Workshop`
    JOIN `Person_Workshop` ON `ID` = `Workshop_ID`
    JOIN `Person` ON `Person_Email` = `Email`
    JOIN `Department` ON `Department_Code` = `Code`
  WHERE `Role` = 'Lead';

--
-- Workshops with assigned room information
--
CREATE VIEW `Workshop_Room` AS
  SELECT
    `ID`, `State`, `Title`,
    `Name` AS `Room_Name`, `Type` AS `Room_Type`,
    `Room`.`Capacity` AS `Room_Capacity`, `Features`
  FROM `Workshop`
    LEFT JOIN `Room` ON `Room_Name` = `Name`
    LEFT JOIN (
      SELECT `Room_Name`,
        group_concat(`Feature_Name` SEPARATOR ', ') AS `Features`
      FROM `Room_Feature`
      GROUP BY `Room_Name`
    ) sub USING (`Room_Name`);

--
-- Number of student volunteers from each college
--
CREATE VIEW `Volunteer_College` AS
  SELECT `Event_Year`, `College_Code`, count(*) AS `Students`
  FROM `Workshop` w
    JOIN `Person_Workshop` pw ON `ID` = `Workshop_ID`
    JOIN `Person` p ON `Person_Email` = `Email`
    JOIN `Department` d ON `Department_Code` = d.`Code`
    JOIN `College` c ON `College_Code` = c.`Code`
  WHERE `Type` = 'Student'
  GROUP BY `Event_Year`, `College_Code`;

--
-- Show the detailed schedule of workshops.
--
CREATE VIEW `Event_Schedule` AS
  SELECT
    t.`Event_Year`, t.`ID` AS `T_ID`, t.`BegTime`, t.`EndTime`,
    w.`ID` AS `W_ID`, w.`Title`, w.`Advertisement`
  FROM `TimeSlot` t
    JOIN `Workshop_TimeSlot` wt ON t.`Event_Year` = wt.`TimeSlot_Event_Year`
                               AND t.`ID` = wt.`TimeSlot_ID`
   JOIN `Workshop` w ON wt.`Workshop_ID` = w.`ID`
  ORDER BY t.`ID`, w.`ID`;
