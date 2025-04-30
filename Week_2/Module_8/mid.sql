-- Mid Exam (Database Management)
-- Nazmul Hossain



/*
1 --> Solution :
    Primary Key : Uniquely identifies each record in a table.
    Foreign Key : A field in one table that refers to the primary key in another table .
*/



-- 2 --> 
-- A Self Join is a type of SQL join where a table is joined with itself.
    SELECT e1.First_Name, e1.Manager_ID
    FROM employees e1
    JOIN employees e2 ON e1.Manager_ID = e2.Manager_ID
    WHERE e1.Employee_ID != e2.Employee_ID;



-- 3_a -->
    CREATE TABLE Employees (
        Employee_Id INT PRIMARY KEY,
        First_Name VARCHAR(30),
        Last_Name VARCHAR(30),
        Date_of_Birth DATE,
        Department_Id INT,
        Salary DECIMAL(10, 2)
    );
-- 3_b -->
    CREATE TABLE Projects (
        Project_ID INT PRIMARY KEY,
        Project_Name VARCHAR(100),
        Start_Date DATE,
        End_Date DATE,
        Budget DECIMAL(12, 2)
    );



-- 4 -->
    SELECT *
    FROM employees
    WHERE salary = (
        SELECT MAX(salary)
        FROM employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM employees
            WHERE salary < (
                SELECT MAX(salary)
                FROM employees
            )
        )
    );



-- 5 -->
    SELECT d.department_name AS Dept_name, COUNT(e.employee_id) AS Members
    FROM departments d
    LEFT JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_name;



-- 6 -->
-- Inner Join
    SELECT e.first_name, d.department_name
    FROM employees e
    INNER JOIN departments d ON e.department_id = d.department_id;
-- Left Join
    SELECT e.first_name, d.department_name
    FROM employees e
    LEFT JOIN departments d ON e.department_id = d.department_id;
-- Right Join
    SELECT e.first_name, d.department_name
    FROM employees e
    RIGHT JOIN departments d ON e.department_id = d.department_id;
-- Cross Join
    SELECT e.first_name, d.department_name
    FROM employees e
    CROSS JOIN departments d;



-- 7 -->
-- A Common Table Expression (CTE) is a temporary named result set in SQL that you define using the WITH clause, and it can be referred to within the same query.
    WITH avg_sal AS (
        SELECT AVG(salary) AS avgs
        FROM employees
    )
    SELECT e.first_name, e.salary
    FROM employees e, avg_sal
    WHERE e.salary > avgs;



-- 8 -->
    SELECT first_name,last_name
    FROM employees
    WHERE salary < (
        SELECT salary 
        FROM employees
        WHERE first_name = 'Steven' 
        AND last_name = 'King'
    );



-- 9 -->
    SELECT d.department_name AS Dept_Name, e.first_name AS Manager_Name
    FROM departments d
    JOIN employees e ON d.manager_id = e.employee_id;



-- 10 -->
    SELECT DISTINCT l.city AS City
    FROM departments d
    JOIN locations l ON d.location_id = l.location_id;

