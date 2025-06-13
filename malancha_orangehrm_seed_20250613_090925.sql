
-- OrangeHRM minimal schema for user authentication and employee directory
CREATE TABLE IF NOT EXISTS hs_hr_employee (
    emp_number INT AUTO_INCREMENT PRIMARY KEY,
    emp_firstname VARCHAR(100),
    emp_lastname VARCHAR(100),
    emp_middle_name VARCHAR(100),
    emp_birthday DATE,
    emp_gender CHAR(1),
    job_title VARCHAR(100),
    emp_work_email VARCHAR(100),
    joined_date DATE
);

CREATE TABLE IF NOT EXISTS ohrm_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(40) NOT NULL,
    user_password VARCHAR(255) NOT NULL,
    emp_number INT,
    status TINYINT DEFAULT 1,
    FOREIGN KEY (emp_number) REFERENCES hs_hr_employee(emp_number)
);

-- Admin employee record
INSERT INTO hs_hr_employee (emp_firstname, emp_lastname, emp_birthday, emp_gender, job_title, emp_work_email, joined_date)
VALUES ('Aniruddha', 'Sikdar', '1985-01-15', 'M', 'Group Head – Operations', 'aniruddha@malancha.co.in', '2022-01-01');

-- Get last insert ID (admin's emp_number)
SET @admin_emp_id = LAST_INSERT_ID();

-- Insert admin user with a simple password hash (change this securely after login)
INSERT INTO ohrm_user (user_name, user_password, emp_number, status)
VALUES ('admin', MD5('admin123'), @admin_emp_id, 1);

-- Sample employees
INSERT INTO hs_hr_employee (emp_firstname, emp_lastname, emp_birthday, emp_gender, job_title, emp_work_email, joined_date)
VALUES 
('Priya', 'Das', '1994-06-12', 'F', 'Landscape Architect', 'priya.das@malancha.co.in', '2023-02-01'),
('Rohit', 'Roy', '1990-03-25', 'M', 'Project Manager', 'rohit.roy@malancha.co.in', '2022-11-15'),
('Sneha', 'Ghosh', '1996-08-19', 'F', 'HR Executive', 'sneha.ghosh@malancha.co.in', '2023-06-01');
