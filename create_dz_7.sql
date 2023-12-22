


create table if not exists teachers
(
	teachers_id int generated always as identity primary key,
	firstname varchar not null,
	lastname varchar not null 
);

create table if not exists subjects
(
	subjects_id int generated always as identity primary key,
	subjects_name varchar(100) not null unique
);

create table if not exists lectures
(
	lectures_id int generated always as identity primary key,
	subjects_id int references subjects (subjects_id) not null,
	teachers_id int references teachers (teachers_id) not null
);



create table if not exists lecture_rooms
(
	lecture_rooms_id  int generated always as identity primary key,
	building int not null check (building>=1 and building <= 5),
	_name varchar(10) not null unique
);

create  table if not exists heads 
(
	heads_id int generated always as identity primary key,
	teachers_id int references teachers(teachers_id) not null
);

create table if not exists scheduls
(
	scheduls_id int generated always as identity primary key,
	_class int not null  check (_class>=1 and _class<=8),
	day_of_week int not null check (day_of_week>=1 and day_of_week<=7),
	lectures_id int references lectures (lectures_id) not null,
	lecture_rooms_id int references lecture_rooms (lecture_rooms_id) not null,
	_week int not null check (_week>=1 and _week <= 52)
);

create table if not exists deans
(
	deans_id int generated always as identity primary key,
	teachers_id int references teachers(teachers_id) not null
);


create table if not exists faculties
(
    faculties_id int generated always as identity primary key,
    building int not null check (building>=1 and building <= 5),
    faculties_name varchar(100) not null unique,
    deans_id int references deans(deans_id) not null
);

create table if not exists departments
(
    departments_id int generated always as identity primary key,
    building int not null check (building>=1 and building <= 5),
    departments_name varchar(100) not null unique,
    faculties_id int references faculties(faculties_id) not null,
    heads_id int references heads(heads_id) not null
);

create table if not exists curators
(
	curators_id int generated always as identity primary key,
 	teachers_id int references teachers (teachers_id) not null
);

create table if not exists assistants
(
	assistants_id int generated always as identity primary key,
 	teachers_id int references teachers (teachers_id) not null
);

create table if not exists _groups
(
   groups_id int generated always as identity primary key,
   group_name varchar(10) not null unique,
   _year int not null check (_year>=1 and _year<=5),
   departments_id int references departments(departments_id) not null
);

create table if not exists groups_curators
(
	curators_id int references curators(curators_id) not null,
	groups_id int references _groups(groups_id) not null, 
	constraint pk_groups_curators_id primary key(groups_id, curators_id)
);

create table if not exists groups_lectures
(
	groups_id int references _groups(groups_id) not null, 
	lectures_id int references lectures(lectures_id) not null,
	constraint groups_lectures_id primary key(groups_id, lectures_id)
);









