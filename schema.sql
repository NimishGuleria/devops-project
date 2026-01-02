-- ================================================
-- Student Management System Database Schema
-- MySQL Database Setup Script
-- ================================================

-- Create database
CREATE DATABASE IF NOT EXISTS student_ms;
USE student_ms;

-- ================================================
-- TABLE: students
-- Stores student information
-- ================================================
CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    roll_no VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    dob DATE,
    department VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_roll_no (roll_no),
    INDEX idx_department (department)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================
-- TABLE: courses
-- Stores course information
-- ================================================
CREATE TABLE IF NOT EXISTS courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3,
    department VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_course_code (course_code),
    INDEX idx_department (department)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================
-- TABLE: enrollments
-- Links students to courses
-- ================================================
CREATE TABLE IF NOT EXISTS enrollments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(10),
    enroll_date DATE,
    grade VARCHAR(2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (student_id, course_id, semester)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================
-- TABLE: users
-- Stores login credentials for system access
-- ================================================
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    INDEX idx_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ================================================
-- Insert Default Admin User
-- Default password: admin123
-- ⚠️ CHANGE THIS PASSWORD IN PRODUCTION!
-- ================================================
INSERT INTO users (username, password, role) 
VALUES ('admin', 'admin123', 'ADMIN')
ON DUPLICATE KEY UPDATE username=username;

-- ================================================
-- Insert Sample Data (Optional - for testing)
-- ================================================

-- Sample Students
INSERT INTO students (roll_no, name, email, phone, dob, department) VALUES
('CS2021001', 'Rahul Sharma', 'rahul.sharma@college.edu', '9876543210', '2003-05-15', 'Computer Science'),
('CS2021002', 'Priya Patel', 'priya.patel@college.edu', '9876543211', '2003-08-22', 'Computer Science'),
('EC2021001', 'Amit Kumar', 'amit.kumar@college.edu', '9876543212', '2003-03-10', 'Electronics'),
('ME2021001', 'Sneha Gupta', 'sneha.gupta@college.edu', '9876543213', '2003-12-05', 'Mechanical')
ON DUPLICATE KEY UPDATE roll_no=roll_no;

-- Sample Courses
INSERT INTO courses (course_code, course_name, credits, department) VALUES
('CS101', 'Introduction to Programming', 4, 'Computer Science'),
('CS201', 'Data Structures and Algorithms', 4, 'Computer Science'),
('CS301', 'Database Management Systems', 3, 'Computer Science'),
('EC101', 'Digital Electronics', 4, 'Electronics'),
('ME101', 'Engineering Mechanics', 3, 'Mechanical')
ON DUPLICATE KEY UPDATE course_code=course_code;

-- Sample Enrollments
INSERT INTO enrollments (student_id, course_id, semester, enroll_date, grade) VALUES
(1, 1, '2021-1', '2021-07-15', 'A'),
(1, 2, '2021-2', '2021-12-15', 'A+'),
(2, 1, '2021-1', '2021-07-15', 'B+'),
(2, 2, '2021-2', '2021-12-15', 'A'),
(3, 4, '2021-1', '2021-07-15', 'A'),
(4, 5, '2021-1', '2021-07-15', 'B')
ON DUPLICATE KEY UPDATE id=id;

-- ================================================
-- Verify Installation
-- ================================================
SELECT 'Database created successfully!' as Status;
SELECT COUNT(*) as 'Total Students' FROM students;
SELECT COUNT(*) as 'Total Courses' FROM courses;
SELECT COUNT(*) as 'Total Enrollments' FROM enrollments;
SELECT COUNT(*) as 'Total Users' FROM users;

-- ================================================
-- Useful Queries for Testing
-- ================================================

-- View all students with their departments
-- SELECT * FROM students ORDER BY department, roll_no;

-- View all courses
-- SELECT * FROM courses ORDER BY department, course_code;

-- View enrollments with student and course details
-- SELECT 
--     s.roll_no, s.name as student_name,
--     c.course_code, c.course_name,
--     e.semester, e.grade
-- FROM enrollments e
-- JOIN students s ON e.student_id = s.id
-- JOIN courses c ON e.course_id = c.id
-- ORDER BY s.roll_no, e.semester;

-- ================================================
-- END OF SCRIPT
-- ================================================
