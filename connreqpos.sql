create table connreqpos
(
	User_id int,
    FOREIGN KEY (User_id) REFERENCES userdetails(User_id),
    details nvarchar(50),
    status varchar(10),
    date datetime
);