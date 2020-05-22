USE CP
GO
--This contains all tables and population of those tables:
CREATE TABLE Tournaments (
    Tournament_ID int identity(1,1) PRIMARY KEY,
    Tournament_Name varchar(100) NOT NULL,
    Tournament_Location varchar(50) NOT NULL,
    Tournament_Start_Date DATE,
    Tournament_End_Date DATE
);
	INSERT Tournaments VALUES('ICC Champions Trophy','ENGLAND & WALES','2019-12-12','2020-08-28')
	
CREATE TABLE Stadiums(
Stadium_ID int identity(1,1) PRIMARY KEY,
Stadium_Capacity int,
Stadium_City varchar(50) NOT NULL,
Stadium_Country varchar(50) NOT NULL
);

	INSERT Stadiums VALUES (26000,'The Oval','England')
	INSERT Stadiums VALUES (23500,'Edgbastan Cricket Ground','England')
	INSERT Stadiums VALUES (15643,'The Sophia Gardens','England')

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
	INSERT TOURNA_TEAM VALUES(2,1)
	INSERT TOURNA_TEAM VALUES(3,1)
	INSERT TOURNA_TEAM VALUES(4,1)
	INSERT TOURNA_TEAM VALUES(5,1)
	INSERT TOURNA_TEAM VALUES(6,1)
	INSERT TOURNA_TEAM VALUES(8,1)
	INSERT TOURNA_TEAM VALUES(10,1)

