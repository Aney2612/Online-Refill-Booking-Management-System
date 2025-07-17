create table consumerdetails
(
	Consumer_id int primary key,
    Consumer_pwd nvarchar(12),
    Consumer_name varchar(25),
    Phone int,
    Email nvarchar(50),
    Address nvarchar(30),
    District varchar(20),
    State varchar(20),
    Country varchar(20),
    Pin_code nvarchar(6),
    Code int,
    Conn_date datetime
);
