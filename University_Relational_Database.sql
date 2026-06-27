-- SQL Table Creation
CREATE DATABASE university_database;

USE university_database
-- SQL Table Creation
CREATE TABLE
    `Students` (
        `student_id` integer AUTO_INCREMENT PRIMARY KEY,
        `first_name` varchar(50) NOT NULL,
        `last_name` varchar(100) NOT NULL,
        `email` varchar(100) UNIQUE NOT NULL,
        `birthdate` date NOT NULL,
    );

CREATE TABLE
    `Courses` (
        `course_id` integer AUTO_INCREMENT PRIMARY KEY,
        `instructor_id` integer,
        `title` varchar(100) NOT NULL,
        `credit` integer NOT NULL,
        CHECK (credit>0)

    );


CREATE TABLE
    `Instructors` (
        `instructor_id` integer AUTO_INCREMENT PRIMARY KEY,
        `first_name` varchar(50) NOT NULL,
        `last_name` varchar(100) NOT NULL,
        `email` varchar(100) UNIQUE NOT NULL,
        `department` varchar(255) NOT NULL
    );

CREATE TABLE
    `Enrollments` (
        `student_id` integer NOT NULL,
        `course_id` integer NOT NULL,
        `grade` varchar(100),
        PRIMARY KEY (`student_id`, `course_id`),

        FOREIGN KEY (student_id)
        REFERENCES Students(student_id)
        ON DELETE CASCADE,

        FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
        ON DELETE CASCADE
    );


ALTER TABLE `Courses` ADD FOREIGN KEY (`instructor_id`) REFERENCES `Instructors` (`instructor_id`);

--  Insert Sample Data
INSERT INTO `Students` (`first_name`, `last_name`, `email`, `birthdate`) VALUES
('Sylvestre', 'IBOMBO GAKOSSO', 'isylvestre757@gmail.com', '2002-07-30'),
('Amina', 'Khelifi', 'amina.khelifi@example.com', '2001-03-12'),
('Lucas', 'Martin', 'lucas.martin@example.com', '2000-11-04'),
('Sara', 'Ben Ali', 'sara.benali@example.com', '2003-05-22'),
('Youssef', 'El Haddad', 'youssef.elhaddad@example.com', '2001-09-18'),
('Nina', 'Johnson', 'nina.johnson@example.com', '2002-01-27'),
('Omar', 'Farouk', 'omar.farouk@example.com', '1999-08-09'),
('Emma', 'Wilson', 'emma.wilson@example.com', '2000-12-15'),
('Hassan', 'Bennani', 'hassan.bennani@example.com', '2001-06-30'),
('Leila', 'Said', 'leila.said@example.com', '2002-10-07');

INSERT INTO `Instructors` (`first_name`, `last_name`, `email`, `department`) VALUES
('Mohamed', 'Berkaoui', 'mohamed.berkaoui@example.com', 'Computer Science'),
('Rania', 'Zahra', 'rania.zahra@example.com', 'Information Systems'),
('Karim', 'Azzouzi', 'karim.azzouzi@example.com', 'Software Engineering'),
('Nadia', 'El Amrani', 'nadia.elamrani@example.com', 'Databases');

INSERT INTO `Courses` (`instructor_id`, `title`, `credit`) VALUES
(1, 'Introduction to Databases', 3),
(2, 'Web Programming', 4),
(3, 'Data Structures', 3),
(4, 'Database Systems', 4);

INSERT INTO `Enrollments` (`student_id`, `course_id`, `grade`) VALUES
(1, 1, 'A'),
(1, 4, 'B+'),
(2, 2, 'A-'),
(3, 1, 'B'),
(4, 3, 'A'),
(5, 4, 'B'),
(6, 2, 'A'),
(7, 3, 'C+'),
(8, 1, 'B+'),
(9, 4, 'A-');


-- Retrieve all students enrolled in the course “Database Systems”.
SELECT s.*
FROM `Students` s
INNER JOIN `Enrollments` e ON e.student_id = s.student_id
INNER JOIN `Courses` c ON c.course_id = e.course_id
WHERE c.title = 'Database Systems';

-- -List all courses along with the names of their instructors.
SELECT c.course_id, c.title, c.credit, i.first_name, i.last_name
FROM `Courses` c
INNER JOIN `Instructors` i ON c.instructor_id = i.instructor_id;

-- -Find students who are not enrolled in any course.
SELECT * 
FROM `Students`
WHERE student_id NOT IN (SELECT `student_id` FROM `Enrollments`);

-- -Update the email address of a student.
UPDATE `Students`
SET email = 'johndoe@gmail.com'
WHERE student_id = 1;

-- -Delete a course by its ID.
DELETE FROM `Courses` WHERE course_id = 1;