CREATE TABLE Players(
Player_ID int identity(1,1) PRIMARY KEY,
Player_Name varchar(50) NOT NULL,
DOB DATE,
Player_Role varchar(25),
Team_ID int Foreign Key References Teams(Team_ID)
);

	INSERT Players VALUES('Matthew Wade','1991-03-23','Wicket Keeper',5)
	INSERT Players VALUES('Aaron Finch','1992-03-23','Batsman',5)
	INSERT Players VALUES('Travis Head','1993-03-23','Batsman',5)
	INSERT Players VALUES('Moises Henriques','1995-03-23','Batsman',5)
	INSERT Players VALUES('Chris Lynn','1990-03-23','Batsman',5)
	INSERT Players VALUES('Steve Smith','1991-03-23','Batsman',5)
	INSERT Players VALUES('Marcus Stoinis','1998-03-23','Batsman',5)
	INSERT Players VALUES('David Warner','1997-03-23','Batsman',5)
	INSERT Players VALUES('Glenn Maxwell','1994-03-23','All Rounder',5)	
	INSERT Players VALUES('Adam Zampa','1999-03-23','Bowler',5)
	INSERT Players VALUES('Mitchell Starc','1994-03-23','Bowler',5)
	INSERT Players VALUES('James Pattinson','1991-03-23','Bowler',5)
	INSERT Players VALUES('Pat Cummins','1995-03-23','Bowler',5)
	INSERT Players VALUES('John Hastings','1994-03-23','Bowler',5)
	INSERT Players VALUES('Josh Hazlewood','1993-03-23','Bowler',5)


	---Banglandesh

	INSERT Players VALUES('Mushfiqur Rahim','1991-03-23','Wicket Keeper',10)
	INSERT Players VALUES('Imrul Kayes','1992-03-23','Batsman',10)
	INSERT Players VALUES('Mosaddek Hossain','1993-03-23','Batsman',10)
	INSERT Players VALUES('Sabbir Rahman','1995-03-23','Batsman',10)
	INSERT Players VALUES('Somya Sarkar','1990-03-23','Batsman',10)
	INSERT Players VALUES('Sunzamul Islam','1991-03-23','Batsman',10)
	INSERT Players VALUES('Tamim Iqbal','1998-03-23','Batsman',10)
	INSERT Players VALUES('Mahmudullah','1994-03-23','All Rounder',10)	
	INSERT Players VALUES('Mehidi Hasan','1994-03-23','All Rounder',10)	
	INSERT Players VALUES('Shakib Al Hasan','1994-03-23','All Rounder',10)	
	INSERT Players VALUES('Mashrafe Mortaza','1999-03-23','Bowler',10)
	INSERT Players VALUES('Mustafizur Rahman','1994-03-23','Bowler',10)
	INSERT Players VALUES('Rubel Hossain','1991-03-23','Bowler',10)
	INSERT Players VALUES('Shafiul Islam','1995-03-23','Bowler',10)
	INSERT Players VALUES('Taskin Ahmed','1994-03-23','Bowler',10)

	----England

	INSERT Players VALUES('Jonny Bairstow','1991-03-23','Wicket Keeper',4)
	INSERT Players VALUES('Sam Billings','1991-03-23','Wicket Keeper',4)
	INSERT Players VALUES('Jos Buttler','1991-03-23','Wicket Keeper',4)
	INSERT Players VALUES('Alex Hales','1992-03-23','Batsman',4)
	INSERT Players VALUES('Eoin Morgan','1993-03-23','Batsman',4)
	INSERT Players VALUES('Joe Root','1995-03-23','Batsman',4)
	INSERT Players VALUES('Jason Roy','1990-03-23','Batsman',4)
	INSERT Players VALUES('Moeen Ali','1994-03-23','All Rounder',4)	
	INSERT Players VALUES('Ben Stokes','1994-03-23','All Rounder',4)	
	INSERT Players VALUES('Jake Ball','1999-03-23','Bowler',4)
	INSERT Players VALUES('Steven Finn','1994-03-23','Bowler',4)
	INSERT Players VALUES('Liam Plunkett','1991-03-23','Bowler',4)
	INSERT Players VALUES('Adil Rashid','1995-03-23','Bowler',4)
	INSERT Players VALUES('David Willey','1994-03-23','Bowler',4)
	INSERT Players VALUES('Mark Wood','1994-03-23','Bowler',4)

		---INDIA

	INSERT Players VALUES('MS Dhoni','1991-03-23','Wicket Keeper',3)
	INSERT Players VALUES('Dinesh Karthik','1991-03-23','Wicket Keeper',3)


	INSERT Players VALUES('Shikhar Dhawan','1992-03-23','Batsman',3)
	INSERT Players VALUES('Virat Kohli','1993-03-23','Batsman',3)
	INSERT Players VALUES('Ajinkya Rahane','1995-03-23','Batsman',3)
	INSERT Players VALUES('Rohit Sharma','1990-03-23','Batsman',3)
	INSERT Players VALUES('Yuvraj Singh','1991-03-23','Batsman',3)
	INSERT Players VALUES('Ravindra Jadeja','1994-03-23','All Rounder',3)	
	INSERT Players VALUES('Kedar Jadhav','1994-03-23','All Rounder',3)	
	INSERT Players VALUES('Hardik Pandya','1994-03-23','All Rounder',3)	
	INSERT Players VALUES('Ravichandran Ashwin','1999-03-23','Bowler',3)
	INSERT Players VALUES('Jasprit Bumrah','1994-03-23','Bowler',3)
	INSERT Players VALUES('Bhuvneshwar Kumar','1991-03-23','Bowler',3)
	INSERT Players VALUES('Mohammed Shami','1995-03-23','Bowler',3)
	INSERT Players VALUES('Umesh Yadav','1994-03-23','Bowler',3)

			---NewZealand

	INSERT Players VALUES('Tom Latham','1991-03-23','Wicket Keeper',1)
	INSERT Players VALUES('Luke Ronchi','1991-03-23','Wicket Keeper',1)
	INSERT Players VALUES('Neil Broom','1992-03-23','Batsman',1)
	INSERT Players VALUES('Martin Guptill','1993-03-23','Batsman',1)
	INSERT Players VALUES('Ross Taylor','1995-03-23','Batsman',1)
	INSERT Players VALUES('Kane Williamson','1990-03-23','Batsman',1)
	INSERT Players VALUES('Corey Anderson','1994-03-23','All Rounder',1)	
	INSERT Players VALUES('Colin de Grandhomme','1994-03-23','All Rounder',1)	
	INSERT Players VALUES('Jimmy Neesham','1994-03-23','All Rounder',1)	
	INSERT Players VALUES('Trent Boult','1999-03-23','Bowler',1)
	INSERT Players VALUES('Mitchell McClenaghan','1994-03-23','Bowler',1)
	INSERT Players VALUES('Adam Milne','1991-03-23','Bowler',1)
	INSERT Players VALUES('Jeetan Patel','1995-03-23','Bowler',1)
	INSERT Players VALUES('Mitchell Santner','1994-03-23','Bowler',1)
	INSERT Players VALUES('Tim Southee','1994-03-23','Bowler',1)

		---NewZealand

	INSERT Players VALUES('Sarfraz Ahmed','1991-03-23','Wicket Keeper',2)
	INSERT Players VALUES('Ahmed Shehzad','1992-03-23','Batsman',2)
	INSERT Players VALUES('Azhar Ali','1993-03-23','Batsman',2)
	INSERT Players VALUES('Babar Azam','1995-03-23','Batsman',2)
	INSERT Players VALUES('Fakhar Zaman','1990-03-23','Batsman',2)
	INSERT Players VALUES('Mohammad Hafeez','1990-03-23','Batsman',2)
	INSERT Players VALUES('shoaib Malik','1990-03-23','Batsman',2)
	INSERT Players VALUES('Haris Sohail','1994-03-23','Batsman',2)	
	INSERT Players VALUES('Fahim Ashraf','1994-03-23','All Rounder',2)	
	INSERT Players VALUES('Shadab Khan','1994-03-23','All Rounder',2)	
	INSERT Players VALUES('Imad Wasim','1994-03-23','All Rounder',2)
	INSERT Players VALUES('Hasan Ali','1999-03-23','Bowler',2)
	INSERT Players VALUES('Junaid Khan','1991-03-23','Bowler',2)
	INSERT Players VALUES('Mohammad Amir','1995-03-23','Bowler',2)
	INSERT Players VALUES('Rumman Raees','1994-03-23','Bowler',2)


		---Srilanka

	INSERT Players VALUES('Dinesh Chandimal','1991-03-23','Wicket Keeper',6)
	INSERT Players VALUES('Niroshan Dickwella','1991-03-23','Wicket Keeper',6)
	INSERT Players VALUES('Dhananjaya de Silva','1992-03-23','Batsman',6)
	INSERT Players VALUES('Asela Gunaratne','1993-03-23','Batsman',6)
	INSERT Players VALUES('Danushka Gunathilaka','1995-03-23','Batsman',6)
	INSERT Players VALUES('Kusal Mendis','1990-03-23','Batsman',6)
	INSERT Players VALUES('Angelo Mathews','1994-03-23','All Rounder',6)	
	INSERT Players VALUES('Thisara Perera','1994-03-23','All Rounder',6)	
	INSERT Players VALUES('Upul Tharanga','1994-03-23','All Rounder',6)	
	INSERT Players VALUES('Nuwan Kulasekera','1999-03-23','Bowler',6)
	INSERT Players VALUES('Suranga Lakmal','1994-03-23','Bowler',6)
	INSERT Players VALUES('Lasith Malinga','1991-03-23','Bowler',6)
	INSERT Players VALUES('Nuwan Pradeep','1995-03-23','Bowler',6)
	INSERT Players VALUES('Seekkuge Prasanna','1994-03-23','Bowler',6)
	INSERT Players VALUES('Lakshan Sandakan','1994-03-23','Bowler',6)

	
		---Srilanka

	INSERT Players VALUES('Quinton de Kock','1991-03-23','Wicket Keeper',8)
	INSERT Players VALUES('AB de Villiers','1991-03-23','Wicket Keeper',8)
	INSERT Players VALUES('Hashim Amla','1992-03-23','Batsman',8)
	INSERT Players VALUES('Farhaan Behardien','1993-03-23','Batsman',8)
	INSERT Players VALUES('Faf du Plessis','1995-03-23','Batsman',8)
	INSERT Players VALUES('JP Duminy','1990-03-23','Batsman',8)
	INSERT Players VALUES('David Miller','1990-03-23','Batsman',8)
	INSERT Players VALUES('Andile Phehlukwayo','1994-03-23','All Rounder',8)	
	INSERT Players VALUES('Morne Morkel','1999-03-23','Bowler',8)
	INSERT Players VALUES('Chris Morris','1994-03-23','Bowler',8)
	INSERT Players VALUES('Wayne Parnell','1991-03-23','Bowler',8)
	INSERT Players VALUES('Dwaine Pretorius','1995-03-23','Bowler',8)
	INSERT Players VALUES('Kagiso Rabada','1994-03-23','Bowler',8)
	INSERT Players VALUES('Imran Tahir','1994-03-23','Bowler',8)

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

