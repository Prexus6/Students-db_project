-- zde budou insert statements pro vsechny tabulky v projektu

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
