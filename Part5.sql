USE CP
GO
--PANDA LEAGUE
----------------------------------
GO
CREATE proc pcl_Tournament_ID
@User_ID int,@flag int output
as begin
	
select @flag=(	select PCL_Teams.Tournament_ID from PCL_Teams where User_ID=@User_ID
)
end

--------
GO
CREATE proc pcl_get_user_id
@Username varchar(50),@flag int output
as begin

select @flag=(select Users.User_ID from Users 
where Users.User_Name=@Username)

end

--Panda League----------------

--To check If User has Panda League Id
	GO
	create proc pcl_user_check 
	@User_ID int,
	@flag int output
	as begin

	if @User_ID IN ( Select PCL_Teams.[User_ID] from PCL_Teams )
	begin set @flag=1  end
	else 
	begin set @flag=0 end

	end

--1-----

--View all Tournaments detail
	GO
	create procedure View_Tournaments
	as begin
	select * from Tournaments
	end

--2------

--To check If Tournamment Exists 
	GO
	create procedure View_Tournaments_check
	@Tournament_ID int ,
	@flag int output
	as begin
	 if @Tournament_ID IN (select Tournament_ID from Tournaments)
	   if (convert(date,getdate()) >= (select Tournament_Start_Date from Tournaments where Tournament_ID=@Tournament_ID) AND   convert(date,getdate()) <= (select Tournament_End_Date from Tournaments where Tournament_ID=@Tournament_ID))
	   begin
	  set @flag=1
		end 
		else
		begin
		set @flag=-1
	   end
	end

--3------

--View for User for Team Selection for Panda League
	GO
	CREATE PROC Team_View_For_Selection
	@Tournament_ID int

	as begin

	--view for wicket_keepers
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='Wicket Keeper'

	--View for Batsman
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='Batsman'

	--View for All Rounders
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='All Rounder'

	--View for All Bowlers
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='Bowler'

	end


--4------------------------

	--add User data in the PCL_Teams
	GO
	CREATE PROC ADD_USERS_IN_PCL
	@User_ID int,
	@Team_Name varchar(50),
	@Tournament_ID int,
	@Player1_ID int,
	@Player2_ID int,
	@Player3_ID int,
	@Player4_ID int,
	@Player5_ID int,
	@Player6_ID int,
	@Player7_ID int,
	@Player8_ID int,
	@Player9_ID int,
	@Player10_ID int,
	@Player11_ID int,
	@Cap_ID int,
	@Vice_Cap_ID int

	as begin

	

	INSERT PCL_Teams VALUES(@User_ID,@Team_Name,@Tournament_ID)

	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player1_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player2_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player3_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player4_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player5_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player6_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player7_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player8_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player9_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player10_ID,@Cap_ID,@Vice_Cap_ID,0)
	INSERT PCL_Teams_Users VALUES(@User_ID,@Tournament_ID,@Player11_ID,@Cap_ID,@Vice_Cap_ID,0)



	end


--5---------
--Calculate Total Catches Taken by Player In a Tournament
	GO
	Create PROC GET_CATCHES
	@Tournament_ID int,
	@User_ID int,
	@Player_ID int,
	@temp_Catches int output
	as begin

	select @temp_Catches=(
	select SUM(Q.Catches_Taken) FROM PCL_Teams_Users AS P
	left join PlayerStats AS Q ON P.Player_ID=Q.Player_ID 
	WHERE P.[User_ID]=@User_ID AND Q.Tournament_ID=@Tournament_ID AND  P.Player_ID=@Player_ID
	group by Q.Player_ID

	)

	end 

	---------------------------------------------------------------

--Calculate Total wickets Taken by Player In a Tournament
	GO
	Create PROC Total_Wickets
	@Tournament_ID int,
	@User_ID int,
	@Player_ID int,
	@temp_Wickets int output
	as begin

	select @temp_Wickets=(
	select SUM(Q.Wickets_Taken) FROM PCL_Teams_Users AS P
	left join PlayerStats AS Q ON P.Player_ID=Q.Player_ID 
	WHERE P.[User_ID]=@User_ID AND Q.Tournament_ID=@Tournament_ID AND  P.Player_ID=@Player_ID
	group by Q.Player_ID

	)

	end 

	--------------------------------------------

