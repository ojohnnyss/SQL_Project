-- List the teachers who have NULL for their department.

SELECT teacher.name FROM teacher WHERE dept IS NULL

/*
Correct answer
name
Spiregrain
Deadyawn
*/

-- Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
           
/*
Correct answer
name	name
Shrivell	Computing
Throd	Computing
Splint	Computing
Cutflower	Design
*/

-- Use a different JOIN so that all teachers are listed.

SELECT teacher.name, dept.name FROM teacher
LEFT JOIN dept ON (teacher.dept=dept.id)

/*
Correct answer
name	name
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	
Cutflower	Design
Deadyawn
*/

-- Use a different JOIN so that all departments are listed.

SELECT teacher.name, dept.name FROM teacher
RIGHT JOIN dept ON (teacher.dept=dept.id)

/*
Correct answer
name	name
Shrivell	Computing
Throd	Computing
Splint	Computing
Cutflower	Design
Engineering
*/

-- Show teacher name and mobile number or '07986 444 2266'

SELECT teacher.name, COALESCE(teacher.mobile, '07986 444 2266') FROM teacher

/*
Correct answer
name	COALESCE(teac..
Shrivell	07986 555 1234
Throd	07122 555 1920
Splint	07986 444 2266
Spiregrain	07986 444 2266
Cutflower	07996 555 6574
Deadyawn	07986 444 2266
*/

-- Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

SELECT teacher.name, COALESCE(dept.name, 'None') FROM teacher
LEFT JOIN dept ON (teacher.dept=dept.id)

/*
Correct answer
name	COALESCE(dept..
Shrivell	Computing
Throd	Computing
Splint	Computing
Spiregrain	None
Cutflower	Design
Deadyawn	None
*/

-- Use COUNT to show the number of teachers and the number of mobile phones.

SELECT COUNT(teacher.name), COUNT(teacher.mobile) FROM teacher

/*
Correct answer
COUNT(teacher..	COUNT(teacher..
6	3
*/

-- Use COUNT and GROUP BY dept.name to show each department and the number of staff.

SELECT dept.name, COUNT(teacher.dept) FROM teacher
RIGHT JOIN dept ON(teacher.dept=dept.id) GROUP BY dept.name

/*
Correct answer
name	COUNT(teacher..
Computing	3
Design	1
Engineering	0
*/

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.

SELECT teacher.name,
CASE WHEN teacher.dept IN (1, 2) THEN 'Sci'ELSE 'Art' END
FROM teacher

/*
Correct answer
name	CASE WHEN tea..
Shrivell	Sci
Throd	Sci
Splint	Sci
Spiregrain	Art
Cutflower	Sci
Deadyawn	Art
*/

-- Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise.

SELECT teacher.name,
CASE WHEN teacher.dept IN (1, 2) THEN 'Sci'
WHEN teacher.dept = 3 THEN 'Art'
ELSE 'None' END FROM teacher

/*
Correct answer
name	CASE WHEN tea..
Shrivell	Sci
Throd	Sci
Splint	Sci
Spiregrain	None
Cutflower	Sci
Deadyawn	None
*/
