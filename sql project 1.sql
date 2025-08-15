use Parks_and_recreation

CREATE TABLE employee_demographics(
    employee_id  INT NOT NULL,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    age           INT,
    gender        VARCHAR(10),
    birth_date    DATE,
    PRIMARY KEY (employee_id)
);


CREATE TABLE employee_salary (
    employee_id   INT NOT NULL,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    occupation    VARCHAR(50),
    salary        INT, 
    dept_id       INT
);

INSERT INTO employee_demographics 
    (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
    (1, 'Leslie',  'Knope',        44, 'Female', '1979-09-25'),
    (2, 'Tom',     'Haverford',    36, 'Male',   '1987-03-04'),
    (3, 'April',   'Ludgate',      29, 'Female', '1994-08-27'),
    (4, 'Jerry',   'Gergich',      61, 'Male',   '1962-08-28'),
    (5, 'Donna',   'Meagle',       45, 'Female', '1978-07-30'),
    (6, 'Ann',     'Perkins',      35, 'Female', '1988-12-01'),
    (7, 'Chris',   'Traeger',      44, 'Male',   '1979-11-18'),
    (8, 'Ben',     'Wyatt',        38, 'Male',   '1985-07-27'),
    (9, 'Andy',    'Dwyer',        34, 'Male',   '1989-05-23'),
    (11, 'Mark',   'Brendanawicz', 42, 'Male',   '1983-06-11'),
    (12, 'Craig',  'Middlebrooks', 37, 'Male',   '1986-07-27');



    select * from 
    "employee_demographics";

   -- Create parks_departments table
-- Drop the table first if it exists
DROP TABLE IF EXISTS parks_departments;

-- Create the table with identity column
CREATE TABLE parks_departments (
    department_id   INT NOT NULL IDENTITY(1,1),
    department_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (department_id)
);

-- Insert values without specifying department_id
INSERT INTO parks_departments (department_name)
VALUES
    ('Parks and Recreation'),
    ('Animal Control'),
    ('Public Works'),
    ('Healthcare'),
    ('Library'),
    ('Finance');

    SELECT * FROM employee_salary

    INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
    (1, 'Leslie', 'Knope',    'Deputy Director of Parks and Recreation', 75000, 1),
    (2, 'Ron',    'Swanson',  'Director of Parks and Recreation',        70000, 1),
    (3, 'Tom',    'Haverford','Entrepreneur',                             50000, 1),
    (4, 'April',  'Ludgate',  'Assistant to the Director of Parks and Recreation', 25000, 1),
    (5, 'Jerry',  'Gergich',  'Office Manager',                           50000, 1),
    (6, 'Donna',  'Meagle',   'Office Manager',                           60000, 1),
    (7, 'Ann',    'Perkins',  'Nurse',                                    55000, 4),
    (8, 'Chris',  'Traeger',  'City Manager',                             90000, 3),
    (9, 'Ben',    'Wyatt',    'State Auditor',                            70000, 6);

    INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
    (10, 'Andy',  'Dwyer',        'Shoe shiner and Musician', 20000, NULL),
    (11, 'Mark',  'Brendanawicz', 'City Planner',             570000, 3),
    (12, 'Craig', 'Middlebrooks', 'Parks Director',           65000, 1);

    select * from 
    "employee_demographics";

     select * from 
    "employee_salary";

    select first_name, last_name, birth_date, age,
    age+10 as 'added age'
    from employee_demographics
    where employee_id= 3;

    SELECT * 
FROM employee_demographics
WHERE birth_date = '1988-12-01'
  AND gender <> 'Male';

    SELECT * 
    FROM employee_demographics
    WHERE first_name LIKE 'JER%'

    --GROUP BY FUNCTIONS
    
    
    SELECT 
    gender,
    AVG(age) AS AVG_AGE,
    MIN(age) AS MIN_AGE,
    MAX(age) AS MAX_AGE,
    COUNT(age) AS COUNTS
FROM employee_demographics
GROUP BY gender
ORDER BY gender ASC;


    select *
    from employee_salary
    group by occupation, salary



   select first_name, last_name, occupation, salary,Avg(salary) as 'Average salary'
   from employee_salary
   where occupation like '%manager%'
   group by first_name, last_name, occupation, salary
   having avg(salary) > 50000
   order by first_name, last_name, occupation, salary desc;


-- limiting 

select * from employee_demographics;

select * from employee_salary;

--inner join

select * 
from employee_demographics as dem
join employee_salary as sal 
   on dem.employee_id = sal.employee_id;

--left join

select *  from employee_demographics as dem
left join employee_salary as sal
on dem.employee_id = sal.employee_id;

--right join
select * from employee_demographics as dem 
right join employee_salary as sal
on dem.employee_id = sal.employee_id

--self join

select * from employee_salary as emp_1
join employee_salary as emp_2
on emp_1.employee_id+1 = emp_2.employee_id


-- union

use Parks_and_Recreation


 
select * from employee_salary;

use parks_and_recreation;

-- USING UNION FUNCTION --
--  FINDING THE OLD PEOPLE WHO ARE HIGHLY PAID --

select employee_id,first_name, last_name,'old man' as Lable from employee_demographics
where age > 30 and gender = 'male'
union
select employee_id,first_name, last_name,'old lady' as Lable from employee_demographics
where age > 30 and gender = 'female'
union
select employee_id, first_name, last_name, 'Highly Paid Employee' as Leble
from employee_salary
where salary > 70000
ORDER BY employee_id, first_name, last_name

SELECT * FROM parks_departments;
SELECT * FROM employee_demographics;

-- joining parks_departments and employee_demographics table and ordering it;

SELECT * FROM parks_departments AS PAR
JOIN employee_demographics AS DEM
ON PAR.department_id = DEM.employee_id
ORDER BY employee_id, department_id, first_name, last_name, age, gender, birth_date desc;














    



