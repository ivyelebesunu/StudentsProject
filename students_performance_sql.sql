--- Loading the data into sql
SELECT *
FROM students_performance_data

--- Finding null values & replace column names
SELECT *
FROM students_performance_data
WHERE test_prep IS NULL

--- Generating the average score of students (pass mark)
SELECT ROUND (AVG(math_score + reading_score + writing_score)/3) AS avg
FROM students_performance_data

--- Generating individual average scores for students (before creating a permanent column)
SELECT gender,AVG(math_score + reading_score + writing_score)/3 AS avg_score
FROM students_performance_data
GROUP BY id, gender

--- Generating the average score of students per gender
SELECT gender,ROUND(AVG(math_score + reading_score + writing_score)/3) AS avg_score
FROM students_performance_data
GROUP BY gender

--- Generating the average score of students per gender per subject
SELECT gender, ROUND (AVG(math_score)) AS avg_math, ROUND(AVG(reading_score)) AS avg_read, ROUND(AVG(writing_score)) AS avg_write
FROM students_performance_data
GROUP BY gender

--- Generating the count of the gender 
SELECT gender, COUNT(gender)
FROM students_performance_data
GROUP BY gender
ORDER BY gender

--- Finding the count of students who took the test prep course by gender
SELECT gender, COUNT(gender)
FROM students_performance_data
WHERE test_prep = 'completed'
GROUP BY gender

--- Finding the highest average score
SELECT gender,MAX(avg_score)
FROM students_performance_data
GROUP BY gender

--- Finding the lowest average score
SELECT gender,MIN(avg_score)
FROM students_performance_data
GROUP BY gender

--- Finding the count of students that did the test prep and passed the average pass mark
SELECT gender, COUNT (gender)
FROM students_performance_data
WHERE test_prep = 'completed'
AND avg_score >= 68
GROUP BY gender

--- Finding the count of students that did not do the test prep and passed the average pass mark
SELECT gender, COUNT (gender)
FROM students_performance_data
WHERE test_prep = 'none'
AND avg_score >= 68
GROUP BY gender

--- Finding the count of students that did the test prep and got lower than the average pass mark
SELECT gender, COUNT (gender)
FROM students_performance_data
WHERE test_prep = 'completed'
AND avg_score < 68
GROUP BY gender

--- Finding the count of students that did not do the test prep and got lower than the average pass mark
SELECT gender, COUNT (gender)
FROM students_performance_data
WHERE test_prep = 'none'
AND avg_score < 68
GROUP BY gender

--- Finding the count of students in race
SELECT COUNT(gender), race
FROM students_performance_data
GROUP BY race

--- Finding the count of students by race and gender
SELECT COUNT(gender), race, gender
FROM students_performance_data
GROUP BY race, gender

--- Race and highest avg_score
SELECT race, MAX (avg_score) AS high_avg
FROM students_performance_data
GROUP BY race
ORDER BY high_avg ASC

--- Race and lowest avg_score
SELECT race, MIN (avg_score) AS low_avg
FROM students_performance_data
GROUP BY race
ORDER BY low_avg ASC

--- Standard lunch and avg_score
SELECT MAX(avg_score) AS max_avg, MIN(avg_score) AS min_avg
FROM students_performance_data
WHERE lunch = 'standard'

--- Free lunch and avg_score
SELECT MAX(avg_score) AS max_avg, MIN(avg_score) AS min_avg
FROM students_performance_data
WHERE lunch = 'free/reduced'

--- Lunch and count of students
SELECT lunch, COUNT(gender)
FROM students_performance_data
GROUP BY lunch

--- Standard lunch and  gender that passed the pass mark
SELECT gender, COUNT(gender)
FROM students_performance_data
WHERE lunch = 'standard'
AND avg_score >= 68
GROUP BY gender

--- Free/reduced lunch and  gender that passed the pass mark
SELECT gender, COUNT(gender)
FROM students_performance_data
WHERE lunch = 'free/reduced'
AND avg_score >= 68
GROUP BY gender

--- Free/reduced lunch and  gender that got below the pass mark
SELECT gender, COUNT(gender)
FROM students_performance_data
WHERE lunch = 'free/reduced'
AND avg_score < 68
GROUP BY gender

--- Standard lunch and  gender that got below the pass mark
SELECT gender, COUNT(gender)
FROM students_performance_data
WHERE lunch = 'standard'
AND avg_score < 68
GROUP BY gender

--- Parent Edu and avg_score
SELECT parent_edu, MAX(avg_score) as max_avg, MIN (avg_score) AS min_avg
FROM students_performance_data
GROUP BY parent_edu

--- Race and Parent_edu
SELECT race, parent_edu, COUNT(parent_edu) AS count_parent_edu
FROM students_performance_data
GROUP BY race, parent_edu
ORDER BY race

--- Lunch and race
SELECT race, lunch, COUNT(lunch)
FROM students_performance_data
GROUP BY race, lunch
ORDER BY race

--- Finding the count of students who took the prep_test and passed by race
SELECT race, COUNT(gender)
FROM students_performance_data
WHERE test_prep = 'completed'
AND avg_score >= 68
GROUP BY race








