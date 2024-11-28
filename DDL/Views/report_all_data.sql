-- tento reportovaci view vraci vsechny vhodne aliasovane sloupce ze vsech tabulek v projektu spojenych pomoci odpovidajicich JOINu

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