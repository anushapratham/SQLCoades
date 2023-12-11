CREATE DATABASE COMPANY1
USE COMPANY1
CREATE TABLE EMPLOYEE_DETAIL(
EMPLOYEE_ID INT,FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),SALARY BIGINT,
JOINING_DATE DATE('YYYY/MM/DD'),DEPARTMENT VARCHAR(25),
GENDER VARCHAR(25))
DROP TABLE  EMPLOYEE_DETAIL

CREATE TABLE EMPLOYEE_DETAIL(
EMPLOYEE_ID INT,FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),SALARY BIGINT,
JOINING_DATE DATE,DEPARTMENT VARCHAR(25),
GENDER VARCHAR(25))


INSERT INTO EMPLOYEE_DETAIL
VALUES(1,
'VIKAS',
'AHLAWAT',
600000,
'2013-12-2',
'IT',
'MALE'),
(2,
'NIKITA',
'JAIN',
530000,
'2013-2-14',
'HR',
'FEMALE'),
(3,
'ASHISH',
'KUMAR',
1000000,
'2013-2-14',
'IT',
'MALE'),
(4,
'NIKHIL',
'SHARMA',
480000,
'2013-2-15',
'HR',
'MALE'),
(5,
'ANISH',
'KADIAN',
500000,
'2013-2-16',
'PAROLL',
'MALE')

--1. Write a query to get all employee detail from "EmployeeDetail" table
SELECT * FROM EMPLOYEE_DETAIL

--2) Write a query to get only "FirstName" column from "EmployeeDetail" table
SELECT FIRST_NAME FROM EMPLOYEE_DETAIL

--3) Write a query to get FirstName in upper case as "First Name".
SELECT UPPER(FIRST_NAME)AS "FIRST_NAME"
FROM EMPLOYEE_DETAIL;

--5) Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME)AS "NAME" FROM EMPLOYEE_DETAIL;

--6) Select employee detail whose name is "Vikas
SELECT * FROM EMPLOYEE_DETAIL WHERE 
FIRST_NAME='VIKAS';

--7) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
SELECT * FROM  EMPLOYEE_DETAIL WHERE 
FIRST_NAME LIKE'A%';

--9. Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
SELECT * FROM EMPLOYEE_DETAIL WHERE 
FIRST_NAME LIKE'%H';

--10. Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'
SELECT * FROM EMPLOYEE_DETAIL WHERE 
FIRST_NAME REGEXP'^[A-P].*')

--11)Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'
SELECT * FROM EMPLOYEE_DETAIL WHERE 
FIRST_NAME NOT REGEXP'^[A-P].*';

--12)Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character
SELECT * FROM EMPLOYEE_DETAIL WHERE
GENDER LIKE '__LE';

--13)Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
SELECT * FROM EMPLOYEE_DETAIL WHERE
FIRST_NAME LIKE 'A____';

--14) Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
SELECT * FROM EMPLOYEE_DETAIL WHERE
FIRST_NAME LIKE '%\%';

--15) Get all unique "Department" from EmployeeDetail table
SELECT DISTINCT DEPARTMENT FROM EMPLOYEE_DETAIL;

--16)Get the highest "Salary" from EmployeeDetail table.
SELECT MAX(SALARY)FROM EMPLOYEE_DETAIL;

--17) Get the lowest "Salary" from EmployeeDetail table
SELECT MIN(SALARY) FROM EMPLOYEE_DETAIL;

--18)Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
SELECT_DATE-FORMAT(JOINING_DATE,'%DD/ %MM/ %YYYY')AS JOINING_DATE FROM EMPLOYEE_DETAIL;

--19)Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
SELECT DATE_FORMAT(JOINING_DATE,'%Y/%M/%D')AS JOINING_DATE FROM EMPLOYEE_DETAIL;

--20) Show only time part of the "JoiningDate"
SELECT TIME(JOINING_DATE) AS JOINING_TIME FROM EMPLOYEE_DETAIL;

--21)Get only Year part of "JoiningDate"
SELECT YEAR(JOINING_DATE)AS JOINING_YEAR FROM EMPLOYEE_DETAIL; 

--22)Get only Month part of "JoiningDate”
SELECT MONTH(JOINING_DATE)AS JOINING_MONTH FROM EMPLOYEE_DETAIL; 

--23)Get system date
SELECT CURRENT_TIMESTAMP AS CURRENTDATE;