--Calculate Total Total Runs Taken by Player In a Tournament
	GO
	Create PROC Total_Runs
	@Tournament_ID int,
	@User_ID int,
	@Player_ID int,
	@temp_Runs int output
	as begin

	select @temp_Runs=(
	select SUM(Q.Runs_Scored) FROM PCL_Teams_Users AS P
	left join PlayerStats AS Q ON P.Player_ID=Q.Player_ID 
	WHERE P.[User_ID]=@User_ID AND Q.Tournament_ID=@Tournament_ID AND  P.Player_ID=@Player_ID
	group by Q.Player_ID 
	)

	end 
	
	------------------------------------------------

--Set Points for catches And Update them
	GO
	CREATE PROC Calculte_Points_for_Catches
	@Tournament_ID1 int,
	@User_ID1 int,
	@Player1_ID int,
	@temp int OUTPUT,
	@flag int 

	as begin

		exec GET_CATCHES 
		@Tournament_ID=@Tournament_ID1,
		@User_ID=@User_ID1,
		@Player_ID=@Player1_ID,
		@temp_Catches=@temp OUTPUT

		set @temp = @temp * 10

			if(@flag=1)
			 begin	set @temp = @temp * 2 end
			else if (@flag=2)
			 begin	set @temp = @temp * 1.5 end


    UPDATE PCL_Teams_Users
	SET PCL_Teams_Users.Player_Pts=PCL_Teams_Users.Player_Pts+@temp
	where PCL_Teams_Users.Player_ID=@Player1_ID AND PCL_Teams_Users.User_ID=@User_ID1 AND PCL_Teams_Users.Tournament_ID=@Tournament_ID1

	end

-------------------------------------------------

--Set Points for Wickets And Update them
	GO
	CREATE PROC Calculte_Points_for_Wickets
	@Tournament_ID1 int,
	@User_ID1 int,
	@Player1_ID int,
	@temp int OUTPUT,
	@flag int 

	as begin

		exec Total_Wickets
		@Tournament_ID=@Tournament_ID1,
		@User_ID=@User_ID1,
		@Player_ID=@Player1_ID,
		@temp_Wickets=@temp OUTPUT

		set @temp = @temp * 10

			if(@flag=1)
			 begin	set @temp = @temp * 2 end
			else if (@flag=2)
			 begin	set @temp = @temp * 1.5 end


	UPDATE PCL_Teams_Users
	SET  PCL_Teams_Users.Player_Pts= PCL_Teams_Users.Player_Pts+@temp
	where  PCL_Teams_Users.Player_ID=@Player1_ID AND PCL_Teams_Users.User_ID=@User_ID1 AND PCL_Teams_Users.Tournament_ID=@Tournament_ID1
	end

--------------------------------------------------
  
--Set Points for Total Runs And Update them
	GO
	CREATE PROC Calculte_Points_for_Runs
	@Tournament_ID1 int,
	@User_ID1 int,
	@Player1_ID int,
	@temp int OUTPUT,
	@flag int 
	as begin

		exec Total_Runs
		@Tournament_ID=@Tournament_ID1,
		@User_ID=@User_ID1,
		@Player_ID=@Player1_ID,
		@temp_Runs=@temp OUTPUT

		set @temp = @temp / 25
		set @temp = @temp * 15

			if(@flag=1)
			 begin	set @temp = @temp * 2 end
			else if (@flag=2)
			 begin	set @temp = @temp * 1.5 end

	UPDATE  PCL_Teams_Users
	SET PCL_Teams_Users.Player_Pts= PCL_Teams_Users.Player_Pts+@temp
	where  PCL_Teams_Users.Player_ID=@Player1_ID AND PCL_Teams_Users.User_ID=@User_ID1 AND PCL_Teams_Users.Tournament_ID=@Tournament_ID1
	end

	
----------------------------------------------------
--Set Points for Players And Update them
GO
CREATE PROC SET_POINTS
@User_ID int,
@Tournament_ID int


as begin

DECLARE
@Player1_ID int,
@Player2_ID int,
@Player3_ID int,
@Player4_ID int,
@Player5_ID int,
@Player6_ID int,
@Player7_ID int,
@Player8_ID int,
@Player9_ID int,
@Player10_ID int,
@Player11_ID int,
@Cap_ID int,
@Vice_Cap_ID int,
@points int,
@temp int


	UPDATE PCL_Teams_Users
	SET Player_pts =0
	where [User_ID]=@User_ID
	AND [Tournament_ID]=@Tournament_ID

