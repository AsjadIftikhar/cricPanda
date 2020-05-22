use CricPanda
go


CREATE TABLE Tournaments (
    Tournament_ID int identity(1,1) PRIMARY KEY,
    Tournament_Name varchar(100) NOT NULL,
    Tournament_Location varchar(50) NOT NULL,
    Tournament_Start_Date DATE,
    Tournament_End_Date DATE
);


	INSERT Tournaments VALUES('WORLDCUP 2019','ENGLAND & WALES','2019-06-1','2019-08-28')
	INSERT Tournaments VALUES('WORLDCUP 2023','INDIA','2019-06-5','2019-08-5')
	INSERT Tournaments VALUES('T20 WORLDCUP 2020','AUSTRALIA','2020-02-1','2019-05-28')


CREATE TABLE Stadiums(
Stadium_ID int identity(1,1) PRIMARY KEY,
Stadium_Capacity int,
Stadium_City varchar(50) NOT NULL,
Stadium_Country varchar(50) NOT NULL
);


	INSERT Stadiums VALUES (20000,'MELBOURNE','AUSTRALIA')
	INSERT Stadiums VALUES (20000,'GABBA','AUSTRALIA')
	INSERT Stadiums VALUES (10000,'LORDS','ENGLAND')
	INSERT Stadiums VALUES (5000,'RANCHI','INDIA')

CREATE TABLE Teams (
Team_ID int identity(1,1) PRIMARY KEY,
Team_Name varchar(50) NOT NULL,
Flag varchar(100)
);


	INSERT Teams VALUES('New Zealand','https://i.ibb.co/KG2QqVg/new-zealand-flag-large.jpg')
	INSERT Teams VALUES('Pakistan','https://i.ibb.co/0ZxMTmK/pakistan-flag-large.jpg')
	INSERT Teams VALUES('India','https://i.ibb.co/wM4jSGZ/india-flag-large.jpg')
	INSERT Teams VALUES('England','https://i.ibb.co/bQKfbBC/united-kingdom-flag-large.jpg')
	INSERT Teams VALUES('Australia','https://i.ibb.co/Lk4JRKc/australia-flag-large.jpg')
	INSERT Teams VALUES('Sri Lanka','https://i.ibb.co/N1jCkkf/sri-lanka-flag-large.jpg')
	INSERT Teams VALUES('West Indies','https://i.ibb.co/Wgrd2wp/WI.jpg')
	INSERT Teams VALUES('South Africa','https://i.ibb.co/6FwPqV4/south-africa-flag-large.jpg')
	INSERT Teams VALUES('Thailand','https://i.ibb.co/RN7t1SW/thailand-flag-large.jpg')
	INSERT Teams VALUES('Bangladesh','https://i.ibb.co/kDDJN4Z/bangladesh-flag-large.jpg')
	

CREATE TABLE TOURNA_TEAM(
Team_ID int Foreign key References Teams(Team_ID),
Tournament_ID int Foreign Key References Tournaments(Tournament_ID),
Primary key(Team_ID,Tournament_ID)
);


	INSERT TOURNA_TEAM VALUES(1,1)
	INSERT TOURNA_TEAM VALUES(1,2)
	INSERT TOURNA_TEAM VALUES(1,3)
	INSERT TOURNA_TEAM VALUES(2,1)
	INSERT TOURNA_TEAM VALUES(2,2)
	INSERT TOURNA_TEAM VALUES(3,1)
	INSERT TOURNA_TEAM VALUES(4,2)
	INSERT TOURNA_TEAM VALUES(5,3)
	INSERT TOURNA_TEAM VALUES(6,1)
	INSERT TOURNA_TEAM VALUES(6,2)
	INSERT TOURNA_TEAM VALUES(7,3)
	INSERT TOURNA_TEAM VALUES(8,2)


