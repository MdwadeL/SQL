-- List the student id, last name, and the difference between tuition and financial aid
COLUMN Amount Format $9,999.99
SELECT StudID, LName,
    'difference = ' || (Tuition - FinancialAid) as "Amount"
FROM Student;

/*PROMPTS FROM CLASS AND NOTES*/
-- List the name of the students along with the courses that the respective student is taking. Also include the name and section of the course.
SELECT 
    s.FName || ' ' || s.LName AS FullName,
    CourseName || ' {' || Sect || '}' AS Course_Sect
FROM Student s 
    JOIN Has h ON s.Studid = h.studid
    JOIN Course c ON c.SeqCde = h.SeqCde
ORDER BY s.FName || ' ' || s.LName, h.StudId, c.CourseName;

-- What is the name of all the students that are taking Section 001 of  English 101 (i.e., SeqCde = �523764�)?
SELECT  s.FName || ' ' || s.LName AS FullName,
        h.SeqCde
FROM Student s
    JOIN HAS h ON s.StudId = h.StudId 
    JOIN Course c ON c.SeqCde = h.SeqCde
WHERE h.SeqCde = '523764';

-- Did Patricia Jones (i.e., StudId = �254099823�) take SIMS W421 (i.e., SeqCde = '523764')?
SELECT s.StudId, c.SeqCde
FROM Student s
    JOIN Has h ON s.StudID = h.StudId 
    JOIN Course c ON (h.Seqcde = c.SeqCde)
WHERE s.StudId = '254099823' AND c.SeqCde = '523764';

/*INDEPENDENT PRACTICE PROMPTS*/
-- List the first and last names of all students.
SELECT FName, LName
FROM Student;

-- List all students and their majors.
SELECT
    LName || ', ' || FName || ' (' || StudId || ')' AS StudentName_ID,
    Major
FROM Student;

-- List all courses and their course names.
SELECT SeqCde, CourseName
FROM Course;

-- List all courses taught by each professor.
SELECT ProfName, CourseName
FROM Course
ORDER BY ProfName;

-- List the students who are majoring in IMS.
SELECT
    FName || ' ' || LName || ' (' || StudId || ')' AS Students,
    Major
FROM Student
WHERE Major = 'IMS';

-- List the students who have more than $3,000 in FinancialAid.
SELECT 
   FName || ' ' || LName || ' (' || StudId || ')' AS Students,
   FinancialAid
FROM Student
WHERE FinancialAid > 3000;

-- List each student's first name and the courses they are taking.
SELECT FName, CourseName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
ORDER BY FName;

-- List each student's first and last name along with the course name they are taking.
SELECT FName || ' ' || LName AS FullName, CourseName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
ORDER BY FullName;

-- List each student's ID, first name, course name, and course section.
SELECT s.StudId, s.FName, c.CourseName, c.Sect
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
ORDER BY StudId;

-- List the first and last names of students taking "SIMS W421 - DATABASE IMPL."
SELECT s.FName, s.LName, c.CourseName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
WHERE CourseName = 'SIMS W421 - DATABASE IMPL.';

-- List the students taking each course, including the course name and professor.
SELECT c.CourseName, c.Profname, 
    s.FName || ' ' || s.LName AS FullName
FROM Course c
    JOIN Has h ON c.SeqCde = h.SeqCde
    JOIN Student s ON h.StudId = s.StudId
ORDER BY CourseName;

-- List each student's name along with the professor teaching their course.
SELECT s.FName || ' ' || s.LName AS FullName, c.CourseName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
ORDER BY FullName;

-- List all students alphabetically by last name.
SELECT LName || ', ' || FName AS FullName, StudId
FROM Student
ORDER BY FullName;

-- List all students alphabetically by first name and then by student ID.
SELECT FName, StudId
FROM Student
ORDER BY FName, StudId;

-- List all courses alphabetically by course name.
SELECT *
FROM Course
ORDER BY CourseName;

-- List each student's name and courses, ordered by student name and then course name.
SELECT s.FName || ' ' || s.LName AS FullName, c.CourseName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
ORDER BY FullName, c.CourseName;

-- List students whose major is Math.
SELECT * 
FROM Student
WHERE Major = 'Math';

-- List students whose FinancialAid is greater than $4,000.
SELECT *
FROM Student
WHERE FinancialAid > 4000;

-- List students whose Tuition is exactly $2,800.
-- List courses that meet on Tuesday and Thursday.
SELECT *
FROM Course 
WHERE MeetingDays LIKE '%T-Th%';

-- List courses taught by "Toland T."
SELECT * 
FROM Course
WHERE ProfName = 'Toland T';

-- List the first and last name of every student along with the course name, section, and professor for every course they are taking.
SELECT s.FName, s.LName, c.CourseName, c.Sect, c.ProfName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
ORDER BY s.Fname;

-- List all students taking more than one course.
SELECT s.FName || ' ' || s.LName AS FullName, 
    COUNT(c.CourseName) as CourseCount
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
GROUP BY s.FName || ' ' || s.LName 
HAVING COUNT(c.CourseName) > 1
ORDER BY FullName;

-- List the number of courses each student is taking.
SELECT s.FName || ' ' || s.LName AS FullName, 
    COUNT(c.CourseName) AS CourseCount
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.Seqcde
GROUP BY s.FName || ' ' || s.LName
ORDER BY FullName;

-- List the number of students enrolled in each course.
SELECT c.CourseName || ' (' || c.Sect || ')' AS CourseSect,
    COUNT(s.StudId) AS EnrolledCount
FROM Course c
    JOIN Has h ON c.Seqcde = h.SeqCde
    JOIN Student s ON h.StudId = s.StudId
GROUP BY c.CourseName, c.Sect;

-- List all courses that have Susan Martin enrolled.
SELECT s.FName || ' ' || s.LName AS FullName, c.CourseName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
WHERE s.FName || ' ' || s.LName = 'Susan Martin';

-- List each student's name, major, course name, and professor, ordered by major and then student name.
SELECT s.FName || ' ' || s.LName AS FullName, s.Major,
    c.CourseName,
    c.ProfName
FROM Student s
    JOIN Has h ON s.StudId = h.StudId
    JOIN Course c ON h.SeqCde = c.SeqCde
ORDER BY Major, s.FName || ' ' || s.LName;

