-- creating database --
Create database Hotel;

-- using database --
Use Hotel;

-- creating tables --
Create table Details(
RoomNo int primary key,
RoomType varchar(10),
Price Numeric, 
BreakfastType Varchar(30),
BreakfastPrice int,
Occupied Bool);

Create table Guests(
RoomNo int,
GuestID int primary key,
Foreign key (RoomNo) references Details(RoomNo),
GuestName varchar(30),
TotalGuest int,
Gender Char,
City varchar(30),
CheckIn Date not null,
CheckOut Date not null, 
Breakfast Bool);

-- inserting values --
Insert into  Details (RoomNo, RoomType, Price, BreakfastType, BreakfastPrice, Occupied) 
Values 
(101, 'Single', 7000, NULL, NULL, true),(102, 'Single', 7000, NULL, NULL, true),(103, 'Triple', 20000, 'Continental', 1500, true),
(104, 'Double', 14000, NULL, NULL, false),(105, 'Double', 14000, NULL, NULL, false),(201, 'Single', 7000, NULL, NULL, true),
(202, 'Single', 7000, NULL, NULL, true),(203, 'Triple', 20000, NULL, NULL, false),(204, 'Double', 14000, NULL, NULL, false),
(205, 'Double', 14000, 'English', 800, true),(301, 'Single', 7000, 'Indian', 700, true),(302, 'Single', 7000, NULL, NULL, true),
(303, 'Triple', 20000, NULL, NULL, false),(304, 'Double', 14000, NULL, NULL, true),(305, 'Double', 14000, 'Continental', 1500, true),
(401, 'Single', 7000, NULL, NULL, true),(402, 'Double', 14000, NULL, NULL, false),(403, 'Triple', 20000, NULL, NULL, false),
(404, 'Double', 14000, NULL, NULL, false),(405, 'Double', 14000, NULL, NULL, true),(501, 'Single', 7000, NULL, NULL, true),
(502, 'Single', 7000, NULL, NULL, true),(503, 'Triple', 20000, NULL, NULL, false),(504, 'Double', 14000, NULL, NULL, false),(505, 'Double', 14000, NULL, NULL, true);

Insert into Guests (RoomNo, GuestID, GuestName, TotalGuest, Gender, City, CheckIn, CheckOut, Breakfast)
Values
(304, 119, 'Vivek Sharma', 2, 'M', 'Agra', '2022-01-11', '2022-01-12', False),
(302, 124, 'Rekha Rani', 1, 'F', 'Gaya', '2022-01-21', '2022-01-22', False),
(202, 134, 'Ritik Raj', 2, 'M', 'Bhopal', '2022-02-01', '2022-02-03', False),
(301, 136, 'Manish Kumar', 2, 'M', 'Noida', '2022-02-10', '2022-02-12', True),
(102, 141, 'Shalini Singh', 1, 'F', 'Patna', '2022-02-27', '2022-02-28', False),
(103, 145, 'Rahul Verma', 1, 'M', 'Varanasi', '2022-03-03', '2022-03-04', True),
(201, 150, 'Neha Rawat', 3, 'F', 'Lucknow', '2022-03-04', '2022-03-06', False),
(305, 158, 'Anjana Kumari', 2, 'F', 'Jodhpur', '2022-03-04', '2022-03-05', True),
(405, 159, 'Rakesh Rai', 2, 'M', 'Mumbai', '2022-03-06', '2022-03-07', False),
(401, 164, 'Mahesh Das', 2, 'M', 'Pune', '2022-03-10', '2022-03-12', False),
(101, 178, 'Sneha Ravat', 2, 'F', 'Rajkot', '2022-03-24', '2022-03-26', False),
(502, 234, 'Darshan Patel', 3, 'M', 'Surat', '2022-04-09', '2022-04-12', False),
(205, 236, 'Anurag Kashyap', 1, 'M', 'Jodhpur', '2022-04-09', '2022-04-10', True),
(501, 238, 'Vivek Kumar', 2, 'M', 'Mau', '2022-04-13', '2022-04-14', False),
(505, 240, 'Adil Khan', 2, 'M', 'Aligarh', '2022-04-20', '2022-04-22', False);

Show Tables;  -- will show all tables --

-- basic queries --

-- Retrieve all records from the Details table. --
Select * From Details;

-- Retrieve all rooms that are 'Single' from the Details table. --
Select * From Details 
Where RoomType = 'Single';

-- Retrieve all guests from 'Patna' from the Guests table. --
Select * From Guests
Where City = 'Patna';

-- joins --

-- Retrieve the room details along with the guest information for all rooms that are occupied. --
Select Guests.RoomNo, RoomType, GuestName, Price From Details 
inner join Guests
on Details.RoomNo = Guests.Roomno;

Select Details.RoomNo, RoomType, GuestName, Price From Details
left join Guests
on Details.RoomNo = Guests.RoomNo
where Occupied = True;

-- Retrieve all room details with corresponding guest information, including rooms that are not currently occupied. --
Select Details.RoomNo, RoomType, GuestName, Price From Details
left join Guests
on Details.RoomNo = Guests.RoomNo
where Occupied = False;

-- Find all the rooms from the Details table that have had at least one guest stay in them --
Select Guests.RoomNo, RoomType, Guests.TotalGuest, Price From Details
right join Guests
on Details.RoomNo = Guests.RoomNo
where TotalGuest = 1;

-- Find all the Guests details who have assigned Double RoomType and not have Breakfast --
Select GuestId, GuestName, Gender, City, Details.RoomType from Guests 
right join Details
on Guests.RoomNo = Details.RoomNo 
where Details.RoomType = 'Double' and Guests.Breakfast = False ;

-- Retrieve a list of all room and guest details. (full join or full outer join) --
SELECT Details.*, Guests.*
FROM Details
left JOIN Guests 
ON Details.RoomNo = Guests.RoomNo
union
SELECT Details.*, Guests.*
FROM Details
right JOIN Guests 
ON Details.RoomNo = Guests.RoomNo;

-- Retrieve a list of all occupied room and guest details. --
select Details.*, Guests.* from Details
join Guests
on Details.RoomNo = Guests.RoomNo;

-- operators --

-- Retrieve details of Guest more than 1 (Comparision operator) --
select * from Guests 
where TotalGuest != 1;

select * from Guests 
where TotalGuest > 1;

select * from Guests 
where TotalGuest >= 2;

-- Retrieve total expenses of guests having breakfast (Arithmetic operator) --
select GuestID, GuestName, Details.RoomType, (Details.Price + Details.BreakfastPrice) AS TotalExpense 
from Guests
join Details
on Details.RoomNo = Guests.RoomNo
where Guests.Breakfast = True;

-- Retrieve guests from either 'Agra' or 'Bhopal'. (Logical operator) --
SELECT * FROM Guests
WHERE City = 'Agra' OR City = 'Bhopal';

select * from Guests
where City in ('Agra', 'Bhopal');

-- Retrieve guests which are not from 'Agra' or 'Bhopal'. -- 
select * from Guests
where City not in ('Agra', 'Bhopal', 'Patna');

-- Retrieve RoomNo and its Price which is in between 14000 and 20000. --
Select RoomNo, Price from Details
where Price between 14000 and 20000;