CREATE TABLE Players(
Player_ID int identity(1,1) PRIMARY KEY,
Player_Name varchar(50) NOT NULL,
DOB DATE,
Player_Role varchar(25),
Team_ID int Foreign Key References Teams(Team_ID)
);

	INSERT Players VALUES('Shahid Afridi','1990-03-23','All Rounder',2)
	INSERT Players VALUES('Umar Akmal','1990-03-23','Wicket Keeper',2)
	INSERT Players VALUES('Babar Azam','1990-03-23','Batsman',2)
	INSERT Players VALUES('Shaheen Afridi','1990-03-23','Bowler',2)
	INSERT Players VALUES('Shadab Khan','1990-03-23','All Rounder',2)
	INSERT Players VALUES('Virat Kohli','1990-03-23','Batsman',3)
	INSERT Players VALUES('Rohit Sharma','1990-03-23','Batsman',3)
	INSERT Players VALUES('Bumrah','1990-03-23','Bowler',3)
	INSERT Players VALUES('Steve Smith','1990-03-23','Batsman',5)
	INSERT Players VALUES('Anderson','1990-03-23','Bowler',4)
	INSERT Players VALUES('Jason Holder','1990-03-23','All Rounder',7)
	INSERT Players VALUES('Staurt Broad','1990-03-23','Bowler',4)
	INSERT Players VALUES('Chris Gayle','1990-03-23','Batsman',7)
	INSERT Players VALUES('Chris Woakes','1990-03-23','Bowler',4)




CREATE TABLE MATCHES (
Match_ID int identity(1,1) PRIMARY KEY,
Team1_ID int Foreign Key References Teams(Team_ID),
Team2_ID int Foreign Key References Teams(Team_ID),
Match_Date DATE,
MoM int Foreign key references Players(Player_ID),
Stadium_ID int Foreign Key References Stadiums(Stadium_ID),
Winner_Team_ID int Foreign Key References Teams(Team_ID),
Tournament_ID int Foreign Key References Tournaments(Tournament_ID)
);

	INSERT MATCHES VALUES(1,2,'2019-06-18',1,3,1,2)
	INSERT MATCHES VALUES(1,2,'2019-06-10',1,4,1,1)
	INSERT MATCHES VALUES(3,4,'2019-06-12',7,4,4,2)
	INSERT MATCHES VALUES(3,4,'2019-08-12',7,4,4,1)
	INSERT MATCHES VALUES(1,5,'2019-06-4',2,3,1,1)
	INSERT MATCHES VALUES(1,5,'2019-06-14',2,3,1,2)
	INSERT MATCHES VALUES(7,8,'2019-06-5',1,3,7,1)
	INSERT MATCHES VALUES(7,8,'2019-06-25',1,3,7,2)
	INSERT MATCHES VALUES(1,2,'2023-06-15',NULL,1,NULL,3)