--Group A 
	INSERT MATCHES VALUES(10,4,'2019-12-12',36,1,4,1)
	INSERT MATCHES VALUES(5,1,'2020-1-1',NULL,2,NULL,1)
	INSERT MATCHES VALUES(10,5,'2020-2-2',NULL,1,NULL,1)
	INSERT MATCHES VALUES(4,1,'2020-1-3',40,3,4,1)
	INSERT MATCHES VALUES(1,10,'2020-3-3',25,2,10,1)
	INSERT MATCHES VALUES(5,4,'2020-2-1',39,2,4,1)
	
--Group B	
	INSERT MATCHES VALUES(6,8,'2019-12-12',119,1,8,1)
	INSERT MATCHES VALUES(2,3,'2020-1-1',52,2,3,1)
	INSERT MATCHES VALUES(8,2,'2020-2-2',87,3,2,1)
	INSERT MATCHES VALUES(3,6,'2020-1-3',96,1,6,1)
	INSERT MATCHES VALUES(8,3,'2020-3-3',57,2,3,1)
	INSERT MATCHES VALUES(6,2,'2020-2-1',76,3,2,1)

--Semi's

	INSERT MATCHES VALUES(4,2,'2020-4-4',87,1,2,1)
	INSERT MATCHES VALUES(10,3,'2020-4-5',51,2,3,1)

--Final

	INSERT MATCHES VALUES(2,3,'2020-5-20',80,1,2,1)

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

--Match 1
	

	--Bang vs Eng

	--Bang
	INSERT PlayerStats VALUES(20,1,1,28,34,0,0,0,0,0,1,0,0)
	INSERT PlayerStats VALUES(22,1,1,128,142,0,0,0,0,0,3,0,0)
	INSERT PlayerStats VALUES(17,1,1,19,20,0,0,0,0,0,0,0,0)
	INSERT PlayerStats VALUES(16,1,1,79,72,0,0,0,2,0,0,0,0)
	INSERT PlayerStats VALUES(19,1,1,24,15,1,13,1,0,0,0,0,0)
	INSERT PlayerStats VALUES(23,1,1,6,6,0,0,0,0,0,1,0,0)
	INSERT PlayerStats VALUES(18,1,1,2,3,0,47,7,0,0,0,0,0)
	INSERT PlayerStats VALUES(26,1,1,0,0,1,56,10,0,0,0,0,0)
	INSERT PlayerStats VALUES(25,1,1,0,0,0,62,8,0,0,0,0,0)
	INSERT PlayerStats VALUES(27,1,1,0,0,0,51,9,0,0,0,0,0)
	INSERT PlayerStats VALUES(28,1,1,0,0,0,64,10,0,0,0,0,0)


	--Eng
	INSERT PlayerStats VALUES(37,1,1,1,8,0,0,0,0,0,0,0,0)
	INSERT PlayerStats VALUES(34,1,1,95,86,0,0,0,0,0,2,0,0)
	INSERT PlayerStats VALUES(36,1,1,133,129,0,0,0,0,0,1,0,0)
	INSERT PlayerStats VALUES(35,1,1,75,61,0,0,0,0,0,2,0,0)

	INSERT PlayerStats VALUES(45,1,1,0,0,0,58,10,0,0,0,0,0)
	INSERT PlayerStats VALUES(40,1,1,0,0,1,82,10,0,0,0,0,0)
	INSERT PlayerStats VALUES(39,1,1,0,0,1,42 ,7,0,0,0,0,0)
	INSERT PlayerStats VALUES(42,1,1,0,0,4,59, 10,1,1,0,0,0)
	INSERT PlayerStats VALUES(38,1,1,0,0,0,40, 5,1,1,0,0,0)
	INSERT PlayerStats VALUES(36,1,1,0,0,0,18, 3,1,2,0,0,0)
	INSERT PlayerStats VALUES(33,1,1,0,0,0,0  ,0,2,3,0,0,0)


