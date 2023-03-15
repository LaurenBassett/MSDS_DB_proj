SELECT c.course_id, c.termid, count(instructor_id) as num_classes, (
SELECT GROUP_CONCAT(instructor_id SEPARATOR ",")
from msds.curriculum
WHERE termid = c.termid AND course_id = c.course_id
GROUP BY termid, course_id) as courses
FROM msds.curriculum as c
GROUP BY c.termid, c.course_id
HAVING COUNT(c.course_id) > 1
ORDER BY c.termid, c.course_id