CREATE TABLE PlayerStats(
Player_ID int Foreign Key References Players(Player_ID),
Match_ID int Foreign Key References MATCHES(Match_ID),
Tournament_ID int Foreign Key References Tournaments(Tournament_ID),
Runs_Scored int Default 0,
Balls_Faced int Default 0,
Wickets_Taken int Default 0,
Runs_Conceded int Default 0,
Total_Overs_Bowled int Default 0,
Catches_Taken int Default 0,
Total_Catches int Default 0,
Sixes int Default 0,
Strike_Rate float Default 0,
Economy float Default 0

);

	INSERT PlayerStats VALUES(1,6,2,60,80,0,0,0,1,2,1,0,0)
	INSERT PlayerStats VALUES(1,1,1,160,90,0,0,0,1,2,1,0,0)
	INSERT PlayerStats VALUES(2,6,1,16,90,0,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(2,1,2,100,90,0,0,0,2,2,1,0,0)
	INSERT PlayerStats VALUES(3,6,1,16,90,0,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(3,1,2,100,90,0,0,0,2,2,1,0,0)
	INSERT PlayerStats VALUES(4,6,1,1,9,4,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(4,1,2,10,10,2,0,0,2,2,1,0,0)
	INSERT PlayerStats VALUES(5,6,1,16,9,6,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(5,1,2,100,37,4,0,0,2,2,1,0,0)
	INSERT PlayerStats VALUES(6,2,2,50,80,0,0,0,1,2,1,0,0)
	INSERT PlayerStats VALUES(6,1,1,110,90,0,0,0,1,2,1,0,0)
	INSERT PlayerStats VALUES(7,2,2,160,80,0,0,0,1,2,1,0,0)
	INSERT PlayerStats VALUES(7,1,1,80,90,0,0,0,1,2,1,0,0)
	INSERT PlayerStats VALUES(8,2,1,1,9,5,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(8,1,2,10,10,7,0,0,2,2,1,0,0)
	INSERT PlayerStats VALUES(9,3,2,100,9,5,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(10,3,2,1,9,5,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(11,6,2,1,9,2,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(12,3,2,1,9,2,0,0,5,2,1,0,0)
	INSERT PlayerStats VALUES(13,6,2,60,80,0,0,0,1,2,1,0,0)
	INSERT PlayerStats VALUES(14,3,2,1,9,1,0,0,5,2,1,0,0)



CREATE TABLE Users (
    [User_ID] int identity(1,1) PRIMARY KEY,
    First_Name varchar(50) NOT NULL,
    Last_Name varchar(50),
    [User_Name] varchar(50) NOT NULL UNIQUE,
    Password varchar(25) NOT NULL,
    DOB DATE,
    Team_Preference int Foreign Key References Teams(Team_ID) default NULL
);

	INSERT Users VALUES('ASJAD','IFTIKHAR','KAI','PASSWORD1','1996-01-25',NULL)
	INSERT Users VALUES('M','ZAIN','ZAIXIIROXK','PASSWORD2',NULL,NULL)
	INSERT Users VALUES('TAYYAB','WASEEM','TAYYABA','PASSWORD3','1998-03-23',NULL)
	INSERT Users VALUES('HASEEB','BHAI','ROBOT','PASSWORD4','1993-01-26',NULL)
	INSERT Users VALUES('USMAN','GHANI','SHAREEF','PASSWORD5',NULL,NULL)



CREATE TABLE PCL_Teams ( 
    PCL_User_ID int identity(1,1) PRIMARY KEY,      
    [User_ID] int Foreign Key References Users([User_ID]), 
    PCL_Team_Name varchar(50) NOT NULL, 
    Tournament_ID int Foreign Key References Tournaments(Tournament_ID), 
); 




CREATE TABLE PCL_Teams_Users ( 
    [User_ID] int Foreign Key References Users([User_ID]), 
    Tournament_ID int Foreign Key References Tournaments(Tournament_ID), 
    Player_ID int Foreign Key References Players(Player_ID) ,
	Captain_ID int,
	Vice_Captian_ID int,
    Player_Pts int Default 0 

);

--4.2) TEAMS ONCLICK

---------------------------------------------------------------------------

GO

CREATE PROCEDURE displayAllTeams

AS

BEGIN

	SELECT *

	FROM Teams

END;


EXEC displayAllTeams;

GO

CREATE PROCEDURE GetTeam
@teamid int

AS
BEGIN

	SELECT Team_Name, Teams.Flag
	FROM Teams
	WHERE Team_ID = @teamid

END

EXECUTE GetTeam
@teamid = 2

--6.1.0) FIXTURES OF A SELECTED TEAM

---------------------------------------------------------------------------

GO

Alter PROCEDURE displayFixtures
@teamid int

AS
BEGIN

	SELECT T1.Team_Name AS T1, T1.Flag AS T1F,T2.Team_Name AS T2,T2.Flag AS T2F,MT1.Match_ID, MT1.Match_Date,Stadiums.Stadium_City,MT1.Winner_Team_ID,Tournaments.Tournament_Name
	FROM MATCHES MT1 INNER JOIN Teams T1
		 ON MT1.Team1_ID = T1.Team_ID
		 INNER JOIN Teams T2
		 ON MT1.Team2_ID = T2.Team_ID
		 INNER JOIN Stadiums
		 ON MT1.Stadium_ID = Stadiums.Stadium_ID
		 INNER JOIN Tournaments
		 ON MT1.Tournament_ID = Tournaments.Tournament_ID

	 WHERE MT1.Team1_ID = @teamid OR MT1.Team2_ID = @teamid

END

EXECUTE displayFixtures
@teamid = 2


--6.1.1) PLAYERS OF A GIVEN TEAM

---------------------------------------------------------------------------

GO

CREATE PROCEDURE DisplayPlayers
@teamid int

AS
BEGIN

	SELECT Player_Name,Player_Role, DATEDIFF(YY,Dob,GETDATE()) AS Age
	FROM Players
	WHERE Team_ID = @teamid

END


EXECUTE DisplayPlayers
@teamid = 3
--7.0.0) MOST RUNS

---------------------------------------------------------------------------
GO

CREATE PROCEDURE MostRuns
@tid int

AS
BEGIN

	SELECT TOP 1 Player_Name, SUM(Runs_Scored) AS Runs
	FROM PlayerStats INNER JOIN Players ON PlayerStats.Player_ID = Players.Player_ID
	WHERE Tournament_ID = @tid
	GROUP BY Player_Name
	ORDER BY SUM(Runs_Scored) DESC

END

--TO TEST
--drop procedure MOSTRUNS
EXECUTE MostRuns
@tid = 2

--7.0.1) MOST FIFTIES/HUNDREDS

---------------------------------------------------------------------------

GO

CREATE PROCEDURE MostFifties
@tid int

AS
BEGIN

	SELECT Player_Name, COUNT(Runs_Scored) AS TALLY 
	FROM PlayerStats INNER JOIN Players
		 ON PlayerStats.Player_ID = Players.Player_ID
		 WHERE Runs_Scored > 49 AND Runs_Scored < 100 AND Tournament_ID = @tid
	GROUP BY Player_Name
END

--HUNDREDS
GO

CREATE PROCEDURE MostHundreds
@tid int

AS

BEGIN

	SELECT Player_Name, COUNT(Runs_Scored) AS TALLY 
	FROM PlayerStats INNER JOIN Players
		 ON PlayerStats.Player_ID = Players.Player_ID
		 WHERE Runs_Scored > 99 AND Tournament_ID = @tid
	GROUP BY Player_Name

END

--TO TEST

EXECUTE MostHundreds
@tid = 2

--7.0.2) HIGHEST AVERAGE

---------------------------------------------------------------------------

GO

CREATE PROCEDURE HIAVG
@tid int

AS
BEGIN

	SELECT TOP 1 Player_Name, AVG(Runs_Scored) AS Hav_g
	FROM PlayerStats INNER JOIN Players ON PlayerStats.Player_ID = Players.Player_ID
	WHERE Tournament_ID = @tid
	GROUP BY Player_Name
	ORDER BY AVG(Runs_Scored) DESC

END

--TO TEST

EXECUTE HIAVG
@tid = 1

select * from Players
select * from PlayerStats where Tournament_ID=1




--7.0.3) TOP SCORE

---------------------------------------------------------------------------

GO

CREATE PROCEDURE TOPSCORE
@tid int

AS

BEGIN

	SELECT Player_Name,PlayerStats.Runs_Scored,PlayerStats.Balls_Faced
	FROM Players INNER JOIN PlayerStats
	 ON players.Player_ID = PlayerStats.Player_ID
	WHERE playerstats.Runs_Scored = (SELECT TOP 1 Runs_Scored
									 FROM PlayerStats 
									 WHERE Tournament_ID = @tid
									 ORDER BY Runs_Scored DESC)

END


--TO TEST

EXECUTE TOPSCORE
@tid = 2

--7.1.0) MOST WICKETS

