# Create a employee table with id and department 
CREATE database Company;
USE Company;
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);
INSERT INTO Employee (id, name, age, department, salary, city) VALUES
(1, 'Amit Sharma', 28, 'IT', 60000, 'Pune'),
(2, 'Neha Patil', 25, 'HR', 45000, 'Mumbai'),
(3, 'Rahul Mehta', 30, 'Finance', 70000, 'Delhi'),
(4, 'Sneha Kulkarni', 27, 'IT', 65000, 'Pune'),
(5, 'Vikas Joshi', 32, 'Sales', 55000, 'Bangalore'),
(6, 'Priya Deshmukh', 26, 'Marketing', 48000, 'Nagpur'),
(7, 'Arjun Rao', 29, 'IT', 72000, 'Hyderabad'),
(8, 'Kiran Patil', 24, 'HR', 42000, 'Mumbai'),
(9, 'Rohit Verma', 31, 'Finance', 75000, 'Delhi'),
(10, 'Pooja Singh', 27, 'Sales', 50000, 'Pune');

ALTER TABLE Employee
DROP COLUMN salary,
DROP COLUMN age;
SELECT * FROM Employee;

#Create salary table 
CREATE TABLE Salary (
    emp_id INT,
    salary INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(id)
);

INSERT INTO Salary (emp_id, salary) VALUES
(1, 60000),
(2, 45000),
(3, 70000),
(4, 65000),
(5, 55000),
(6, 48000),
(7, 72000),
(8, 42000),
(9, 75000),
(10, 50000);

SELECT * FROM Salary;

ALTER TABLE Salary
CHANGE emp_id id INT;

# Create Performance Table 
CREATE TABLE Performance (
    id INT,
    rating INT,
    remarks VARCHAR(100),
    FOREIGN KEY (id) REFERENCES Employee(id)
);
INSERT INTO Performance (id, rating, remarks) VALUES
(1, 5, 'Excellent'),
(2, 4, 'Good'),
(3, 5, 'Excellent'),
(4, 4, 'Good'),
(5, 3, 'Average'),
(6, 4, 'Good'),
(7, 5, 'Excellent'),
(8, 3, 'Average'),
(9, 5, 'Excellent'),
(10, 4, 'Good');
SELECT * FROM Performance;

SELECT e.id, e.name, e.department, s.salary
FROM Employee e
JOIN Salary s ON e.id = s.id;

SELECT 
    e.id,
    e.name,
    e.department,
    s.salary,
    p.rating,
    p.remarks
FROM Employee e
JOIN Salary s ON e.id = s.id
JOIN Performance p ON e.id = p.id;
