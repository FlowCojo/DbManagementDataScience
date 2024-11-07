-- Create Teams table
CREATE TABLE Teams (
    TeamID NUMBER PRIMARY KEY,
    TeamName VARCHAR2(100) NOT NULL,
    Country VARCHAR2(50),
    FoundedYear NUMBER,
    StadiumName VARCHAR2(100)
);

-- Create a sequence for TeamID
CREATE SEQUENCE TeamID_seq START WITH 1 INCREMENT BY 1;

-- Create Players table
CREATE TABLE Players (
    PlayerID NUMBER PRIMARY KEY,
    PlayerName VARCHAR2(100) NOT NULL,
    TeamID NUMBER,
    Position VARCHAR2(20),
    Age NUMBER,
    Nationality VARCHAR2(50),
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

-- Create a sequence for PlayerID
CREATE SEQUENCE PlayerID_seq START WITH 1 INCREMENT BY 1;

-- Create Matches table
CREATE TABLE Matches (
    MatchID NUMBER PRIMARY KEY,
    HomeTeamID NUMBER,
    AwayTeamID NUMBER,
    MatchDate DATE,
    HomeTeamGoals NUMBER,
    AwayTeamGoals NUMBER,
    Stadium VARCHAR2(100),
    FOREIGN KEY (HomeTeamID) REFERENCES Teams(TeamID),
    FOREIGN KEY (AwayTeamID) REFERENCES Teams(TeamID)
);

-- Create a sequence for MatchID
CREATE SEQUENCE MatchID_seq START WITH 1 INCREMENT BY 1;

-- Create MatchStatistics table
CREATE TABLE MatchStatistics (
    StatID NUMBER PRIMARY KEY,
    MatchID NUMBER,
    PlayerID NUMBER,
    MinutesPlayed NUMBER,
    Goals NUMBER,
    Assists NUMBER,
    YellowCards NUMBER,
    RedCards NUMBER,
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID),
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID)
);

-- Create a sequence for StatID
CREATE SEQUENCE StatID_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_Teams
BEFORE INSERT ON Teams
FOR EACH ROW
BEGIN
    SELECT TeamID_seq.NEXTVAL INTO :NEW.TeamID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_Players
BEFORE INSERT ON Players
FOR EACH ROW
BEGIN
    SELECT PlayerID_seq.NEXTVAL INTO :NEW.PlayerID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_Matches
BEFORE INSERT ON Matches
FOR EACH ROW
BEGIN
    SELECT MatchID_seq.NEXTVAL INTO :NEW.MatchID FROM dual;
END;
/

CREATE OR REPLACE TRIGGER trg_MatchStatistics
BEFORE INSERT ON MatchStatistics
FOR EACH ROW
BEGIN
    SELECT StatID_seq.NEXTVAL INTO :NEW.StatID FROM dual;
END;
/





INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('FC Barcelona', 'Spain', 1899, 'Camp Nou');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Real Madrid', 'Spain', 1902, 'Santiago Bernabéu');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Manchester United', 'England', 1878, 'Old Trafford');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Bayern Munich', 'Germany', 1900, 'Allianz Arena');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Paris Saint-Germain', 'France', 1970, 'Parc des Princes');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Juventus', 'Italy', 1897, 'Allianz Stadium');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Liverpool', 'England', 1892, 'Anfield');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('AC Milan', 'Italy', 1899, 'San Siro');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Chelsea', 'England', 1905, 'Stamford Bridge');
INSERT INTO Teams (TeamName, Country, FoundedYear, StadiumName) VALUES ('Borussia Dortmund', 'Germany', 1909, 'Signal Iduna Park');

INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Lionel Messi', 1, 'Forward', 36, 'Argentina');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Karim Benzema', 2, 'Forward', 36, 'France');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Marcus Rashford', 3, 'Forward', 26, 'England');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Thomas Müller', 4, 'Midfielder', 34, 'Germany');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Kylian Mbappé', 5, 'Forward', 25, 'France');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Paulo Dybala', 6, 'Forward', 30, 'Argentina');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Virgil van Dijk', 7, 'Defender', 32, 'Netherlands');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Zlatan Ibrahimović', 8, 'Forward', 42, 'Sweden');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Raheem Sterling', 9, 'Midfielder', 29, 'England');
INSERT INTO Players (PlayerName, TeamID, Position, Age, Nationality) VALUES ('Marco Reus', 10, 'Midfielder', 35, 'Germany');

INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (1, 2, TO_DATE('2024-11-10', 'YYYY-MM-DD'), 3, 1, 'Camp Nou');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (3, 4, TO_DATE('2024-11-15', 'YYYY-MM-DD'), 2, 2, 'Old Trafford');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (5, 6, TO_DATE('2024-11-20', 'YYYY-MM-DD'), 1, 3, 'Parc des Princes');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (7, 8, TO_DATE('2024-11-25', 'YYYY-MM-DD'), 0, 2, 'Anfield');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (9, 10, TO_DATE('2024-12-01', 'YYYY-MM-DD'), 1, 1, 'Stamford Bridge');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (2, 5, TO_DATE('2024-12-05', 'YYYY-MM-DD'), 2, 4, 'Santiago Bernabéu');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (4, 1, TO_DATE('2024-12-10', 'YYYY-MM-DD'), 3, 3, 'Allianz Arena');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (6, 3, TO_DATE('2024-12-15', 'YYYY-MM-DD'), 0, 1, 'Allianz Stadium');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (8, 7, TO_DATE('2024-12-20', 'YYYY-MM-DD'), 2, 0, 'San Siro');
INSERT INTO Matches (HomeTeamID, AwayTeamID, MatchDate, HomeTeamGoals, AwayTeamGoals, Stadium) VALUES (10, 9, TO_DATE('2024-12-25', 'YYYY-MM-DD'), 3, 2, 'Signal Iduna Park');

INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (1, 1, 90, 2, 1, 0, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (1, 2, 90, 1, 0, 1, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (2, 3, 85, 1, 1, 0, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (2, 4, 90, 1, 0, 1, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (3, 5, 90, 1, 2, 0, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (4, 6, 75, 0, 0, 2, 1);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (5, 7, 90, 0, 1, 1, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (6, 8, 80, 2, 1, 0, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (7, 9, 90, 1, 1, 1, 0);
INSERT INTO MatchStatistics (MatchID, PlayerID, MinutesPlayed, Goals, Assists, YellowCards, RedCards) VALUES (8, 10, 90, 0, 2, 0, 0);

SELECT LPAD(' ', 2 * (LEVEL - 1)) || 'Player ' || p.PlayerName || ' - Match ' || ms.MatchID AS Hierarchy
FROM Players p
JOIN MatchStatistics ms ON p.PlayerID = ms.PlayerID
CONNECT BY NOCYCLE PRIOR ms.MatchID = ms.MatchID
START WITH p.PlayerID IS NOT NULL;


SELECT t.TeamName, SUM(m.HomeTeamGoals) AS TotalGoals
FROM Matches m
JOIN Teams t ON m.HomeTeamID = t.TeamID
GROUP BY t.TeamName;

SELECT ms.MatchID, p.PlayerName, ms.Goals
FROM MatchStatistics ms
JOIN Players p ON ms.PlayerID = p.PlayerID
WHERE ms.Goals = (SELECT MAX(ms2.Goals) 
                  FROM MatchStatistics ms2 
                  WHERE ms2.MatchID = ms.MatchID);


SELECT t.TeamName, AVG(p.Age) AS AvgAge
FROM Players p
JOIN Teams t ON p.TeamID = t.TeamID
GROUP BY t.TeamName;

SELECT p.PlayerName, SUM(ms.Goals) AS TotalGoals
FROM Players p
JOIN MatchStatistics ms ON p.PlayerID = ms.PlayerID
GROUP BY p.PlayerName
HAVING SUM(ms.Goals) > 1;

SELECT t.TeamName, SUM(ms.Assists) AS TotalAssists
FROM MatchStatistics ms
JOIN Players p ON ms.PlayerID = p.PlayerID
JOIN Teams t ON p.TeamID = t.TeamID
GROUP BY t.TeamName;

SELECT m.MatchID, t.TeamName, m.HomeTeamGoals
FROM Matches m
JOIN Teams t ON m.HomeTeamID = t.TeamID
WHERE m.HomeTeamGoals > 2 AND m.MatchID IN (SELECT MatchID FROM Matches WHERE HomeTeamGoals > 2);

SELECT t.TeamName, COUNT(m.MatchID) AS MatchesPlayed
FROM Matches m
JOIN Teams t ON m.HomeTeamID = t.TeamID OR m.AwayTeamID = t.TeamID
GROUP BY t.TeamName;

SELECT p.PlayerName, SUM(ms.Goals) AS TotalGoals,
       RANK() OVER (ORDER BY SUM(ms.Goals) DESC) AS GoalRank
FROM Players p
JOIN MatchStatistics ms ON p.PlayerID = ms.PlayerID
GROUP BY p.PlayerName;

SELECT t.TeamName, m.MatchDate, 
       SUM(m.HomeTeamGoals) OVER (PARTITION BY t.TeamID ORDER BY m.MatchDate) AS CumulativeGoals
FROM Matches m
JOIN Teams t ON m.HomeTeamID = t.TeamID;

SELECT p.PlayerName, 
       AVG(ms.Goals) OVER (PARTITION BY p.PlayerID) AS AvgGoalsPerGame
FROM Players p
JOIN MatchStatistics ms ON p.PlayerID = ms.PlayerID;

SELECT m.MatchID, t.TeamName, m.MatchDate, 
       LAG(m.Attendance, 1) OVER (PARTITION BY t.TeamID ORDER BY m.MatchDate) AS PrevAttendance,
       m.Attendance - LAG(m.Attendance, 1) OVER (PARTITION BY t.TeamID ORDER BY m.MatchDate) AS AttendanceChange
FROM Matches m
JOIN Teams t ON m.HomeTeamID = t.TeamID;

SELECT p.PlayerName, ms.MatchID, ms.Goals,
       SUM(ms.Goals) OVER (PARTITION BY p.PlayerID ORDER BY ms.MatchID) AS RunningTotalGoals
FROM Players p
JOIN MatchStatistics ms ON p.PlayerID = ms.PlayerID;

SELECT p.PlayerName, p.TeamID, ms.Assists,
       RANK() OVER (PARTITION BY p.TeamID ORDER BY ms.Assists DESC) AS AssistRank
FROM Players p
JOIN MatchStatistics ms ON p.PlayerID = ms.PlayerID;

SELECT p.PlayerName, t.TeamName, SUM(ms.Goals) AS PlayerGoals,
       ROUND(SUM(ms.Goals) * 100.0 / SUM(SUM(ms.Goals)) OVER (PARTITION BY t.TeamID), 2) AS ContributionPercentage
FROM Players p
JOIN Teams t ON p.TeamID = t.TeamID
JOIN MatchStatistics ms ON p.PlayerID = ms.PlayerID
GROUP BY p.PlayerName, t.TeamName, t.TeamID;