---------------------------------------------------------------------------

GO

CREATE PROCEDURE MOSTWICKETS
@tid int

AS
BEGIN

	SELECT TOP 1 Player_Name, SUM(Wickets_Taken) AS wickets
	FROM PlayerStats INNER JOIN Players ON PlayerStats.Player_ID = Players.Player_ID
	WHERE Tournament_ID = @tid
	GROUP BY Player_Name
	ORDER BY SUM(Wickets_Taken) DESC

END

--TO TEST


EXECUTE MOSTWICKETS
@tid = 1

--7.1.1) BEST ECONOMY

---------------------------------------------------------------------------

GO

CREATE PROCEDURE BESTECO
@tid int

AS
BEGIN

	UPDATE PlayerStats
	SET Economy = CAST(Runs_Conceded AS float) / CAST(Total_Overs_Bowled AS float)
	WHERE Total_Overs_Bowled <> 0

	SELECT TOP 1 Player_Name, AVG(Economy) AS Eco
	FROM PlayerStats INNER JOIN Players ON PlayerStats.Player_ID = Players.Player_ID
	WHERE Tournament_ID = @tid AND Total_Overs_Bowled <> 0
	GROUP BY Player_Name
	ORDER BY AVG(Economy) ASC

END

--TO TEST

EXECUTE BESTECO
@tid = 2

