create table faq
(
	User_id int,
    FOREIGN KEY (User_id) REFERENCES userdetails(User_id),
    faq_ques nvarchar(30),
    sub nvarchar(20),
    date datetime
);
