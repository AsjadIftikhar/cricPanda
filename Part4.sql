USE CP
GO
--5.0) CURRENT,CONLCUDED AND FUTURE TOURNA

---------------------------------------------------------------------------
GO

CREATE PROCEDURE displayTournamentsWithCondition

@status varchar(20)

AS

BEGIN



	if(@status = 'current')

		BEGIN

			SELECT Tournament_ID as ID , Tournament_Name AS [Tournament Name], Tournament_Location [Location], Tournament_Start_Date [Start date], Tournament_End_Date [End date] 

			FROM Tournaments

			WHERE getdate() > Tournament_Start_Date AND getdate() < Tournament_End_Date

		END

	else if(@status = 'conducted')

		BEGIN

			SELECT Tournament_ID as ID , Tournament_Name AS [Tournament Name], Tournament_Location [Location], Tournament_Start_Date [Start date], Tournament_End_Date [End date] 

			FROM Tournaments

			WHERE (year(getdate()) > year(Tournament_End_Date)) OR (month(getdate()) > month(Tournament_End_Date))

		END	

	else if(@status = 'Future')

		BEGIN

			SELECT Tournament_ID as ID , Tournament_Name AS [Tournament Name], Tournament_Location [Location], Tournament_Start_Date [Start date], Tournament_End_Date [End date] 

			FROM Tournaments

			WHERE (year(getdate()) < year(Tournament_Start_Date)) OR (year(getdate()) < year(Tournament_Start_Date) AND month(getdate()) < month(Tournament_Start_Date))

		END



END;
--5.1) ONCLICK TOURNAMENT --> SHOW MATCHES

---------------------------------------------------------------------------

GO

CREATE PROCEDURE displayMatchesByTournament

@TournamentId int

AS

BEGIN

	SELECT A.Tournament_Name AS [Tournnament Name], A.Tournament_Location AS [Location], C.Team_Name AS Team1, D.Team_Name AS Team2, B.Match_Date AS [Match date]

	FROM Tournaments A join MATCHES B on A.Tournament_ID = B.Tournament_ID join Teams C on B.Team1_ID = C.Team_ID join Teams D on D.Team_ID = B.Team2_ID

	WHERE A.Tournament_ID = @TournamentId

END;

--6.0) LIST OF ALL TEAMS

---------------------------------------------------------------------------

GO

CREATE PROCEDURE displayTeams

AS

BEGIN

	SELECT * 
	FROM Teams

END;

--------------------------
GO
create Proc Matches_In_Tournaments

@tour_id int

as begin
    SELECT A.Tournament_Name,  C.Team_Name AS Team1, D.Team_Name AS Team2, B.Match_Date AS [Match date], B.Match_ID

	FROM Tournaments A join MATCHES B on A.Tournament_ID = B.Tournament_ID join Teams C on B.Team1_ID = C.Team_ID join Teams D on D.Team_ID = B.Team2_ID

	WHERE A.Tournament_ID = @tour_id


end

--Total runs & Total wickets--
GO
CREATE Proc Scorecard4
@Match_id int

as begin
Declare
@Team1 int,
@Team2 int,
@Runs_Scored1 int,
@Wickets_Taken1 int,
@Overs_Bowled1 int,
@Runs_Scored2 int,
@Wickets_Taken2 int,
@Overs_Bowled2 int


select @Team1 = (select Teams.Team_ID from Teams Inner Join (Select MATCHES.Team1_ID from MATCHES where Match_ID = @Match_id) as X 
On Teams.Team_ID = X.Team1_ID)

select @Team2 = (select Teams.Team_ID from Teams Inner Join (Select MATCHES.Team2_ID from MATCHES where Match_ID = @Match_id) as X 
On Teams.Team_ID = X.Team2_ID)



--First For Team1
Select @Runs_Scored1 = SUM(Z.Runs_Scored) , @Wickets_Taken1 = SUM(Z.Wickets_Taken) 
, @Overs_Bowled1 = SUM(Z.Total_Overs_Bowled)   from( 
select Y.Runs_Scored,Y.Wickets_Taken,Y.Total_Overs_Bowled from (
(select P.Player_ID,P.Match_ID,P.Runs_Scored,P.Wickets_Taken,P.Total_Overs_Bowled
from PlayerStats as P Inner Join 
(select Player_ID as P_ID from Players where Team_ID = @Team1) as X 
ON P.Player_ID = X.P_ID) as Y   
Inner Join (Select Player_Name,Player_ID  from Players) as T On Y.Player_ID = T.Player_ID ) 
where Y.Match_ID = @Match_id ) as Z



--Second For Team2
Select @Runs_Scored2 = SUM(Z.Runs_Scored) , @Wickets_Taken2 = SUM(Z.Wickets_Taken) 
, @Overs_Bowled2 = SUM(Z.Total_Overs_Bowled)   from( 
select Y.Match_ID,Y.Runs_Scored,Y.Wickets_Taken,Y.Total_Overs_Bowled from (
(select P.Player_ID,P.Match_ID,P.Runs_Scored,P.Wickets_Taken,P.Total_Overs_Bowled
from PlayerStats as P Inner Join 
(select Player_ID as P_ID from Players where Team_ID = @Team2) as X 
ON P.Player_ID = X.P_ID) as Y   
Inner Join (Select Player_Name,Player_ID  from Players) as T On Y.Player_ID = T.Player_ID ) 
where Y.Match_ID = @Match_id 
) as Z