--7.1.2) BEST BOWLING AVERAGE

---------------------------------------------------------------------------

GO

CREATE PROCEDURE BESTB_AVG
@tid int

AS
BEGIN

CREATE TABLE TEMP(
	
	pid int,
	tid int,
	wickets int,
	runs int,
	overs int,
	b_avg float

);

	INSERT INTO TEMP
	SELECT Player_ID,Tournament_ID , Wickets_Taken,Runs_Conceded, Total_Overs_Bowled, Economy
	FROM PlayerStats

	UPDATE TEMP
	SET b_avg = CAST(runs AS float) / CAST(wickets AS float)
	WHERE overs <> 0 AND wickets <> 0

	SELECT TOP 1 Player_Name, AVG(b_avg) AS BAVG
	FROM TEMP INNER JOIN Players ON TEMP.pid = Players.Player_ID
	WHERE tid = @tid AND overs <> 0
	GROUP BY Player_Name
	ORDER BY AVG(b_avg) ASC
	DROP TABLE TEMP

END


-- TO TEST

EXECUTE BESTB_AVG
@tid = 2

--7.2.0) MOST CATCHES

---------------------------------------------------------------------------

GO

CREATE PROCEDURE MOSTCATCHES
@tid int

AS
BEGIN

	SELECT TOP 1 Player_Name, SUM(Catches_Taken) As Catches
	FROM PlayerStats INNER JOIN Players ON PlayerStats.Player_ID = Players.Player_ID
	WHERE Tournament_ID = @tid
	GROUP BY Player_Name
	ORDER BY SUM(Catches_Taken) DESC

END

--TO TEST

EXECUTE MOSTCATCHES
@tid = 2


--8.0) POINTS TABLE
---------------------------------------------------------------------------
GO
Alter PROCEDURE PT
@tid int
AS
BEGIN
	DECLARE
	@COUNTER INT,
	@i INT,
	@Total_Wins INT,
	@Total_Matches INT,
	@RUNS INT,
	@WICK INT,
	@RATING float,
	@TEAM VARCHAR(50),
	@FLAG VARCHAR(100)

	CREATE TABLE TEMPORARY
	(
		Team varchar(50),
		flag varchar(100),
		total int,
		Wins int,
		Rating float


	);

	SET @COUNTER = (SELECT COUNT(*)
				  FROM Teams)
	SET @i = 1
	WHILE @i <= @COUNTER
		BEGIN
			
			SELECT @Total_Matches =(SELECT Count(*) 
						   FROM MATCHES 
						   WHERE( (@i=Team1_ID OR @i=Team2_ID )  AND (Tournament_ID=@tid)))


			IF @Total_Matches > 0
				BEGIN
					SELECT @TEAM = (SELECT Teams.Team_Name
									FROM TOURNA_TEAM INNER JOIN Teams
										ON TOURNA_TEAM.Team_ID = Teams.Team_ID
									WHERE TOURNA_TEAM.Team_ID = @i AND Tournament_ID = @tid)
									

					SELECT @FLAG = (SELECT Teams.Flag
									FROM TOURNA_TEAM INNER JOIN Teams
										ON TOURNA_TEAM.Team_ID = Teams.Team_ID
									WHERE TOURNA_TEAM.Team_ID = @i AND Tournament_ID = @tid)
									

					SELECT @Total_Wins = (SELECT Count(*) 
										  FROM MATCHES 
										  WHERE((Winner_Team_ID=@i) AND (Tournament_ID=@tid)))

			
					SELECT @RUNS = (SELECT SUM(PlayerStats.Runs_Scored)
									FROM PlayerStats INNER JOIN Players
										ON PlayerStats.Player_ID = Players.Player_ID
									WHERE Players.Team_ID = @i AND PLAYERSTATS.Tournament_ID = @tid)

					SELECT @WICK = (SELECT SUM(PlayerStats.Wickets_Taken)
									FROM PlayerStats INNER JOIN Players
										ON PlayerStats.Player_ID = Players.Player_ID
									WHERE Players.Team_ID = @i AND PLAYERSTATS.Tournament_ID = @tid)
					
					IF @RUNS > 0 AND @WICK > 0
						BEGIN
							SET @RATING = cast(@RUNS AS float) / cast(@WICK AS float)
						END
					ELSE
						BEGIN
							SET @RATING = 0.0
						END
				

				INSERT INTO TEMPORARY
				SELECT @TEAM, @FLAG,@Total_Matches,@Total_Wins,@RATING
				
			END
			

			SET @i = @i + 1
		END

		SELECT *
		FROM TEMPORARY
		ORDER BY TEMPORARY.Wins DESC, TEMPORARY.Rating DESC

		DROP TABLE TEMPORARY