--24)Get UTC date.
SELECT GETUTCDATE() AS
CURRENTUTCDATE;

--a)Get the first name, current date, joiningdate and diff between current date and joining date in months.
SELECT FIRST_NAME,CURRENT_TIMESTAMP() AS CURRENTDATE,JOINING_DATE,DATEDIFF(CURRENT_TIMESTAMP(),JOINING_DATE)
AS DAYSSINCEJOINING FROM EMPLOYEE_DETAIL; 

--25)Get the first name, current date, joiningdate and diff between current date and joining date in days.
SELECT FIRST_NAME,CURDATE() AS CURRENT_DATE,JOINING_DATE,DATEDIFF(CURDATE(),JOINING_DATE)
ASDAYSSINCEJOINING FROM EMPLOYEE_DETAIL; 

--26) Get all employee details from EmployeeDetail table whose joining year is 2013
SELECT * FROM EMPLOYEE_DETAIL WHERE YEAR(JOINING_DATE)=2013;

--27)Get all employee details from EmployeeDetail table whose joining month is Jan(1)
SELECT * FROM EMPLOYEE_DETAIL WHERE MONTH(JOINING_DATE)=1;

--29)Get how many employee exist in "EmployeeDetail" table
SELECT COUNT(*) AS EMPLOYEECOUNT FROM EMPLOYEE_DETAIL ;

--31.Select only one/top 1 record from "EmployeeDetail" table
SELECT * FROM EMPLOYEE_DETAIL LIMIT 1;

--32. Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
SELECT * FROM EMPLOYEE_DETAIL WHERE
FIRST_NAME IN('VIKAS','ASHISH','NIKHIL');

--33. Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
SELECT * FROM EMPLOYEE_DETAIL WHERE
FIRST_NAME NOT IN('VIKAS','ASHISH','NIKHIL');

--34. Select first name from "EmployeeDetail" table after removing white spaces from right side
SELECT RTRIM(FIRST_NAME)AS
FIRST_NAME FROM EMPLOYEE_DETAIL;

--35. Select first name from "EmployeeDetail" table after removing white spaces from left side
SELECT LTRIM(FIRST_NAME) AS
FIRST_NAME FROM EMPLOYEE_DETAIL;

--36. Display first name and Gender as M/F.(if male then M, if Female then F)
SELECT FIRST_NAME, CASE WHEN GENDER='MALE' THEN 'M' ELSE 'F' END
AS GENDER FROM EMPLOYEE_DETAIL;

--37. Select first name from "EmployeeDetail" table prifixed with "Hello
SELECT CONCAT('HELLO',  FIRST_NAME)AS
GREETING FROM EMPLOYEE_DETAIL;

--38. Get employee details from "EmployeeDetail" table whose Salary greater than 600000
SELECT * FROM EMPLOYEE_DETAIL WHERE 
SALARY>600000;

--39. Get employee details from "EmployeeDetail" table whose Salary less than 700000
SELECT * FROM EMPLOYEE_DETAIL WHERE 
SALARY<700000;

--40. Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
SELECT * FROM EMPLOYEE_DETAIL WHERE 
SALARY BETWEEN 500000 AND 600000;

CREATE TABLE PROJECT_DETAIL(PROJECT_DETAIL_ID INT,
EMPLOYEE_DETAIL_ID INT,PROJECT_NAME VARCHAR(50))

INSERT INTO PROJECT_DETAIL
VALUES(1,1,'TASK TRACK'),
(2,1,'CLP'),
(3,1,'SURVEY MANAGMENT'),
(4,2,'HR MANAGMENT'),
(5,3,'TASK TRACK'),
(6,3,'GRS'),
(7,3,'DDS'),
(8,4,'HR MANAGMENT'),
(9,6,'GL MANAGMENT')

--41. Give records of ProjectDetail table
SELECT * FROM PROJECT_DETAIL

--42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.
SELECT DEPARTMENT,SUM(SALARY) AS
TOTAL_SALARY FROM EMPLOYEE_DETAIL
GROUP BY DEPARTMENT;

--43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
SELECT DEPARTMENT,SUM(SALARY)AS
TOTAL_SALARY FROM EMPLOYEE_DETAIL
GROUP BY DEPARTMENT ORDER BY
TOTAL_SALARY ASC;

