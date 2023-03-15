SELECT termid, instructor_id, COUNT(course_id) as num_classes from msds.curriculum
GROUP BY termid, instructor_id
ORDER BY termid, instructor_id
