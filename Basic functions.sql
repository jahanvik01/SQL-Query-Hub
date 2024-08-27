-- creating database --
Create Database Stadium;

-- using database--
Use Stadium;

-- creating table--
Create Table MatchDetails(
S_no int Primary Key,
Match_ID int Not Null,
Season int,
Venue varchar(70),
Innings int Not Null,
Ball float Not Null,
BattingTeam varchar(50),
BowlingTeam varchar(50),
Striker varchar(30),
Bowler varchar(30),
Run_from_bat int Not Null,
Extras int Not Null,
Wides int,
Wicket_type varchar(30),
Player_Dismissed varchar(30));

-- inserting values--
Insert Into MatchDetails 
Values
(1, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 0.1, 'Gujarat Titans', 'Chennai Super Kings', 'wp Saha', 'DL Chahar', 0, 0, null, null, null),
(2, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 0.2, 'Gujarat Titans', 'Chennai Super Kings', 'wp Saha', 'DL Chahar', 0, 1, 1, null, null),
(3, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 0.3, 'Gujarat Titans', 'Chennai Super Kings', 'wp Saha', 'DL Chahar', 1, 0, null, null, null),
(4, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 0.4, 'Gujarat Titans', 'Chennai Super Kings', 'Shubman Gill', 'DL Chahar', 2, 0, null, null, null),
(5, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 0.5, 'Gujarat Titans', 'Chennai Super Kings', 'Shubman Gill', 'DL Chahar', 1, 0, null,null,null),
(6, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 0.6, 'Gujarat Titans', 'Chennai Super Kings', 'wp Saha', 'DL Chahar', 0, 0, null,null,null),
(7, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 1.1, 'Gujarat Titans', 'Chennai Super Kings', 'Shubman Gill', 'TU Deshpande', 4, 0, null,null,null),
(8, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 1.2, 'Gujarat Titans', 'Chennai Super Kings', 'Shubman Gill', 'TU Deshpande', 0, 0, null, 'Catch Out', 'Shubman Gill'),
(9, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 1.3, 'Gujarat Titans', 'Chennai Super Kings', 'B Sai Sudharsan', 'TU Deshpande', 1, 0, null,null,null),
(10, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 1.4, 'Gujarat Titans', 'Chennai Super Kings', 'wp Saha', 'TU Deshpande', 0, 1,1, null,null),
(11, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 1.5, 'Gujarat Titans', 'Chennai Super Kings', 'wp Saha', 'TU Deshpande', 4, 0, null,null,null),
(12, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 1, 1.6, 'Gujarat Titans', 'Chennai Super Kings', 'wp Saha', 'TU Deshpande', 1, 0, null,null,null),
(13, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 0.1, 'Chennai Super Kings', 'Gujarat Titans', 'RD Gaikwad', 'Mohammed Shami', 0, 0, null,null,null),
(14, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 0.2, 'Chennai Super Kings', 'Gujarat Titans', 'RD Gaikwad', 'Mohammed Shami', 0, 0, null, 'Stumped', 'RD Gaikwad'),
(15, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 0.3, 'Chennai Super Kings', 'Gujarat Titans', 'DP Conway', 'Mohammed Shami', 4, 0, null,null,null),
(16, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 0.4, 'Chennai Super Kings', 'Gujarat Titans', 'DP Conway', 'Mohammed Shami', 0, 0, null,null,null),
(17, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 0.5, 'Chennai Super Kings', 'Gujarat Titans', 'DP Conway', 'Mohammed Shami', 0, 0, null, 'Stumped', 'DP Conway'),
(18, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 0.6, 'Chennai Super Kings', 'Gujarat Titans', 'S Dube', 'Mohammed Shami', 0, 0, null,null,null),
(19, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 1.1, 'Chennai Super Kings', 'Gujarat Titans', 'AM Rahane', 'Rashid Khan', 1, 0, null,null,null),
(20, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 1.2, 'Chennai Super Kings', 'Gujarat Titans', 'S Dube', 'Rashid Khan', 2, 0, null,null,null),
(21, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 1.3, 'Chennai Super Kings', 'Gujarat Titans', 'S Dube', 'Rashid Khan', 1, 0, null,null,null),
(22, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 1.4, 'Chennai Super Kings', 'Gujarat Titans', 'AM Rahane', 'Rashid Khan', 4, 0, null,null,null),
(23, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 1.5, 'Chennai Super Kings', 'Gujarat Titans', 'AM Rahane', 'Rashid Khan', 1, 0, null,null,null),
(24, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 1.6, 'Chennai Super Kings', 'Gujarat Titans', 'S Dube', 'Rashid Khan', 1, 0, null,null,null),
(25, 13001, 2023, 'Narendra Modi Stadium, Ahmedabad', 2, 2.1, 'Chennai Super Kings', 'Gujarat Titans', 'AM Rahane', 'Mohammed Shami', 0, 0, null,null,null);

Select * From MatchDetails;  -- to view all columns --
Select BattingTeam From MatchDetails;  -- to view specific column --
Select distinct BattingTeam From MatchDetails;  -- to view dictinct/unique values in the column -- 

-- used to filter record --
Select Extras From MatchDetails
Where Innings = 1;

-- set limit --
Select BattingTeam From MatchDetails
Limit 1;

-- update values in table --
Update MatchDetails          
Set Striker = 'WP Saha' 
Where Striker = 'wp Saha';

-- delete value in table --
Delete from MatchDetails 
Where S_no = 25;

-- Alter table --
Alter table MatchDetails       -- add column --
Add column Gender varchar(10);

Alter table MatchDetails  -- modify datatype --
Modify Gender char(5);

Alter table MatchDetails  -- rename column --
Change column Gender gender char(8);  

Alter table MatchDetails  -- rename table --
Rename to MatchDetail;

Alter table MatchDetail       -- delete column --
Drop column Gender;

-- sort data in ascending or descending --
Select Run_from_bat From MatchDetail  -- ascending --
Order by Run_from_bat ASC;

Select Run_from_bat From MatchDetail  -- descending --
Order by Run_from_bat DESC;

-- Aggregate functions --
Select Count(Ball) From MatchDetail;

Select Max(Run_from_bat) From MatchDetail;

Select Min(Run_from_bat) From MatchDetail;

Select Sum(Run_from_bat) From MatchDetail
Where Innings = 1;

Select Avg(Run_from_bat) From MatchDetail
Where Innings = 1;

-- group rows --
Select BattingTeam, Avg(Run_from_bat) From MatchDetail
Group by BattingTeam;

-- places conditions on group --
Select Battingteam, Avg(Run_from_bat) AS AvgRun From MatchDetail
Group by  BattingTeam
Having Avg(Run_from_bat) > 1;

-- delete data inside table --
Truncate table MatchDetail;

Select * from MAtchDetail;

-- delete table -- 
Drop table MatchDetail;

-- delete database --
Drop database Stadium;




