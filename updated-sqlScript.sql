-- table creation
-- 1)Mentor
create table mentor(
	mentorId integer(1000) not null,
	mentorName varchar(1000) not null,
	mentees_count integer(1000),
	primary key(mentorId)
)

-- 2)Mentor contact details
create table mentor_contact(
    mentorId integer(1000) not null,
    phoneNo varchar(10),
    email varchar(100),
    foreign key (mentorId) references mentor(mentorId)
)

-- 3)Topics 
create table topic(
    topicId integer(1000) not null,
    topic varchar(1000) not null,
    staff integer(1000),
    difficulty varchar(100) check (difficulty == 'easy' || difficulty == 'normal' || difficulty=='hard'),
    primary key(topicId),
    foreign key (staff) REFERENCES mentor(mentorId)
)

-- 4)Tasks for students
create table task(
	taskId integer(10000) not null,
	taskName varchar(1000) not null,
    topic integer(1000),
	createdBy integer(1000),
	primary key(taskId),
	foreign key (createdBy) REFERENCES mentor(mentorId),
    foreign key (topic) REFERENCES topic(topicId)
)

-- 5)Batch details
create table batch(
	id integer(1000) not null,
	batchName varchar(1000) not null,
	advisor integer(1000),
	primary key(id),
    foreign key (advisor) REFERENCES mentor(mentorId)
)

-- 6)Company drive for students
create table companyDrive(
    batchId integer(1000) not null,
    company varchar(1000) not null,
    driveAt varchar(1000),
    driveDate date,
    foreign key (batchId) REFERENCES batch(id)
)

-- 7)Students details
CREATE table student(
	id integer(10000) not null,
	student varchar(100) not null,
	mentorId INTEGER (1000),
	batchId Integer(1000),
	joinedAt date,
	primary key(id)
    foreign key (mentorId) REFERENCES mentor(mentorId)
    foreign key (batchId) references batch(id)	
)

-- 8)Student's codekata profile data
create table codekata(
    studentId integer(1000) not null,
    problemSolved integer(10000),
    points integer(1000000),
    lastUpdated date,
    foreign key (studentId) REFERENCES student(id)
)

-- Data Insertions
-- 1)Mentor
insert into mentor values(1,"Raj",10),(2,"Kumar",20),(3,"Anil",15),(4,"Garg",0),(5,"Kumar",30);

-- 2)Mentor contact details
insert into mentor_contact values(1,"92322456789","raj@gmail.com"),(1,"","raj1@gmail.com"),(3,"9876543210","anil@guvi.in"),(4,"garg@guvi.in");

-- 3)Topics
insert into topic values(1,"HTML",1,"easy"),(2,"CSS",5,"normal"), (3,"JS",4,"normal"),(4,"Advanced JS",4,"hard"), (5,"React JS", 3 , "normal"); 

-- 4)Tasks for students
insert into task values(1,"Create a basic html page",1 , 1,),(2,"Create a html page with css",2,5),(3,"Add js to html page",3,5);

-- 5)Batch details
insert into batch values(1,"B27WE",1),(2,"B27WD",2),(3,"B28WD",5),(4,"B29WD",4),(5,"B25WE",3);

-- 6)Company drive for students
insert into companyDrive values(1,"Amazon","Chennai",'2022-09-11'),(2,"Microsoft","Pune","2022-06-11"),(2,"Amazon","Chennai","2022-09-12"),(5,"JustPay","Chennai","2022-10-25");

-- 7)Students details
insert into students values(1,"Gautham",1,3,"2022-01-18"),(2,"Mandy",1,2,"2022-04-10"),(3,"Roshan",4,5,"2022-04-25"),(4,"Aseem",1,4,"2022-05-11"),(5,"Geeta",2,2,"2022-01-25");

-- 8)Student's codekata profile data
insert into codekata values(1,14,140,"2022-03-22"),(2,30,150,"2022-04-12"),(3,50,600,"2022-04-24"),(4,25,250,"2022-02-10")
