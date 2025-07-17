create table refillbooking
(
	Consumer_id int,
    FOREIGN KEY (Consumer_id) REFERENCES consumerdetails(Consumer_id),
    refill_mess nvarchar(50),
    old_date datetime,
    latest_date datetime
);