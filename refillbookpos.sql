create table refillbookpos
(
	Consumer_id int,
    FOREIGN KEY (Consumer_id) REFERENCES consumerdetails(Consumer_id),
    dil_status varchar(10),
    details nvarchar(30),
    dil_date datetime
);