END

--To Test
EXECUTE PT
@tid = 2

SELECT * FROM MATCHES WHERE Tournament_ID =2

--4.1) TOURNAMENTS ONCLICK

---------------------------------------------------------------------------

GO

CREATE PROCEDURE displayAllTournaments

AS

BEGIN

	SELECT Tournament_ID, Tournament_Name, Tournament_Location, Tournament_Start_Date, Tournament_End_Date 

	FROM Tournaments

END;

GO
CREATE PROCEDURE TournamentName
@tid int
AS
BEGIN
	SELECT Tournament_Name
	FROM Tournaments
	WHERE Tournament_ID = @tid
END

EXEC TournamentName
@tid = 2

--9.0.1 CREATE TOURNAMENT 
---------------------------------------------------------------------------
GO

CREATE PROCEDURE C_TOURNA
@Tname varchar(50),
@Tloc varchar(20),
@sdate date,
@edate date,
@status int OUTPUT

AS
BEGIN

	IF EXISTS(SELECT *
			  FROM Stadiums
			  WHERE Stadium_Country = @Tloc)
		BEGIN
			INSERT Tournaments VALUES (@Tname,@Tloc,@sdate,@edate)
			SET @status = 0
		END
	ELSE		
		BEGIN
			SET @status = -1
		END
END

select * from Tournaments
--9.2.0 ADD TEAM
---------------------------------------------------------------------------
GO

CREATE PROCEDURE ADDTEAM
@tname varchar(20),
@flag varchar(100),
@status int OUTPUT
AS
BEGIN

	INSERT Teams VALUES (@tname,@flag)
	SET @status = 1;

END

--9.3.0 ADD TEAM TO A TOURNAMENT
---------------------------------------------------------------------------
GO

CREATE PROCEDURE ADDTT
@tid int,
@teamid int,
@status int OUTPUT

AS
BEGIN
	IF EXISTS(SELECT *
			  FROM TOURNA_TEAM
			  WHERE TOURNA_TEAM.Team_ID = @teamid AND TOURNA_TEAM.Tournament_ID = @tid)
		BEGIN
			SET @status = -1
		END
	ELSE
		BEGIN
			INSERT TOURNA_TEAM VALUES(@teamid,@tid)
			SET @status = 1
		END
	

END
-------------
GO

CREATE PROCEDURE getBoth
@tid varchar(50),
@teamid varchar(50),
@OT1 INT OUTPUT,
@OT2 INT OUTPUT

AS
BEGIN
	SET @OT1 = (SELECT Tournaments.Tournament_ID
				FROM Tournaments 
				WHERE Tournaments.Tournament_Name = @tid)			

	SET @OT2=(SELECT Teams.Team_ID
				 FROM Teams
				 WHERE Team_Name = @teamid) 
	
END

--9.4.0 ADD PLAYER
---------------------------------------------------------------------------
GO

CREATE PROCEDURE ADDPLAYER
@pname varchar(20),
@dob date,
@prole varchar(20),
@teamid int,
@status int output
AS
BEGIN

	INSERT Players VALUES(@pname,@dob,@prole,@teamid)
	SET @status = 1

END

