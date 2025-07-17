create table addchangereq
(
	Consumer_id int,
    FOREIGN KEY (Consumer_id) REFERENCES consumerdetails(Consumer_id),
    Add_req nvarchar(30),
    valid_from datetime,
    curr_date datetime
);