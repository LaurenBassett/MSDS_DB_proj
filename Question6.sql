SELECT msds.courses.courseID, msds.courses.name, msds.learning_objectives.content
FROM msds.courses LEFT JOIN msds.learning_objectives ON msds.courses.courseID = msds.learning_objectives.course_id
WHERE msds.learning_objectives.content LIKE '%SQL%'
