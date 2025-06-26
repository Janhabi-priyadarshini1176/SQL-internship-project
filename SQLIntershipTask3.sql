USE EyeHospitalDB;

-- Select all columns from the Patients table
SELECT * FROM Patients;

-- Select specific columns from the Patients table
SELECT Name, Email, PhoneNumber FROM Patients;


-- Filter rows using WHERE clause
SELECT * FROM Patients
WHERE PhoneNumber is NOT NULL;

-- Filter rows using AND operator
SELECT * FROM Appointments
WHERE AppointmentDate = '2023-03-01' AND DoctorID = 1;

-- Filter rows using OR operator
SELECT * FROM Patients
WHERE Name LIKE '%John%' OR Email LIKE '%example.com';

-- Filter rows using LIKE operator
SELECT * FROM Patients
WHERE Name LIKE '%Doe%';

-- Filter rows using BETWEEN operator
SELECT * FROM Appointments
WHERE AppointmentDate BETWEEN '2023-03-01' AND '2023-03-31';

-- Sort results using ORDER BY clause
SELECT * FROM Patients
ORDER BY Name ASC;

-- Limit output rows using TOP clause
SELECT TOP 3 * FROM Patients
ORDER BY PatientID DESC;

-- Use IN operator
SELECT * FROM Appointments
WHERE DoctorID IN (1, 2);

-- Use DISTINCT keyword
SELECT DISTINCT Specialty
FROM Doctors;

-- Use aliasing
SELECT Name AS PatientName, Email AS PatientEmail
FROM Patients;

-- Use JOIN clause
SELECT P.Name, A.AppointmentDate
FROM Patients P
JOIN Appointments A ON P.PatientID = A.PatientID;

-- Use subquery
SELECT *
FROM Patients
WHERE PatientID IN (SELECT PatientID FROM Appointments WHERE DoctorID = 1);

