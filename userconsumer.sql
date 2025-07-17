create table userconsumer
(
    user_id int,
    FOREIGN KEY (user_id) REFERENCES userdetails(user_id),
    Consumer_id int,
    FOREIGN KEY (Consumer_id) REFERENCES consumerdetails(Consumer_id)
);