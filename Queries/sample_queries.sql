-- zde ulozte par SELECT dotazu vyuzivajicich JOIN, prip. UNION nad tabulkami v projektu


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