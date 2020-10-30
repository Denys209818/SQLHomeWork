CREATE DATABASE Academy

use Academy

CREATE TABLE Departments (
Id int NOT NULL IDENTITY PRIMARY KEY,
Financing money NOT NULL CHECK (Financing >= 0) DEFAULT 0,
Name nvarchar(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE
)

INSERT INTO Departments (Financing, Name) VALUES (100000, 'Matematyka')
INSERT INTO Departments (Financing, Name) VALUES (150000, 'Fizyka')
INSERT INTO Departments (Financing, Name) VALUES (170000, 'Filologia')
INSERT INTO Departments (Financing, Name) VALUES (180000, 'Medyzyna')
INSERT INTO Departments (Financing, Name) VALUES (200000, 'Pravo')
INSERT INTO Departments (Financing, Name) VALUES (10000, 'Computer Science')




CREATE TABLE Faculties (
Id int NOT NULL IDENTITY PRIMARY KEY,
Dean nvarchar(MAX) NOT NULL CHECK (LEN(Dean) > 0),
Name nvarchar(100) NOT NULL CHECK (LEN(Name) > 0) UNIQUE
)

INSERT INTO Faculties (Dean, Name) VALUES ('Petro', 'Matematyka')
INSERT INTO Faculties (Dean, Name) VALUES ('Ivan', 'Programing')
INSERT INTO Faculties (Dean, Name) VALUES ('Vasja', 'Web-design')
INSERT INTO Faculties (Dean, Name) VALUES ('Sasha', 'Design')
INSERT INTO Faculties (Dean, Name) VALUES ('Denys', 'Ekonomika')





CREATE TABLE Groups (
Id int NOT NULL IDENTITY PRIMARY KEY,
Name nvarchar(10) NOT NULL CHECK (LEN(Name) > 0) UNIQUE,
Rating int NOT NULL CHECK (Rating >= 0 AND Rating <= 5),
Year int NOT NULL CHECK (Year > 0 AND Year <= 5)
)

INSERT INTO Groups (Name, Rating, Year) VALUES ('VPU-811', 2, 3)
INSERT INTO Groups (Name, Rating, Year) VALUES ('VPU-921', 4, 4)
INSERT INTO Groups (Name, Rating, Year) VALUES ('VPU-111', 5, 1)
INSERT INTO Groups (Name, Rating, Year) VALUES ('VPU-741', 3, 2)
INSERT INTO Groups (Name, Rating, Year) VALUES ('VPU-551', 1, 5)
INSERT INTO Groups (Name, Rating, Year) VALUES ('VPU-553', 3, 5)
INSERT INTO Groups (Name, Rating, Year) VALUES ('VPU-577', 4, 5)

CREATE TABLE Teachers (
Id int NOT NULL IDENTITY PRIMARY KEY,
EmploymentDate date NOT NULL CHECK (EmploymentDate > '1990-01-01'),
IsAssistant BIT NOT NULL DEFAULT 0,
IsProfessor BIT NOT NULL DEFAULT 0,
Name nvarchar(MAX) NOT NULL CHECK (LEN(Name) > 0),
Position nvarchar(MAX) NOT NULL CHECK (LEN(Position) > 0),
Premium money NOT NULL CHECK (Premium >= 0) DEFAULT 0,
Salary money NOT NULL CHECK (Salary > 0),
Surname nvarchar(MAX) NOT NULL CHECK(LEN(Surname) > 0)
)

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) 
VALUES ('2005-05-09', 0, 1, 'Denys', 'Professor', 1000, 10000, 'SurnameOfDenys')

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) 
VALUES ('2002-09-23', 1, 0, 'Irina', 'Assistant', 1200, 9000, 'SurnameOfIrina')

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) 
VALUES ('1993-10-19', 0, 1, 'Vasja', 'Professor', 900, 8500, 'SurnameOfVasja')

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) 
VALUES ('1999-11-13', 1, 0, 'Olia', 'Assistant', 750, 12000, 'SurnameOfOlia')

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) 
VALUES ('2000-01-21', 0, 1, 'Sasha', 'Professor', 1500, 15000, 'SurnameOfSasha')

INSERT INTO Teachers (EmploymentDate, IsAssistant, IsProfessor, Name, Position, Premium, Salary, Surname) 
VALUES ('2012-01-21', 0, 1, 'Kiril', 'Laborant', 50, 15000, 'SurnameOfKiril')


--	�������
--	1. ������� ������� ������, �� ����������� �� ���� � �������� �������.
SELECT * FROM Departments ORDER BY Id DESC

--	2. ������� �������� ����� � �� �������� � ���������� ���� ����� ������ �������.
SELECT Name + ': ' + convert(nvarchar, Rating) as [����� � �������] FROM Groups

--	3. ������� ��� �������������� �� �������, ������� ������ �� ��������� � �������� � ������� ������ �� ��������� � �������� (����� ������ � ��������).
SELECT Surname, (Salary + Premium) as [������� ������ �� ��������� � ��������], (Premium + Salary) as [������� ������ �� ��������� � ��������] FROM Teachers

--	4. ������� ������� ����������� � ���� ������ ���� � ��������� �������: �The dean of faculty [faculty] is [dean].�.
SELECT ('The dean of faculty ' + Name + ' is ' + Dean) as [Deans of faculties] FROM Faculties

--	5. ������� ������� ��������������, ������� �������� ������������ � ������ ������� ��������� 1050.SELECT Surname FROM Teachers WHERE (IsProfessor = 1 AND Salary > 1050)--	6. ������� �������� ������, ���� �������������� ������� ������ 11000 ��� ������ 25000.SELECT * FROM Departments WHERE (Financing < 11000 OR Financing > 25000)--	7. ������� �������� ����������� ����� ���������� �Computer Science�.SELECT * FROM Departments WHERE Name <> 'Computer Science'--	8. ������� ������� � ��������� ��������������, ������� �� �������� ������������.SELECT Surname, Position FROM Teachers WHERE IsProfessor = 0--  9. ������� �������, ���������, ������ � �������� �����������, � ������� �������� � ��������� �� 160 �� 550.SELECT Surname, Position, Salary, Premium FROM Teachers WHERE (Premium >= 160 AND Premium <= 550)-- 10.������� ������� � ������ �����������.SELECT Surname, Salary FROM Teachers WHERE IsAssistant = 1--	11.������� ������� � ��������� ��������������, ������� ���� ������� �� ������ �� 01.01.2000.SELECT Surname, Position FROM Teachers WHERE EmploymentDate < '2000-01-01'--	12.������� �������� ������, ������� � ���������� ������� ������������� �� ������� �Software Development�. ��������� ���� ������ ����� �������� �Name of Department�.SELECT [Name] AS [Name of Department]
FROM Departments
WHERE [Name]<'Software Development'
ORDER BY [Name];

--	13.������� ������� �����������, ������� �������� (����� ������ � ��������) �� ����� 1200.
SELECT Surname FROM Teachers WHERE ((convert(int, Salary) + convert(int, Premium)) > 1200 AND IsAssistant = 1)

--	14.������� �������� ����� 5-�� �����, ������� ������� � ��������� �� 2 �� 4.
SELECT * FROM Groups WHERE (Year = 5 AND (Rating >= 2 AND Rating <= 4))

--	15.������� ������� ����������� �� ������� ������ 550 ��� ��������� ������ 200.SELECT Surname FROM Teachers WHERE (IsAssistant = 1 AND (Salary < 550 OR Premium < 200))