-- table for course
CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE,
    description TEXT
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


-- table for student
CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(250)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


-- tables fot stúdent_course_signup
CREATE TABLE student_course_signup (
    signup_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    signup_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


-- table for trainers
CREATE TABLE trainers (
    trainer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    expertise VARCHAR(250)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;


-- foreign KEYS

ALTER TABLE student_course_signup
ADD CONSTRAINT fk_student_id
FOREIGN KEY (student_id)
REFERENCES student(student_id);

ALTER TABLE student_course_signup
ADD CONSTRAINT fk_course_id
FOREIGN KEY (course_id)
REFERENCES course(course_id);

ALTER TABLE course
ADD COLUMN trainer_id INT,
ADD CONSTRAINT fk_trainer_id
FOREIGN KEY (trainer_id)
REFERENCES trainers(trainer_id);



-- INSERT INTO course

insert into course (course_name, start_date, end_date, description, trainer_id) values
('SQL databases', '2024-04-20', '2024-07-20', 'basics and intermediate knowledge about SQL, MySQL, PostreSQL', 1),
('python', '2024-07-01', '2024-11-30', 'all knowledge about programming with python language', 2),
('java', '2025-01-10', '2024-05-30', 'all knowledge about programming with java language', 3),
('NoSQL', '2024-05-01', '2024-07-20', 'basics and intermediate knowledge about NoSQL Casandra, MongoDB', 1),
('C#', '2024-09-15', '2024-12-15', 'All knowledge about programming with C# language', 4),
('JavaScript', '2024-08-01', '2024-12-31', 'All knowledge about programming with JavaScript language', 5),
('Web Development Fundamentals', '2024-08-01', '2024-11-30', 'Comprehensive course covering HTTP basics, HTML fundamentals, and CSS styling for web development', 5),
('Data Structures and Algorithms', '2024-08-15', '2024-11-30', 'In-depth study of fundamental data structures and algorithms', 2),
('Cybersecurity Essentials', '2024-09-01', '2024-11-30', 'Introduction to cybersecurity principles, threats, and countermeasures', 4),
('Mobile App Development with Flutter', '2024-10-01', '2025-01-31', 'Hands-on course on building cross-platform mobile applications using Flutter framework', 1);


-- INSERT INTO course

INSERT INTO trainers (first_name, last_name, email, phone, expertise) VALUES
('John', 'Doe', 'john.doe@example.com', '123456789', 'SQL, MySQL, PostgreSQL'),
('Jane', 'Smith', 'jane.smith@example.com', '987654321', 'Python'),
('Michael', 'Johnson', 'michael.johnson@example.com', '555555555', 'Java'),
('Alice', 'Williams', 'alice.williams@example.com', '111111111', 'NoSQL'),
('Robert', 'Brown', 'robert.brown@example.com', '999999999', 'C#'),
('Emily', 'Davis', 'emily.davis@example.com', '777777777', 'JavaScript'),
('David', 'Martinez', 'david.martinez@example.com', '333333333', 'Web development'),
('Jessica', 'Anderson', 'jessica.anderson@example.com', '444444444', 'Algorithms'),
('Kevin', 'Garcia', 'kevin.garcia@example.com', '666666666', 'Cybersecurity'),
('Sarah', 'Wilson', 'sarah.wilson@example.com', '222222222', 'Mobile app development');



-- TEST SELECT
SELECT 
    c.course_id,
    c.course_name,
    c.start_date,
    c.end_date,
    c.description,
    t.first_name AS trainer_first_name,
    t.last_name AS trainer_last_name,
    t.email AS trainer_email,
    t.phone AS trainer_phone,
    t.expertise AS trainer_expertise
FROM 
    course c
JOIN 
    trainers t ON c.trainer_id = t.trainer_id;


-- INSERT INTO student

INSERT INTO student (first_name, last_name, email, phone, address) VALUES
('Jana', 'Nováková', 'jana.novakova@example.com', '123456789', 'Hlavná ulica 1, Bratislava, Slovensko'),
('Martin', 'Kováč', 'martin.kovac@example.com', '987654321', 'Druhá ulica 2, Košice, Slovensko'),
('Veronika', 'Horváthová', 'veronika.horvathova@example.com', '555555555', 'Horlivá ulica 3, Žilina, Slovensko'),
('Peter', 'Tóth', 'peter.toth@example.com', '111111111', 'Petrova ulica 4, Banská Bystrica, Slovensko'),
('Zuzana', 'Molnárová', 'zuzana.molnarova@example.com', '999999999', 'Piatok ulica 5, Prešov, Slovensko'),
('Ivan', 'Kriesil', 'ivan.kriesil@example.com', '444444444', 'Nekonečná ulica 8, Považská Bystrica, Slovensko'),
('Olívia', 'Tesárová', 'olivia.tesarova@example.com', '2222222222', 'Úzka ulica 10, Trnava, Slovensko'),
('Adam', 'Veselý', 'adam.vesely@example.com', '333333333', 'Divoká ulica 12, Nitra, Slovensko'),
('Barbora', 'Hrušková', 'barbora.hruskova@example.com', '777777777', 'Ovocná ulica 15, Poprad, Slovensko'),
('Ľubomír', 'Králik', 'lubomir.kralik@example.com', '666666666', 'Lesná ulica 18, Zvolen, Slovensko');



-- student_course_signup

-- Jana Nováková na kurz SQL
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'SQL databases'
WHERE s.first_name = 'Jana' AND s.last_name = 'Nováková';

-- Peter Tóth na kurz NoSQL
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'NoSQL'
WHERE s.first_name = 'Peter' AND s.last_name = 'Tóth';

-- Zuzana Molnárová na kurz C#
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'C#'
WHERE s.first_name = 'Zuzana' AND s.last_name = 'Molnárová';

-- Ivan Kriesil na kurz JavaScript
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'JavaScript'
WHERE s.first_name = 'Ivan' AND s.last_name = 'Kriesil';

-- Olívia Tesárová na kurz Web Development Fundamentals
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'Web Development Fundamentals'
WHERE s.first_name = 'Olívia' AND s.last_name = 'Tesárová';

-- Adam Veselý na kurz Data Structures and Algorithms
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'Data Structures and Algorithms'
WHERE s.first_name = 'Adam' AND s.last_name = 'Veselý';

-- Barbora Hrušková na kurz Cybersecurity Essentials
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'Cybersecurity Essentials'
WHERE s.first_name = 'Barbora' AND s.last_name = 'Hrušková';

-- Ľubomír Králik na kurz Mobile App Development with Flutter
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'Mobile App Development with Flutter'
WHERE s.first_name = 'Ľubomír' AND s.last_name = 'Králik';

-- Martin Kováč na kurz Python
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'python'
WHERE s.first_name = 'Martin' AND s.last_name = 'Kováč';

-- Veronika Horváthová na kurz Java
INSERT INTO student_course_signup (student_id, course_id)
SELECT s.student_id, c.course_id
FROM student s
JOIN course c ON c.course_name = 'java'
WHERE s.first_name = 'Veronika' AND s.last_name = 'Horváthová';



-- Test Select 2 (merge tables)
SELECT 
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    s.email AS student_email,
    s.phone AS student_phone,
    s.address AS student_address,
    c.course_name,
    c.start_date,
    c.end_date,
    c.description,
    t.first_name AS trainer_first_name,
    t.last_name AS trainer_last_name,
    t.email AS trainer_email,
    t.phone AS trainer_phone,
    t.expertise
FROM 
    student_course_signup scs
JOIN 
    student s ON scs.student_id = s.student_id
JOIN 
    course c ON scs.course_id = c.course_id
JOIN 
    trainers t ON c.trainer_id = t.trainer_id;


   
-- VIEWS
   
--  trainers with highest students
   
CREATE VIEW top_trainers AS
SELECT 
    t.trainer_id,
    t.first_name,
    t.last_name,
    t.email,
    t.phone,
    t.expertise,
    COUNT(scs.student_id) AS student_count
FROM 
    trainers t
JOIN 
    course c ON t.trainer_id = c.trainer_id
JOIN 
    student_course_signup scs ON c.course_id = scs.course_id
GROUP BY 
    t.trainer_id
ORDER BY 
    student_count DESC
LIMIT 3; 



-- teaching alteast 2 courses

CREATE VIEW trainers_with_multiple_courses AS
SELECT 
    t.trainer_id,
    t.first_name,
    t.last_name,
    t.email,
    t.phone,
    t.expertise,
    COUNT(c.course_id) AS course_count
FROM 
    trainers t
JOIN 
    course c ON t.trainer_id = c.trainer_id
GROUP BY 
    t.trainer_id
HAVING 
    COUNT(c.course_id) >= 2;

   
   
-- courses with most signed up students
CREATE VIEW top_courses AS
SELECT 
    c.course_id,
    c.course_name,
    c.start_date,
    c.end_date,
    c.description,
    COUNT(scs.student_id) AS student_count
FROM 
    course c
JOIN 
    student_course_signup scs ON c.course_id = scs.course_id
GROUP BY 
    c.course_id
ORDER BY 
    student_count DESC
LIMIT 5;



-- report all data (sumary VIEW)

CREATE VIEW project_report AS
SELECT 
    c.course_id AS course_id,
    c.course_name AS course_name,
    c.start_date AS course_start_date,
    c.end_date AS course_end_date,
    c.description AS course_description,
    t.trainer_id AS trainer_id,
    t.first_name AS trainer_first_name,
    t.last_name AS trainer_last_name,
    t.email AS trainer_email,
    t.phone AS trainer_phone,
    t.expertise AS trainer_expertise,
    s.student_id AS student_id,
    s.first_name AS student_first_name,
    s.last_name AS student_last_name,
    s.email AS student_email,
    s.phone AS student_phone,
    s.address AS student_address,
    scs.signup_id AS signup_id,
    scs.signup_date AS signup_date
FROM 
    course c
JOIN 
    trainers t ON c.trainer_id = t.trainer_id
JOIN 
    student_course_signup scs ON c.course_id = scs.course_id
JOIN 
    student s ON scs.student_id = s.student_id;
   
   
   
-- report ALIAS data
   
CREATE VIEW course_view AS
SELECT 
    course_id,
    course_name,
    start_date,
    end_date,
    description
FROM 
    course;