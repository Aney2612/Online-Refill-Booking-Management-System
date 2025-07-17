use refillmanagement;
create table userdetails
(
	User_id int primary key,
    Name varchar(20),
    Phone int,
    Address nvarchar(30),
    District varchar(20),
    State varchar(20),
    Country varchar(20),
    Pin_code nvarchar(6),
    Email nvarchar(50),
    Password nvarchar(20),  
    Birth_date datetime,
    Join_date datetime
);
  