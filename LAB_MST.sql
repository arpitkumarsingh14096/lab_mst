-- Create a College Course Management System using Course and Faculty tables.
-- Create Course and Faculty tables with suitable attributes.
-- Apply appropriate Primary Key and Foreign Key constraints.
-- Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- Insert at least 5 faculty records and 5 course records.
-- Display courses having credits between 2 and 4.
-- Display courses whose names start with a particular letter using LIKE.
-- Display courses belonging to a selected set of departments using IN.
-- Display unique department names using DISTINCT.
-- Update the faculty assigned to a particular course.
-- Delete a course based on a suitable condition.
-- Add a new column to the Course table using ALTER.
-- Display the final Course records
CREATE DATABASE mst;
USE mst;
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50) DEFAULT 'General',
    designation VARCHAR(50) NOT NULL,
    experience_years INT CHECK (experience_years >= 0)
);

-- 2. Create the Course table (Child Table)
CREATE TABLE Course (
    course_id VARCHAR(10) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0 AND credits <= 6),
    department VARCHAR(50) NOT NULL,
    faculty_id INT,
    status VARCHAR(20) DEFAULT 'Active',
    CONSTRAINT fk_faculty FOREIGN KEY (faculty_id) 
        REFERENCES Faculty(faculty_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
INSERT INTO Faculty (faculty_id, name, email, department, designation, experience_years) VALUES
(101, 'Dr. Rajesh Sharma', 'rajesh.sharma@univ.edu', 'Computer Science', 'Professor', 14),
(102, 'Dr. Priya Nair', 'priya.nair@univ.edu', 'Computer Science', 'Associate Professor', 9),
(103, 'Dr. Amitav Banerjee', 'amitav.banerjee@univ.edu', 'Physics', 'Professor', 16),
(104, 'Dr. Sunita Deshmukh', 'sunita.deshmukh@univ.edu', 'Mathematics', 'Professor', 12),
(105, 'Dr. Vikramaditya Rao', 'vikram.rao@univ.edu', 'Chemistry', 'Assistant Professor', 6);

INSERT INTO Course (course_id, course_name, credits, department, faculty_id) VALUES
('CS101', 'Data Structures & Algorithms', 4, 'Computer Science', 101),
('CS202', 'Database Management Systems', 3, 'Computer Science', 102),
('PH101', 'Quantum Mechanics', 4, 'Physics', 103),
('MA201', 'Discrete Mathematics', 3, 'Mathematics', 104),
('CH101', 'General Chemistry', 2, 'Chemistry', 105),
('CS303', 'Cloud Computing', 1, 'Computer Science', 101);

SELECT * 
FROM Course 
WHERE credits BETWEEN 2 AND 4;

SELECT * 
FROM Course 
WHERE course_name LIKE 'D%';

SELECT * 
FROM Course 
WHERE department IN ('Computer Science', 'Mathematics');

SELECT DISTINCT department 
FROM Faculty;

UPDATE Course
SET faculty_id = 102
WHERE course_id = 'CS101';

DELETE FROM Course 
WHERE course_id = 'CS303';

ALTER TABLE Course 
ADD semester VARCHAR(10) DEFAULT 'Fall';

SELECT * 
FROM Course;