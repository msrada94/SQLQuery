-- Schema
CREATE TABLE Department (
                            Dept_id INT PRIMARY KEY,
                            Dept_name VARCHAR(50)
);

CREATE TABLE Project (
                         Project_id INT PRIMARY KEY,
                         Project_name VARCHAR(50)
);

CREATE TABLE Employee (
                          Employee_id INT PRIMARY KEY,
                          Employee_name VARCHAR(50),
                          Dept_id INT,
                          FOREIGN KEY (Dept_id) REFERENCES Department(Dept_id)
);

CREATE TABLE Employee_Project (
                                  Employee_id INT,
                                  Project_id INT,
                                  PRIMARY KEY (Employee_id, Project_id),
                                  FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
                                  FOREIGN KEY (Project_id) REFERENCES Project(Project_id)
);

-- Insertions
INSERT INTO Department (Dept_id, Dept_name)
VALUES (1, 'Sales'), (2, 'Marketing'), (3, 'IT');

INSERT INTO Project (Project_id, Project_name)
VALUES (1, 'Project A'), (2, 'Project B'), (3, 'Project C');

INSERT INTO Employee (Employee_id, Employee_name, Dept_id)
VALUES (1, 'John Doe', 1), (2, 'Jane Smith', 1), (3, 'Bob Johnson', 2),
       (4, 'Sarah Lee', 2), (5, 'David Kim', 3), (6, 'Lisa Wong', 3);

INSERT INTO Employee_Project (Employee_id, Project_id)
VALUES (1, 1), (2, 1), (3, 2), (4, 3), (5, 2), (6, 3);

-- SQL query to find out how many unique departments work on a project
SELECT COUNT(DISTINCT Dept_id) AS NumDepartments
FROM Employee
INNER JOIN Employee_Project ON Employee.Employee_id = Employee_Project.Employee_id
GROUP BY Dept_id
HAVING COUNT(DISTINCT Employee_Project.Project_id) = 1
