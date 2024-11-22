-- Create a new database
CREATE DATABASE SalaryManagement;

-- Use the created database
USE SalaryManagement;

-- Create an Employee table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    JoiningDate DATE,
    Email VARCHAR(100) UNIQUE
);

-- Create a Salary table
CREATE TABLE Salary (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    BasicSalary DECIMAL(10, 2) NOT NULL,
    HRA DECIMAL(10, 2) DEFAULT 0,
    Bonus DECIMAL(10, 2) DEFAULT 0,
    Deductions DECIMAL(10, 2) DEFAULT 0,
    TotalSalary DECIMAL(10, 2) GENERATED ALWAYS AS 
    (BasicSalary + HRA + Bonus - Deductions) STORED,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