set @temp=0
set @points=0

--TO GET CAP ID AND STORE IN VAR

Select @temp=(Select top(1) Captain_ID From PCL_Teams_Users where  PCL_Teams_Users.User_ID=@User_ID)
set @Cap_ID=@temp

--TO GET VICE_CAP ID AND STORE IN VAR


Select @temp=(Select top(1) Vice_Captian_ID  From PCL_Teams_Users where  PCL_Teams_Users.User_ID=@User_ID)
set @Vice_Cap_ID=@temp

--TO GET PLAYERS ID AND STORE IN VAR


select @temp= (Select Top(1) Player_ID from (Select Top(11) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player11_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(10) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player10_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(9) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player9_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(8) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player8_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(7) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player7_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(6) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player6_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(5) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player5_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(4) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player4_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(3) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player3_ID=@temp

select @temp= (Select Top(1) Player_ID from (Select Top(2) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID ORDER BY Player_ID)  PCL_Teams_Users order by Player_ID DESC)
Set @Player2_ID=@temp

select @temp= (Select Top(1) Player_ID from PCL_Teams_Users where PCL_Teams_Users.User_ID=@User_ID)
Set @Player1_ID=@temp



---TO SETTLE SCORE OF PLAYERS

declare @tempo int ,@flag1 int 

	if(@Player1_ID IS NOT NULL)
		begin
		
			if(@Player1_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player1_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end


			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player1_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Wickets   --------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player1_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player1_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0


		END

	if(@Player2_ID IS NOT NULL)
		begin
		
		
			if(@Player2_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player2_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player2_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

			exec Calculte_Points_for_Wickets   --------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player2_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player2_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		END


	if(@Player3_ID IS NOT NULL)
		begin
		
		
			if(@Player3_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player3_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player3_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player3_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player3_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		END


	if(@Player4_ID IS NOT NULL)
		begin
		
		
			if(@Player4_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player4_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player4_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player4_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player4_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0


		END


	if(@Player5_ID IS NOT NULL)
		begin
		
		
			if(@Player5_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player5_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player5_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player5_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player5_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0


		END


	if(@Player6_ID IS NOT NULL)
		begin
		
		
			if(@Player6_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player6_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player6_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player6_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player6_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		END


	if(@Player7_ID IS NOT NULL)
		begin
		
		
			if(@Player7_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player7_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player7_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		

			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player7_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player7_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		END


	if(@Player8_ID IS NOT NULL)
		begin
		
		
			if(@Player8_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player8_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player8_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player8_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player8_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		END


	if(@Player9_ID IS NOT NULL)
		begin
		
		
			if(@Player9_ID=@Cap_ID)    -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player9_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player9_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player9_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player9_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0
		END


	if(@Player10_ID IS NOT NULL)
		begin
		
		
			if(@Player10_ID=@Cap_ID)  -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player10_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches   --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player10_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0
		
			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player10_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player10_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		END


	if(@Player11_ID IS NOT NULL)
		begin
	
	
			if(@Player11_ID=@Cap_ID) -- CHECK IF HE IS  CAP OR VICE CAP ADD BONUS
			begin
			set @flag1=1
			end
			else if(@Player11_ID=@Vice_Cap_ID)
			begin
			set @flag1=2
			end
			else
			begin
			set @flag1=0
			end

			exec Calculte_Points_for_Catches	 --------for catches
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player11_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1


			set @tempo=0

		
			exec Calculte_Points_for_Wickets	--------for wickets
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player11_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1

			set @tempo=0

		
			exec Calculte_Points_for_Runs   --------for Runs
			@Tournament_ID1=@Tournament_ID,
			@User_ID1 =@User_ID,
			@Player1_ID =@Player11_ID,
			@temp =@tempo OUTPUT,
			@flag=@flag1


		END

end
------------------------------------------------------
--FOR  VIEWING LEADERBOARD OF TOURNAMENT
		GO
		CREATE PROC Leader_board
		@Tournament_ID INT

		AS BEGIN

		Select SUM (Player_Pts) AS SCORE , PCL_Teams_Users.User_ID,Users.User_Name
		from PCL_Teams_Users inner join Users on Users.User_ID = PCL_Teams_Users.User_ID
		where Tournament_ID=@Tournament_ID
		group by PCL_Teams_Users.User_ID,Users.User_Name
		ORDER BY SCORE DESC


		END



	 GO
	 CREATE PROC Team_Viewer
	 @User_ID Int ,
	 @Tournament_ID INT

	 AS BEGIN
	
	 Declare @flag int
	 set @flag=0
 
	 exec user_check @User_ID=@User_ID,@flag=@flag output

	 if(@flag=0)
	 begin 
		Print('INVALID USER_ID')
	 end
	 else
	 begin
		 select PCL_Teams_Users.User_ID, PCL_Teams_Users.Tournament_ID,PCL_Teams_Users.Player_ID,Players.Player_Name,Players.Player_Role ,PCL_Teams_Users.Player_Pts,Players.Team_ID,Teams.Team_Name
		 from PCL_Teams_Users inner join Players ON Players.Player_ID=PCL_Teams_Users.Player_ID inner join Teams on Players.Team_ID=Teams.Team_ID
		 where PCL_Teams_Users.User_ID=@User_ID AND PCL_Teams_Users.Tournament_ID=@Tournament_ID
	
	 end
	 END
GO
CREATE PROCEDURE Current_Tournament

AS

BEGIN
			SELECT Tournaments.Tournament_ID As Tournamnet_ID ,Tournament_Name AS [Tournament_Name] 

			FROM Tournaments

			WHERE getdate() > Tournament_Start_Date AND getdate() < Tournament_End_Date

		END


--View for User for Team Selection for Panda League

-------------------------------------------------------------------------
	GO
	CREATE PROC Team_View_For_Selection_Wicket
	@Tournament_ID int

	as begin

	--view for wicket_keepers
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='Wicket Keeper'


	end
-------------------------------------------------------------------------
	GO
	CREATE PROC Team_View_For_Selection_Bowler
	@Tournament_ID int

	as begin

	--View for All Bowlers
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='Bowler'

	end
-------------------------------------------------------------------------
	GO
	CREATE PROC Team_View_For_Selection_Batsman
	@Tournament_ID int

	as begin


	--View for Batsman
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='Batsman'

	
	end
-------------------------------------------------------------------------
	GO
	CREATE PROC Team_View_For_Selection_All
	@Tournament_ID int

	as begin

	
	--View for All Rounders
	select Distinct Q.Player_ID,Players.Player_Name from 
	Players right outer join PlayerStats  AS Q
	ON Players.Player_ID=Q.Player_ID 
	where Q.Tournament_ID=@Tournament_ID
	AND Players.Player_Role='All Rounder'

	end
	-----------------
	GO
	create proc Get_PCL_User
	@Tournament_ID int
	as begin

	select PCL_Teams.[User_ID] from PCL_Teams
	where @Tournament_ID=Tournament_ID

	end
	--------------------
	GO
	Create Proc PCL_add_response
	@Email Nvarchar(50),
	@Subject Nvarchar(50),
	@Message Nvarchar(500)
	as begin
	  
	  INSERT  PCL_Review Values(@Email,@Subject,@Message)

	end

	-------------------------------
	CREATE proc[dbo].[pcl_Tournament_ID]
		@User_ID int, @flag int output
		as begin

		select @flag = (select PCL_Teams.Tournament_ID from PCL_Teams where User_ID = @User_ID
			)
		end








		-------------------------------------------------------------------------

		CREATE proc [dbo].[pcl_user_check]
		@User_ID int,
		@flag int output
		as begin

		if @User_ID IN(Select PCL_Teams.[User_ID] from PCL_Teams)
			begin set @flag = 1  end
		else
			begin set @flag = 0 end

		
		end


---------------------------------


					CREATE proc[dbo].[user_check]
					@User_ID int,
					@flag int output
					as begin

					if @User_ID IN(Select PCL_Teams.[User_ID] from PCL_Teams)
						begin set @flag = 1  end
					else
						begin set @flag = 0 end

						end
--------------------------------
CREATE proc[dbo].[user_name_check]
				@User_Name varchar(50),
				@flag int output
				as begin

				if @User_Name IN(Select PCL_Teams.PCL_Team_Name from PCL_Teams)
					begin set @flag = 1  end
				else
					begin set @flag = 0 end

					end