---Match 2
		--NZ vs Aus

	--NZ                      pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
 INSERT PlayerStats VALUES(64 ,2 ,1 ,26 ,22 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(62 ,2 ,1 ,65 ,43 ,0 ,0 ,0 ,1, 1 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(66 ,2 ,1 ,100 ,97 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(65 ,2 ,1 ,46 ,58 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(63 ,2 ,1 ,14 ,19 ,0 ,13 ,1 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(69 ,2 ,1 ,6 ,6 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(67 ,2 ,1 ,8 ,3 ,0 ,47 ,7 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(74 ,2 ,1 ,8 ,0 ,0 ,56 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(72 ,2 ,1 ,11 ,7 ,2 ,9 ,2 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(75 ,2 ,1 ,0, 0 ,0 ,15 ,3 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(70 ,2 ,1 ,0 ,2 ,1 ,28 ,4 ,0 ,0 ,0 ,0 ,0)




    --Aus                     pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
 INSERT PlayerStats VALUES( 8 ,2 ,1 ,18 ,16 ,0 ,0 ,0 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES( 2 ,2 ,1 ,8 ,18 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES( 6 ,2 ,1 ,8 ,6 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES( 4 ,2 ,1 ,18 ,14 ,0 ,25 ,5 ,1, 1 ,0 ,0 ,0)

 INSERT PlayerStats VALUES(11 ,2 ,1 ,11 ,7 ,0 ,52 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(15 ,2 ,1 ,0, 0 ,6 ,52 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(13 ,2 ,1 ,0 ,2 ,1 ,67 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(14 ,2 ,1 ,0 ,2 ,2 ,69 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES( 3 ,2 ,1 ,0 ,2 ,0 ,22 ,4 ,0 ,0 ,0 ,0 ,0)




 --Match 3
 
 --BAng pi ,mi,ti,ru ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
 INSERT PlayerStats VALUES(22 ,3 ,1 ,95 ,114 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(20 ,3 ,1 ,3 ,11 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(17 ,3 ,1 ,6 ,16 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(16 ,3 ,1 ,9 ,20 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(25 ,3 ,1 ,29 ,48 ,0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(19 ,3 ,1 ,8 ,14 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(23 ,3 ,1 ,8 ,11 ,0 ,47 ,0 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(24 ,3 ,1 ,14 ,26 ,0 ,56 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(26 ,3 ,1 ,0 ,2 ,0 ,30 ,6 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(28 ,3 ,1 ,0, 1 ,1 ,21 ,4 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(27 ,3 ,1 ,1 ,4 ,0 ,27 ,5 ,0 ,0 ,0 ,0 ,0)

    --Aus                     pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
	INSERT PlayerStats VALUES( 8 ,3 ,1 ,40 ,44 ,0 ,0 ,0 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES( 2 ,3 ,1 ,19 ,27 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES( 6 ,3 ,1 ,22 ,25 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 
 INSERT PlayerStats VALUES(11 ,3 ,1 ,0 ,0 ,4 ,29 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(15 ,3 ,1 ,0, 0 ,1 ,40 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(13 ,3 ,1 ,0 ,0 ,1 ,22 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES( 3 ,3 ,1 ,0 ,0 ,1 ,33 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES( 4 ,3 ,1 ,0 ,0 ,1 ,30 ,5 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(10 ,3 ,1 ,0 ,0 ,2 ,13 ,4 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES( 9 ,3 ,1 ,0 ,0 ,0 ,9 ,1 ,1, 1 ,0 ,0 ,0)



-- MAtch 4


	--NZ                      pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
 INSERT PlayerStats VALUES(64 ,4 ,1 ,27 ,33 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(62 ,4 ,1 ,0 ,1 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(66 ,4 ,1 ,87 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(65 ,4 ,1 ,39 ,59 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(63 ,4 ,1 ,11 ,21 ,0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(69 ,4 ,1 ,18 ,14 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(67 ,4 ,1 ,10 ,15 ,3 ,55 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(74 ,4 ,1 ,3 ,9 ,4 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(72 ,4 ,1 ,10 ,11 ,0 ,79 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(75 ,4 ,1 ,2, 6 ,2 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(70 ,4 ,1 ,0 ,0 ,1 ,56 ,10 ,0 ,0 ,0 ,0 ,0)


		 --Eng                pi  ,mi ,ti ,ru  ,bf ,wt ,rc ,tO,Ct, TC, Si, St,Ec
 INSERT PlayerStats VALUES(37 ,4 ,1 ,13 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(34 ,4 ,1 ,56 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(36 ,4 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(35 ,4 ,1 ,13 ,12 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(39 ,4 ,1 ,48 ,53 ,1 ,46 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(33 ,4 ,1 ,61 ,48 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(38 ,4 ,1 ,12 ,11 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(43 ,4 ,1 ,12 ,11 ,2 ,47 ,10 ,0 ,0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(42 ,4 ,1 ,15 ,10 ,0 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(45 ,4 ,1 ,0 ,1 ,1 ,32 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(40 ,4 ,1 ,0 ,1 ,6 ,31 ,8 ,0 ,0 ,0 ,0 ,0)
 

--Match 5


  	--Bang vs Eng

	--New

	INSERT PlayerStats VALUES(64,5,1,28,34,0,0,0,0,0,1,0,0)
	INSERT PlayerStats VALUES(62,5,1,128,142,0,0,0,0,0,3,0,0)
	INSERT PlayerStats VALUES(66,5,1,19,20,0,0,0,0,0,0,0,0)
	INSERT PlayerStats VALUES(65,5,1,79,72,0,0,0,2,0,0,0,0)
	INSERT PlayerStats VALUES(63,5,1,24,15,1,13,1,0,0,0,0,0)
	INSERT PlayerStats VALUES(69,5,1,6,6,0,0,0,0,0,1,0,0)
	INSERT PlayerStats VALUES(67,5,1,2,3,0,47,7,0,0,0,0,0)
	INSERT PlayerStats VALUES(74,5,1,0,0,1,56,10,0,0,0,0,0)
	INSERT PlayerStats VALUES(72,5,1,0,0,0,62,8,0,0,0,0,0)
	INSERT PlayerStats VALUES(75,5,1,0,0,0,51,9,0,0,0,0,0)
	INSERT PlayerStats VALUES(70,5,1,0,0,0,64,10,0,0,0,0,0)


	--Bang
 INSERT PlayerStats VALUES(20,5,1,1,8,0,0,0,0,0,0,0,0)
 INSERT PlayerStats VALUES(22,5,1,79,86,0,0,0,0,0,2,0,0)
 INSERT PlayerStats VALUES(25,5,1,133,129,0,0,0,0,0,1,0,0)
 INSERT PlayerStats VALUES(16,5,1,75,61,0,0,0,0,0,2,0,0)

 INSERT PlayerStats VALUES(19,5,1,0,0,0,58,10,0,0,0,0,0)
 INSERT PlayerStats VALUES(23,5,1,0,0,1,82,10,0,0,0,0,0)
 INSERT PlayerStats VALUES(18,5,1,0,0,1,42,7,0,0,0,0,0)
 INSERT PlayerStats VALUES(26,5,1,0,0,4,59,10,1,1,0,0,0)
 INSERT PlayerStats VALUES(17,5,1,0,0,0,40,8,1,1,0,0,0)
 INSERT PlayerStats VALUES(27,5,1,0,0,0,18,3,1,2,0,0,0)
 INSERT PlayerStats VALUES(28,5,1,0,0,0,0,0,2,3,0,0,0)



-- MAtch 6
-- Aus vs Eng
 
	
	
		--Aus                pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
	INSERT PlayerStats VALUES(8 ,6 ,1 ,27 ,33 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(2 ,6 ,1 ,0 ,1 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(6 ,6 ,1 ,87 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(4 ,6 ,1 ,39 ,59 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(3 ,6 ,1 ,11 ,21 ,0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(9 ,6 ,1 ,18 ,14 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(1 ,6 ,1 ,10 ,15 ,1 ,55 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(11 ,6 ,1 ,3 ,9 ,4 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(13 ,6 ,1 ,10 ,11 ,1 ,79 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(15 ,6 ,1 ,2, 6 ,2 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(14 ,6 ,1 ,0 ,0 ,1 ,56 ,10 ,0 ,0 ,0 ,0 ,0)


		 --Eng                pi  ,mi ,ti ,ru  ,bf ,wt ,rc ,tO,Ct, TC, Si, St,Ec
	INSERT PlayerStats VALUES(37 ,6 ,1 ,13 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(34 ,6 ,1 ,56 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(36 ,6 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(35 ,6 ,1 ,13 ,12 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(39 ,6 ,1 ,48 ,53 ,5 ,46 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(33 ,6 ,1 ,61 ,48 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(38 ,6 ,1 ,12 ,11 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(43 ,6 ,1 ,12 ,11 ,2 ,47 ,10 ,0 ,0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(42 ,6 ,1 ,15 ,10 ,0 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(45 ,6 ,1 ,0 ,1 ,0 ,32 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(40 ,6 ,1 ,0 ,1 ,2 ,31 ,8 ,0 ,0 ,0 ,0 ,0)
 




--Match 7




	-- SL                      pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
	INSERT PlayerStats VALUES(94 ,7 ,1 ,27 ,33 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(95 ,7 ,1 ,7 ,3 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(96 ,7 ,1 ,87 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(91 ,7 ,1 ,39 ,52 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(97 ,7 ,1 ,11 ,21 ,0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(92 ,7 ,1 ,18 ,14 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(98 ,7 ,1 ,10 ,15 ,3 ,55 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(100 ,7 ,1 ,3 ,9 ,2 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(102 ,7 ,1 ,10 ,11 ,3 ,79 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(103 ,7 ,1 ,2, 6 ,0 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(104 ,7 ,1 ,0 ,1 ,0 ,56 ,10 ,0 ,0 ,0 ,0 ,0)


		 --SA                pi  ,mi ,ti ,ru  ,bf ,wt ,rc ,tO,Ct, TC, Si, St,Ec
 INSERT PlayerStats VALUES(106 ,7 ,1 ,13 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(108 ,7 ,1 ,56 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(107 ,7 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(110 ,7 ,1 ,13 ,12 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(111 ,7 ,1 ,38 ,53 ,1 ,46 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(112 ,7 ,1 ,51 ,48 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(109 ,7 ,1 ,12 ,11 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(113 ,7 ,1 ,12 ,11 ,1 ,47 ,10 ,0 ,0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(119 ,7 ,1 ,15 ,10 ,6 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(118 ,7 ,1 ,0 ,0 ,0 ,32 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(116 ,7 ,1 ,0 ,0 ,2 ,31 ,8 ,0 ,0 ,0 ,0 ,0)





--Match 8

-- Ind Vs PAk

--  PAK                      pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
	INSERT PlayerStats VALUES(77 ,8 ,1 ,27 ,33 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(78 ,8 ,1 ,0 ,1 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(79 ,8 ,1 ,87 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(81 ,8 ,1 ,39 ,59 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(82 ,8 ,1 ,11 ,21 ,0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(83 ,8 ,1 ,18 ,14 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(84 ,8 ,1 ,10 ,15 ,0 ,55 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(85 ,8 ,1 ,3 ,9 ,3 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(87 ,8 ,1 ,10 ,11 ,2 ,79 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(88 ,8 ,1 ,2, 6 ,1 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(86 ,8 ,1 ,0 ,0 ,1 ,56 ,10 ,0 ,0 ,0 ,0 ,0)



		 --IND                pi  ,mi ,ti ,ru  ,bf ,wt ,rc ,tO,Ct, TC, Si, St,Ec
	INSERT PlayerStats VALUES(48 ,8 ,1 ,33 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(51 ,8 ,1 ,76 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(49 ,8 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(50 ,8 ,1 ,33 ,22 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(52 ,8 ,1 ,48 ,53 ,5 ,46 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(53 ,8 ,1 ,42 ,21 ,1 ,47 ,10 ,0 ,0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(57 ,8 ,1 ,15 ,10 ,1 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(58 ,8 ,1 ,0 ,1 ,1 ,32 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(55 ,8 ,1 ,0 ,1 ,2 ,31 ,8 ,0 ,0 ,0 ,0 ,0)




  ---Match 

  -- PAK                      pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
	INSERT PlayerStats VALUES(77 ,9 ,1 ,27 ,33 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(78 ,9 ,1 ,22 ,21 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(79 ,9 ,1 ,117 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(81 ,9 ,1 ,49 ,59 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(82 ,9 ,1 ,21 ,21 ,0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(83 ,9 ,1 ,18 ,14 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(84 ,9 ,1 ,10 ,15 ,0 ,75 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(85 ,9 ,1 ,11 ,9 ,2 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(87 ,9 ,1 ,10 ,11 ,6 ,29 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(88 ,9 ,1 ,9, 6 ,1 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(86 ,9 ,1 ,0 ,0 ,0 ,56 ,10 ,0 ,0 ,0 ,0 ,0)


		 --SA                pi  ,mi ,ti ,ru  ,bf ,wt ,rc ,tO,Ct, TC, Si, St,Ec
 INSERT PlayerStats VALUES(106 ,9 ,1 ,13 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(108 ,9 ,1 ,56 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(107 ,9 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(110 ,9 ,1 ,13 ,12 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(111 ,9 ,1 ,38 ,53 ,1 ,46 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(112 ,9 ,1 ,51 ,48 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(109 ,9 ,1 ,12 ,11 ,1 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(113 ,9 ,1 ,12 ,11 ,1 ,47 ,10 ,0 ,0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(119 ,9 ,1 ,15 ,10 ,2 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(118 ,9 ,1 ,1 ,1 ,2 ,32 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(116 ,9 ,1 ,0 ,1 ,2 ,31 ,10 ,0 ,0 ,0 ,0 ,0)



--Match 10 
  --IND VS SL

   --IND                      pi  ,mi ,ti ,ru  ,bf ,wt ,rc ,tO,Ct, TC, Si, St,Ec
	INSERT PlayerStats VALUES(48 ,10 ,1 ,33 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(51 ,10 ,1 ,76 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(49 ,10 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(50 ,10 ,1 ,33 ,22 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(52 ,10 ,1 ,48 ,53 ,2 ,46 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(53 ,10 ,1 ,42 ,21 ,1 ,47 ,10 ,0 ,0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(57 ,10 ,1 ,10 ,10 ,1 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(58 ,10 ,1 ,0 ,1 ,2 ,32 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(55 ,10 ,1 ,0 ,1 ,2 ,31 ,10 ,0 ,0 ,0 ,0 ,0)


		-- SL                  pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
 INSERT PlayerStats VALUES(96 ,10 ,1 ,127 ,133,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(95 ,10 ,1 ,7 ,3 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(94 ,10, 1 ,48 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(91 ,10 ,1 ,39 ,52 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(97 ,10 ,1 ,11 ,21 ,0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(92 ,10 ,1 ,18 ,14 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(98 ,10 ,1 ,10 ,15 ,3 ,55 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(100 ,10,1 ,5 ,9 ,2 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(102 ,10,1 ,9 ,11 ,3 ,79 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(103 ,10,1 ,0, 0 ,0 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(104 ,10,1 ,0 ,0 ,0 ,56 ,10 ,0 ,0 ,0 ,0 ,0)




	--Match 11

	  --IND                    pi  ,mi ,ti ,ru  ,bf ,wt ,rc ,tO,Ct, TC, Si, St,Ec
	INSERT PlayerStats VALUES(48 ,11 ,1 ,33 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(51 ,11 ,1 ,76 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(49 ,11 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(50 ,11 ,1 ,33 ,22 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(52 ,11 ,1 ,0 ,0 ,0 ,46 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(53 ,11 ,1 ,0 ,0 ,0 ,47 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(57 ,11 ,1 ,0 ,0 ,6 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(58 ,11 ,1 ,0 ,0 ,2 ,32 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(55 ,11 ,1 ,0 ,0 ,2 ,31 ,8 ,0 ,0 ,0 ,0 ,0)



   --SA	                      pi  ,mi ,ti ,ru  ,bf ,wt  ,rc ,tO  ,Ct, TC, Si, St,Ec
 INSERT PlayerStats VALUES(106 ,11 ,1 ,13 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(108 ,11 ,1 ,26 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(107 ,11 ,1 ,14 ,25 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(110 ,11 ,1 ,13 ,12 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(111 ,11 ,1 ,8 ,23 ,1 ,46 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(112 ,11 ,1 ,51 ,48 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(109 ,11 ,1 ,1 ,11 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(113 ,11 ,1 ,12 ,11 ,1 ,47 ,10 ,0 ,0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(119 ,11 ,1 ,15 ,10 ,6 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(118 ,11 ,1 ,1 ,1 ,0 ,32 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(116 ,11 ,1 ,1 ,1 ,2 ,31 ,8 ,0 ,0 ,0 ,0 ,0)




--Match 12



		-- SL                  pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec
	INSERT PlayerStats VALUES(96 ,12 ,1 ,107 ,133 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(95 ,12 ,1 ,7 ,3 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(94 ,12,1 ,57 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(91 ,12 ,1 ,39 ,52 , 0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(97 ,12 ,1 ,11 ,21 , 0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(92 ,12,1 ,18 ,14 , 0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(98 ,12 ,1 ,10 ,15 , 1 ,55 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(100 ,12 ,1 ,5 ,9 ,2 ,71,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(102 ,12,1 ,9 ,11 , 1 ,79 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(103 ,12 ,1 ,0, 0 ,0 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(104 ,12 ,1 ,0 ,0 ,0 ,56 ,10 ,0 ,0 ,0 ,0 ,0)


	--pak
	INSERT PlayerStats VALUES(76 ,12 ,1 ,127 ,33 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(78 ,12 ,1 ,22 ,21 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(79 ,12 ,1 ,17 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(81 ,12 ,1 ,39 ,59 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(82 ,12 ,1 ,51 ,21, 0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(83 ,12 ,1 ,8 ,14 , 0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(84 ,12 ,1 ,0 ,0 , 0 ,75 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(85 ,12 ,1 ,0 ,0 ,2 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(87 ,12 ,1 ,0 ,0 , 6 ,29 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(88 ,12 ,1 ,0, 0 ,1 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(86 ,12 ,1 ,0 ,0 ,0 ,56 ,10 ,0 ,0 ,0 ,0 ,0)




--Semi-Final



--pak
 INSERT PlayerStats VALUES(80 ,13 ,1 ,45 ,33 ,0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(78 ,13 ,1 ,76 ,21 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(79 ,13 ,1 ,17 ,98 ,0 ,0 ,0 ,0, 0 ,3 ,0 ,0)
 INSERT PlayerStats VALUES(81 ,13 ,1 ,39 ,59 ,0 ,0 ,0 ,1, 1 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(82 ,13 ,1 ,51 ,21, 0 ,13 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(83 ,13 ,1 ,8 ,14 , 0 ,0 ,0 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(84 ,13 ,1 ,0 ,0 , 0 ,75 ,10 ,0, 0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(85 ,13 ,1 ,0 ,0 ,0 ,71 ,10 ,0, 0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(87 ,13 ,1 ,0 ,0 , 5 ,29 ,10, 0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(88 ,13 ,1 ,0, 0 ,1 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(86 ,13 ,1 ,0 ,0 ,2 ,56 ,10 ,0 ,0 ,0 ,0 ,0)
--eng 

 INSERT PlayerStats VALUES(37 ,13 ,1 ,13 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(34 ,13 ,1 ,56 ,62 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(36 ,13 ,1 ,64 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(35 ,13 ,1 ,13 ,12 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(39 ,13 ,1 ,48 ,53 ,5 ,46 ,8 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(33 ,13 ,1 ,0 ,4 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(38 ,13 ,1 ,12 ,11 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(43 ,13 ,1 ,12 ,11 ,2 ,47 ,10 ,0 ,0 ,1 ,0 ,0)
 INSERT PlayerStats VALUES(42 ,13 ,1 ,15 ,10 ,0 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(45 ,13 ,1 ,2 ,1 ,0 ,32 ,9 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(40 ,13 ,1 ,0 ,1 ,2 ,31 ,8 ,0 ,0 ,0 ,0 ,0)


--Match 14 
-- Second Semi Final


--IND
	--                 pi ,mi,ti,ru ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec  
 INSERT PlayerStats VALUES(48 ,14 ,1 ,34 ,23 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(51 ,14 ,1 ,176,162 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(49 ,14 ,1 ,53 ,65 ,0 ,0 ,0 ,0 ,0 ,2 ,0 ,0)
 INSERT PlayerStats VALUES(52 ,14 ,1 ,0 ,0 ,0 ,46 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(53 ,14 ,1 ,0 ,0 ,0 ,47 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(57 ,14 ,1 ,0 ,0 ,0 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(58 ,14 ,1 ,0 ,0 ,1 ,32 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(55 ,14 ,1 ,0 ,0 ,1 ,31 ,10 ,0 ,0 ,0 ,0 ,0)

--BANG
	INSERT PlayerStats VALUES(20,14,1,50  ,8, 0, 0,   0,0,0,0,0,0)
	INSERT PlayerStats VALUES(22,14,1,94 ,86, 0 ,0,   0,0,0,2,0,0)
	INSERT PlayerStats VALUES(25,14,1,63, 129,0 ,0   ,0,0,0,1,0,0)
	INSERT PlayerStats VALUES(16,14,1,55, 61 ,0 ,0   ,0 ,0,0,2,0,0)
	INSERT PlayerStats VALUES(19,14,1,0  ,0  ,0 ,58, 10,0,0,0,0,0)
	INSERT PlayerStats VALUES(23,14,1,0  ,0  ,1 ,12, 10,0,0,0,0,0)
	INSERT PlayerStats VALUES(18,14,1,0  ,0  ,0 ,22, 10,0,0,0,0,0)
	INSERT PlayerStats VALUES(26,14,1,0  ,0  ,0 ,59, 10,1,1,0,0,0)
	INSERT PlayerStats VALUES(17,14,1,0  ,0  ,0 ,40, 10,1,1,0,0,0)
	INSERT PlayerStats VALUES(27,14,1,0  ,0  ,0 ,18 ,0,1,2,0,0,0)
	INSERT PlayerStats VALUES(28,14,1,0,  0  ,0 ,0, 0,2,3,0,0,0)





--MATCH 15 Crazy Final

		-- pak                  pi ,mi,ti,ru  ,bf ,wt,rc ,tO, Ct,TC,Si,St,Ec

	INSERT PlayerStats VALUES(78,15,1,59,71,  0,0,0,1,1,1,0,0)
	INSERT PlayerStats VALUES(80,15,1,114,106,0,0,0,0,0,3,0,0)
	INSERT PlayerStats VALUES(79,15,1,46,52,  0,0,0,1,1,0,0,0)
	INSERT PlayerStats VALUES(82,15,1,12,16,  0,13,1,0,0,1,0,0)
	INSERT PlayerStats VALUES(81,15,1,57,37,  0,0,0,0,0,3,0,0)
	INSERT PlayerStats VALUES(86,15,1,25,21,  0,7,10,0,0,1,0,0)
	INSERT PlayerStats VALUES(89,15,1,0, 0,   3,16,6,0,0,0,0,0)
	INSERT PlayerStats VALUES(88,15,1,0, 0,   1,20,6,0,0,0,0,0)
	INSERT PlayerStats VALUES(87,15,1,0, 0,   3,19,7,0,0,0,0,0)
	INSERT PlayerStats VALUES(85,15,1,0, 0,   3,60,7,0,0,0,0,0)



	--ind

	  -------              pi ,mi,ti, ru  ,bf ,wt, rc ,tO, Ct, TC, Si, St,Ec
 INSERT PlayerStats VALUES(52,15,1,22,31 ,0 ,46 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(46,15,1,4,16 ,0 ,47 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(54,15,1,9,13 ,0 ,55 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(55,15,1,76,43 ,1 ,53 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(53,15,1,15,26 ,1 ,67 ,0 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(56,15,1,1,3 ,0 ,70 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(58,15,1,1,8 ,1 ,44 ,10 ,0 ,0 ,0 ,0 ,0)
 INSERT PlayerStats VALUES(57,15,1,1,9 ,0 ,68 ,0 ,0 ,0 ,0 ,0 ,0)


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

Create TABLE PCL_Review(

Email Nvarchar(50),
Subject Nvarchar(50),
Message Nvarchar(500)

);
-----------------------------------------------------------------------------------------------------------------------------------