--9.4.1 REMOVE PLAYER
---------------------------------------------------------------------------
GO

CREATE PROCEDURE R_PLAYER
@pid varchar(20),
@status int output
AS
BEGIN

	DELETE FROM Players 
	WHERE Player_Name = @pid

	SET @status = 1

END
--------------------
GO

CREATE PROCEDURE displayAllPlayers

AS

BEGIN

	SELECT *

	FROM Players

END

--9.1.1 REMOVE A STADIUM
---------------------------------------------------------------------------
GO

CREATE PROCEDURE R_STADIUM
@sid varchar(20),
@status int output

AS
BEGIN

	DELETE FROM Stadiums
	WHERE Stadium_City = @sid

	SET @status = 1

END
--------------------
GO

CREATE PROCEDURE displayStadiums

AS

BEGIN

	SELECT *

	FROM Stadiums

END;

--9.5.2 UPDATE WINNER AND MOM 
---------------------------------------------------------------------------
GO

CREATE PROCEDURE UP_MATCH
@mid int,
@mom varchar(20),
@status int output


AS
BEGIN
DECLARE @Team int, @T1 INT, @T2 INT,@RUNS1 INT, @RUNS2 INT,@P INT

	SELECT @Team = (SELECT Players.Team_ID
					FROM Players
					WHERE Player_Name = @mom)
	SELECT @P = (SELECT Players.Player_ID
				 FROM Players
				 WHERE Player_Name = @mom)

	IF EXISTS (SELECT *
			   FROM MATCHES INNER JOIN PlayerStats
				ON MATCHES.Match_ID = PlayerStats.Match_ID
			   WHERE PlayerStats.Player_ID = @P AND (MATCHES.Team1_ID = @Team OR MATCHES.Team2_ID = @Team) AND PlayerStats.Match_ID = @mid)
		BEGIN
			UPDATE MATCHES
			SET MoM = @P
			WHERE Match_ID = @mid

			SET @status = -1

			SELECT @T1 = (SELECT MATCHES.Team1_ID
						  FROM MATCHES
						  WHERE MATCHES.Match_ID = @mid)
			SELECT @T2 = (SELECT MATCHES.Team2_ID
						  FROM MATCHES
						  WHERE MATCHES.Match_ID = @mid)



			SELECT @RUNS1 = (SELECT SUM(PlayerStats.Runs_Scored)
									FROM PlayerStats INNER JOIN Players
										ON PlayerStats.Player_ID = Players.Player_ID
									WHERE Players.Team_ID = @mid )
			SELECT @RUNS2 = (SELECT SUM(PlayerStats.Runs_Scored)
									FROM PlayerStats INNER JOIN Players
										ON PlayerStats.Player_ID = Players.Player_ID
									WHERE Players.Team_ID = @T2 )
			IF (@RUNS1 > @RUNS2)
				BEGIN
					UPDATE MATCHES
					SET Winner_Team_ID = @T1
					WHERE Match_ID = @mid

					SET @status = 1
				END
			ELSE
				BEGIN
					UPDATE MATCHES
					SET Winner_Team_ID = @T2
					WHERE Match_ID = @mid

					SET @status = 1
				END

		END
	ELSE
		BEGIN
			SET @status = 0
		END
	
	


END

--------------------
declare @st int

exec UP_Match
@mid = 9,
@mom = 'shahid afridi',
@status = @st output

select @st

GO

ALTER PROCEDURE display_Fixtures

AS
BEGIN
SELECT T1.Team_Name AS T1, T1.Flag AS T1F,T2.Team_Name AS T2,T2.Flag AS T2F,MT1.Match_ID, MT1.Match_Date,Stadiums.Stadium_City,MT1.Winner_Team_ID,Tournaments.Tournament_Name
	FROM MATCHES MT1 INNER JOIN Teams T1
		 ON MT1.Team1_ID = T1.Team_ID
		 INNER JOIN Teams T2
		 ON MT1.Team2_ID = T2.Team_ID
		 INNER JOIN Stadiums
		 ON MT1.Stadium_ID = Stadiums.Stadium_ID
		 INNER JOIN Tournaments
		 ON MT1.Tournament_ID = Tournaments.Tournament_ID


END

