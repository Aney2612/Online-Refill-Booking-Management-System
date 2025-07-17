create table addchangeresp
(
	Consumer_id int,
    FOREIGN KEY (Consumer_id) REFERENCES consumerdetails(Consumer_id),
    Status nvarchar(50),
    curr_date datetime
);
