SELECT msds.courses.courseID, msds.courses.name
FROM msds.courses LEFT JOIN msds.learning_objectives ON msds.courses.courseID = msds.learning_objectives.course_id	
GROUP BY msds.courses.courseID, msds.courses.name
HAVING COUNT(msds.learning_objectives.content) = 0