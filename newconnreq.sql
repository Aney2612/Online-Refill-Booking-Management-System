create table newconnreq
(
	User_id int,
    FOREIGN KEY (User_id) REFERENCES userdetails(User_id),
    Conn_mess nvarchar(50),
    date datetime
);