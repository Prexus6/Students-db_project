-- tento view vraci trenery kteri vyucuji alespon 2 kurzy

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