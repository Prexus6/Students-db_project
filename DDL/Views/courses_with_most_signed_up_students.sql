-- tento view vraci TOP 5 kurzu s nejvice zapsanymi studenty

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