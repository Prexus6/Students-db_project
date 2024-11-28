-- tento view vraci TOP 3 trenery s nejvetsim dosahem studentu,
-- jinymi slovy trenery, kteri vyucuji kurzy s nejvetsim poctem zapsanych studentu

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