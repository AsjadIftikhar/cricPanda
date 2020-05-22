USE CP
GO
--Cric Panda-----------------------------
--1) Login
---------------------------------------------------------------------------
GO

create PROCEDURE [login]

@nickname Varchar(20),
@pass varchar(10),
@output int OUTPUT

AS

BEGIN

IF EXISTS (SELECT * 

		   FROM [Users]

		   WHERE [Users].[User_Name] = @nickname)

	BEGIN

		IF EXISTS(SELECT * 

				  FROM [Users]

				  WHERE [Users].[Password] = @pass AND [Users].[User_Name] = @nickname)



				BEGIN

					SET @output = 1
					--Succesfully loged in
					

				END

		ELSE

			BEGIN

				

				SET @output = -2
				--Incorrect Password

			END		

	END



ELSE

	BEGIN
		

		SET @output=-3
		--Incorrect Username

	END
END

--2) SIGNUP

---------------------------------------------------------------------------

GO

CREATE PROCEDURE [SIGNUP]

@username varchar(20),

@password varchar(10),

@firstname varchar(10),

@lastname varchar(10),

@DOB date,

@status int output

AS

BEGIN

IF EXISTS (SELECT [Users].[User_Name]

				   FROM Users

				   WHERE [Users].[User_Name] = @username)

	BEGIN

		set @status= -2
		--Username already taken

	END

ELSE

	BEGIN

		IF EXISTS (SELECT [Users].[Password]

				   FROM Users

				   WHERE [Users].[Password] = @password)

				BEGIN
				set @status = -3
				--CHOOSE A STRONGER PASSWORD

				END

		ELSE

				BEGIN

					INSERT Users VALUES (@firstname,@lastname,@username,@password,@DOB,NULL)

					set @status=1
					--Successful

				END

	END





END

--3.0.0) Get user by username and password
GO
CREATE PROCEDURE GetUserByCred
@username varchar(20),
@password varchar(10)
AS
BEGIN
	select A.User_Name, A.Password, A.First_Name, A.Last_Name, A.DOB, A.User_ID, B.Team_Name, B.Flag
	from Users A join Teams B
	on A.Team_Preference = B.Team_ID
	where A.User_Name = @username AND A.Password = @password
END;



--3.0) CHECK TEAM PREFERENCE

---------------------------------------------------------------------------

GO

CREATE PROCEDURE CHECK_PREF

@username varchar(20),

@password varchar(10),

@status bit output		-- 1 FOR IS NULL AND 0 FOR NOT NULL, CALL SET ONLY IF 1

AS

BEGIN

	IF EXISTS (SELECT *

			   FROM [Users]

			   WHERE [Users].[User_Name] = @username AND [Users].[Password] = @password AND [Users].Team_Preference IS NULL)

		BEGIN

			SET @status = 1

		END

	ELSE

		BEGIN

			SET @status = 0

		END

END

--3.0.0) Get Team Preference by username and password


--3.0.1) Get Team PEREFERENCE ID BY NAME

GO
CREATE PROCEDURE GET_ID_BY_PREF
@pref_name varchar(50),
@output_id int OUTPUT
AS
BEGIN
	Select @output_id = Team_ID
	From Teams A
	Where A.Team_Name = @pref_name
END;



--3.1) SET TEAM PREFERENCE



GO

CREATE PROCEDURE TEAM_PREF

@username varchar(20),

@password varchar(10),

@T_PREF varchar(50)



AS

BEGIN

	declare @pref_id int;

	exec GET_ID_BY_PREF @pref_name = @T_PREF, @output_id = @pref_id OUTPUT;
	
	UPDATE [Users]

	SET Team_Preference = @pref_id

	WHERE [Users].[User_Name] = @username AND [Users].[Password] = @password

END


--4.0) lIVE SCORES DEFAULT

---------------------------------------------------------------------------

GO

CREATE PROCEDURE liveScore

AS

BEGIN

	SELECT B.Match_ID , A.Tournament_Name AS [Tournnament Name], A.Tournament_Location AS [Location], C.Team_Name AS Team1, D.Team_Name AS Team2, B.Match_Date AS [Match date], C.Flag AS [Team1_flag], D.Flag AS [Team2_flag], E.Stadium_City AS [Stadium]

	FROM Tournaments A join MATCHES B on A.Tournament_ID = B.Tournament_ID join Teams C on B.Team1_ID = C.Team_ID join Teams D on D.Team_ID = B.Team2_ID join Stadiums E on B.Stadium_ID = E.Stadium_ID

	WHERE YEAR(B.Match_Date) = YEAR(GETDATE()) AND  MONTH(B.Match_Date) = MONTH(GETDATE()) AND DAY(B.Match_Date) = DAY(GETDATE())

END;

--4.1) TOURNAMENTS ONCLICK

---------------------------------------------------------------------------

GO

CREATE PROCEDURE displayTournaments

AS

BEGIN

	SELECT Tournament_Name, Tournament_Location, Tournament_Start_Date, Tournament_End_Date

	FROM Tournaments

END;