create table Scard4(
   Team1 int,
   Team2 int,
   Runs_Scored1 int,
   Wickets_Taken1 int,
   Overs_Bowled1 int,
   Runs_Scored2 int,
   Wickets_Taken2 int,
   Overs_Bowled2 int
);



Insert Into Scard4
Values(@Team1 , @Team2 , @Runs_Scored1 , @Wickets_Taken1 , @Overs_Bowled1 , @Runs_Scored2 , @Wickets_Taken2 , @Overs_Bowled2 ) 


select * from Scard4

drop table Scard4

End
----------------------
--Team1--
GO
Create Proc Scorecard2
@Match_id int

as begin

Declare
@Team1 int


select @Team1 = (select Teams.Team_ID from Teams Inner Join (Select MATCHES.Team1_ID from MATCHES where Match_ID = @Match_id) as X 
On Teams.Team_ID = X.Team1_ID)


select * from 
(select P.Player_ID,P.Match_ID,P.Runs_Scored,P.Balls_Faced,P.Sixes,P.Wickets_Taken,P.Runs_Conceded,P.Total_Overs_Bowled
from PlayerStats as P Inner Join 
(select Player_ID as P_ID from Players where Team_ID = @Team1) as X 
ON P.Player_ID = X.P_ID) as Y 
Inner Join (Select Player_Name,Player_ID  from Players) as T On Y.Player_ID = T.Player_ID
where Y.Match_ID = @Match_id




End
--------------------
--Team2--
GO
Create Proc Scorecard3
@Match_id int

as begin

Declare
@Team2 int


select @Team2 = (select Teams.Team_ID from Teams Inner Join (Select MATCHES.Team2_ID from MATCHES where Match_ID = @Match_id) as X 
On Teams.Team_ID = X.Team2_ID)


select * from 
(select P.Player_ID,P.Match_ID,P.Runs_Scored,P.Balls_Faced,P.Sixes,P.Wickets_Taken,P.Runs_Conceded,P.Total_Overs_Bowled
from PlayerStats as P Inner Join 
(select Player_ID as P_ID from Players where Team_ID = @Team2) as X 
ON P.Player_ID = X.P_ID) as Y 
Inner Join (Select Player_Name,Player_ID  from Players) as T On Y.Player_ID = T.Player_ID
where Y.Match_ID = @Match_id


End

-------------------
--Scorecard--
GO
Create Proc Scorecard1
@Match_id int

as begin

Declare
@Tournament_Name varchar(25),
@Location varchar(25),
@Team1 varchar(25),
@Team2 varchar(25),
@Winner_Team varchar(25),
@Stadium_Name varchar(25),
@MOM varchar(25),
@Match_Date Date



select @Tournament_Name = (select Tournaments.Tournament_Name from Tournaments Inner Join (Select Tournament_ID from MATCHES where Match_ID = @Match_id) as X 
On Tournaments.Tournament_ID = X.Tournament_ID)

select @Location = (select Tournaments.Tournament_Location from Tournaments Inner Join (Select Tournament_ID from MATCHES where Match_ID = @Match_id) as X 
On Tournaments.Tournament_ID = X.Tournament_ID)

select @Team1 = (select Teams.Team_Name from Teams Inner Join (Select MATCHES.Team1_ID from MATCHES where Match_ID = @Match_id) as X 
On Teams.Team_ID = X.Team1_ID)

select @Team2 = (select Teams.Team_Name from Teams Inner Join (Select MATCHES.Team2_ID from MATCHES where Match_ID = @Match_id) as X 
On Teams.Team_ID = X.Team2_ID)

select @Winner_Team = (select Teams.Team_Name from Teams Inner Join (Select MATCHES.Winner_Team_ID from MATCHES where Match_ID = @Match_id) as X 
On Teams.Team_ID = X.Winner_Team_ID)

select @Stadium_Name = (select Stadiums.Stadium_City from Stadiums Inner Join (Select MATCHES.Stadium_ID from MATCHES where Match_ID = @Match_id) as X 
On Stadiums.Stadium_ID = X.Stadium_ID)

select @MOM = (select Players.Player_Name from Players Inner Join (Select MATCHES.MoM from MATCHES where Match_ID = @Match_id) as X 
On Players.Player_ID = X.MoM)

select @Match_Date = (select M.Match_Date from MATCHES as M where M.Match_ID = @Match_id) 


-- making virtual Table

create table Scard1(
   Tournament_Name varchar(25),
   Loc varchar(25),
   Team1 varchar(25),
   Team2 varchar(25),
   Winner_Team varchar(25),
   Stadium_Name varchar(25),
   MOM varchar(25),
   Match_Date Date
);


Insert Into Scard1
Values(@Tournament_Name , @Location , @Team1 , @Team2 , @Winner_Team , @Stadium_Name , @MOM , @Match_Date )

select * from Scard1

drop table Scard1

End
--End Scorecard--

