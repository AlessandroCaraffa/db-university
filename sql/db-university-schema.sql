CREATE database  `test_university`;
use `test_university`;



CREATE TABLE `departments`(
	`id` INT NOT NULL auto_increment,
	`name` VARCHAR(100) NOT NULL,
	`adress` VARCHAR(255),
	`phone` INT,
	`email` VARCHAR(255),
	`website` VARCHAR(255),
	`head_of_department` VARCHAR(100),
	PRIMARY KEY (`id`)
);


CREATE TABLE `degrees`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`adress` VARCHAR(255),
	`website`VARCHAR(255),
	`email` VARCHAR(255),
	`level` VARCHAR(100),                                                                
	`departments_id`INT NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`departments_id`) REFERENCES departments(`id`)
) ;


CREATE TABLE `courses`(
	`id` INT not null auto_increment,
	`name`VARCHAR(100) NOT NULL,
	`description` TEXT,
	`website` VARCHAR(255),
	`cfu` INT,
	`degrees_id` INT not null,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`degrees_id`) REFERENCES degrees(`id`)
	
);


CREATE TABLE `teachers`(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`surname`VARCHAR(50) NOT NULL,
	`phone` INT,
	`email`VARCHAR(255),
	`office_address` VARCHAR(255),
	PRIMARY KEY(`id`)
);

CREATE TABLE `courses_teachers`(
	`courses_id` INT  NOT NULL,
	`teachers_id` INT  NOT NULL,
	PRIMARY KEY(`courses_id`,`teachers_id`),
	FOREIGN KEY(`courses_id`) REFERENCES courses(`id`),
	FOREIGN KEY(`teachers_id`) REFERENCES teachers(`id`)
);

CREATE TABLE `exams`(
	`id` INT not null auto_increment,
	`date` DATE NOT NULL,
	`hour` TIME,
	`location`  VARCHAR(255),
	`address` VARCHAR(255),
	`courses_id` INT not NULL,
	PRIMARY KEY(`id`),
	FOREIGN KEY(`courses_id`) REFERENCES courses(`id`)
);
create table `student`(
	`id` INT not null auto_increment,
	`name` VARCHAR (50)not null,
	`SURNAME` VARCHAR(50) not null,
	`date_of_birth` DATE,
	`fiscal_code` VARCHAR(255),
	`enrolment_date` DATE,
	`registration_number` INT not null,
	`email` VARCHAR(255),
	`degrees_id` INT not null,
	primary key (`id`),
	foreign KEY(`degrees_id`) references degrees(`id`)
);









CREATE TABLE `vote`(
	`student_id` INT not null,
	`exams_id` INT not null,
	`vote` INT NOT NULL,
	primary key(`student_id`,`exams_id`),
	foreign key (`student_id`) references student (`id`),
	foreign key (`exams_id`) references exams (`id`)
	
);

