SELECT course_id, termid, count(instructor_id) as num_classes from msds.curriculum
GROUP BY termid, course_id
HAVING num_classes > 1
ORDER BY termid, course_id

