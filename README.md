# University Database Management System

## Overview

This project is a relational database designed to simulate a simple university information system. It demonstrates the application of relational database design principles, SQL Data Definition Language (DDL), Data Manipulation Language (DML), and SQL queries.

The system manages four main entities:

* Students
* Instructors
* Courses
* Enrollments

The database has been designed following normalization principles up to the Third Normal Form (3NF) to minimize redundancy and maintain data integrity.

---

# Database Schema

The database contains four tables:

## Students

Stores information about university students.

Main attributes:

* student_id (Primary Key)
* first_name
* last_name
* email
* birthdate depending on implementation

Constraints:

* Primary Key
* NOT NULL
* UNIQUE (email)
* CHECK (where supported)

---

## Instructors

Stores information about professors and lecturers.

Main attributes:

* instructor_id (Primary Key)
* first_name
* last_name
* email
* department

Constraints:

* Primary Key
* NOT NULL
* UNIQUE (email)

---

## Courses

Stores available university courses.

Main attributes:

* course_id (Primary Key)
* instructor_id (Foreign Key)
* title
* credits

Each course is assigned to one instructor.

Constraints:

* Primary Key
* Foreign Key
* NOT NULL

---

## Enrollments

Represents the many-to-many relationship between students and courses.

Main attributes:

* student_id
* course_id
* grade

Primary Key:

(student_id, course_id)

Foreign Keys:

* student_id → Students
* course_id → Courses

Using a composite primary key prevents a student from being enrolled multiple times in the same course.

---

# Entity Relationships

* One instructor can teach multiple courses.
* One course is taught by one instructor.
* One student can enroll in multiple courses.
* One course can contain multiple students.

This results in a many-to-many relationship between Students and Courses, resolved using the Enrollments table.

---

# Database Normalization

The schema follows the first three normal forms.

## First Normal Form (1NF)

Each table contains atomic values.

* No repeating groups.
* Each column stores a single value.
* Every record is uniquely identified by its primary key.

Example:

A student's courses are not stored inside the Students table. Instead, they are stored in the Enrollments table.

---

## Second Normal Form (2NF)

All non-key attributes depend on the whole primary key.

The Enrollments table uses a composite primary key:

(student_id, course_id)

The attribute grade depends on both student_id and course_id rather than on either column individually.

No partial dependencies exist.

---

## Third Normal Form (3NF)

The database contains no transitive dependencies.

Examples:

* Student information is stored only in Students.
* Instructor information is stored only in Instructors.
* Course information is stored only in Courses.
* Enrollment information is stored only in Enrollments.

No table stores duplicated information about another entity.

This design reduces redundancy and improves consistency.

---

# Constraints Used

The database uses several SQL constraints to ensure data integrity.

* PRIMARY KEY
* FOREIGN KEY
* NOT NULL
* UNIQUE
* CHECK (where supported by the SQL engine)

Foreign keys guarantee referential integrity between related tables.

The Enrollments table also uses ON DELETE CASCADE so that enrollment records are automatically removed when a related student or course is deleted.

---

# Sample Data

The project includes sample data for:

* Students
* Instructors
* Courses
* Enrollments

This allows the SQL queries to be tested immediately after creating the database.

---

# SQL Operations Implemented

The project demonstrates common SQL operations.

## Data Definition Language (DDL)

* CREATE DATABASE
* CREATE TABLE
* ALTER TABLE

## Data Manipulation Language (DML)

* INSERT
* UPDATE
* DELETE

## Queries

The following SQL queries were implemented:

1. Retrieve all students enrolled in the course "Database Systems".

2. List all courses together with the names of their instructors.

3. Find students who are not enrolled in any course.

4. Update the email address of a student.

5. Delete a course by its ID.

---

# Design Decisions

Several design choices were made to keep the database both realistic and simple.

* Students and instructors are stored separately because they represent different entities.
* A course references its instructor using a foreign key.
* The many-to-many relationship between students and courses is resolved through the Enrollments table.
* A composite primary key in Enrollments prevents duplicate enrollments.
* Email addresses are unique to avoid duplicate accounts.
* Referential integrity is enforced through foreign keys.

This design provides a normalized, scalable, and maintainable relational database while remaining simple enough for an academic checkpoint.

---

# Conclusion

This project demonstrates the ability to:

* Design a normalized relational database.
* Apply normalization up to Third Normal Form (3NF).
* Define primary keys, foreign keys, and integrity constraints.
* Populate the database with sample data.
* Write SQL queries for retrieving, updating, and deleting information.

The resulting schema is consistent, avoids redundancy, and follows relational database best practices.