--44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary
SELECT DEPARTMENT,SUM(SALARY)AS
TOTAL_SALARY FROM EMPLOYEE_DETAIL
GROUP BY DEPARTMENT ORDER BY
TOTAL_SALARY DESC;

--45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
SELECT DEPARTMENT,COUNT(DISTINCT DEPARTMENT) AS TOTAL_DEPARTMENTS,
SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEE_DETAIL GROUP BY DEPARTMENT;

--46. Get department wise average salary from "EmployeeDetail" table order by salary ascending
SELECT DEPARTMENT,AVG(SALARY) AS
AVERAGE_SALARY FROM EMPLOYEE_DETAIL
GROUP BY DEPARTMENT ORDER BY 
AVERAGE_SALARY ASC;

--47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
SELECT DEPARTMENT,MAX(SALARY) AS
MAXIMUM_SALARY FROM EMPLOYEE_DETAIL
GROUP BY DEPARTMENT ORDER BY
MAXIMUM_SALARY ASC;

--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
SELECT DEPARTMENT,MIN(SALARY) AS
MINIMUM_SALARY FROM EMPLOYEE_DETAIL
GROUP BY DEPARTMENT ORDER BY
MINIMUM_SALARY ASC;

--49. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending
SELECT DEPARTMENT,MIN(SALARY) AS
MINIMUM_SALARY FROM EMPLOYEE_DETAIL
GROUP BY DEPARTMENT ORDER BY
MINIMUM_SALARY ASC;


--50. Join both the table that is Employee and ProjectDetail based on some common paramter






--51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.
SELECT E.FIRST_NAME AS 
EMPLOYEE_NAME,P.PROJECT_NAME
FROM EMPLOYEE_DETAIL E
INNER JOIN PROJECT_DETAIL P ON 
E.EMPLOYEE_ID=P.PROJECT_DETAIL_ID
ORDER BY E.FIRST_NAME;


--52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.
SELECT E.FIRST_NAME AS 
EMPLOYEE_NAME,P.PROJECT_NAME
FROM EMPLOYEE_DETAIL E
LEFT JOIN PROJECT_DETAIL P ON 
E.EMPLOYEE_ID=P.PROJECT_DETAIL_ID
ORDER BY E.FIRST_NAME;

--53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"
SELECT E.FIRST_NAME AS EMPLOYEE_NAME,
COALESCE(P.PROJECT_NAME,'-NO PROJECT ASSIGNED') AS PROJECT_NAME
FROM EMPLOYEE_DETAIL E
LEFT JOIN PROJECT_DETAIL P ON
E.EMPLOYEE_ID=P.EMPLOYEE_DETAIL_ID
ORDER BY E.FIRST_NAME;

--54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail
SELECT E.FIRST_NAME AS EMPLOYEE_NAME,
P.PROJECT_NAME
FROM EMPLOYEE_DETAIL E
RIGHT JOIN PROJECT_DETAIL P ON
E.EMPLOYEE_ID=P.EMPLOYEE_DETAIL_ID
ORDER BY E.FIRST_NAME;

--55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT E.FIRST_NAME AS EMPLOYEE_NAME,
P.PROJECT_NAME
FROM EMPLOYEE_DETAIL E
FULL OUTER JOIN PROJECT_DETAIL P ON
E.EMPLOYEE_ID=P.EMPLOYEE_DETAIL_ID;


--56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT E.FIRST_NAME AS EMPLOYEE_NAME,
P.PROJECT_NAME
FROM EMPLOYEE_DETAIL E
INNER JOIN PROJECT_DETAIL P ON
E.EMPLOYEE_ID=P.EMPLOYEE_DETAIL_ID
GROUP BY E.EMPLOYEE_ID,E.FIRST_NAME
HAVING COUNT(P.PROJECT_NAME)>1;

--57.Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT P.PROJECT_NAME,E.FIRST_NAME AS
EMPLOYEE_NAME
FROM PROJECT_DETAIL P
INNER JOIN EMPLOYEE_DETAIL E ON 
P.EMPLOYEE_DETAIL_ID=E.EMPLOYEE_ID
GROUP BY P.PROJECT_NAME
HAVING COUNT (E.EMPLOYEE_ID)>1;

--60. Apply Cross Join in Both the tables
SELECT E.FIRST_NAME AS EMPLOYEE_NAME,
P.PROJECT_NAME
FROM EMPLOYEE_DETAIL E
CROSS JOIN PROJECT_DETAIL P;






















