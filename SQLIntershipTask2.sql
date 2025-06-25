USE EyeHospitalDB;

--Insert data into Patients table

INSERT INTO Patients (Name, Email, PhoneNumber, Address)
VALUES
  ('John Doe', 'john.doe@example.com', '1234567890', '123 Main St'),
  ('Jane Doe', 'jane.doe@example.com', NULL, '456 Elm St'),
  ('Bob Smith', NULL, '9876543210', '789 Oak St');

-- Insert data into Doctors table
INSERT INTO Doctors (Name, Email, Specialty, PhoneNumber)
VALUES
  ('Dr. Smith', 'smith@example.com', 'Ophthalmologist', '5551234567'),
  ('Dr. Johnson', 'johnson@example.com', 'Optometrist', NULL),
  ('Dr. Williams', NULL, 'Surgeon', '5559876543');

-- Insert data into Appointments table
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime)
VALUES
  (1, 1, '2023-03-01', '09:00:00'),
  (2, 2, '2023-03-02', NULL),
  (3, 1, NULL, '10:00:00');

-- Insert data into Treatments table
INSERT INTO Treatments (AppointmentID, TreatmentType, Description)
VALUES
  (1, 'Surgery', 'Cataract surgery'),
  (2, 'Examination', NULL),
  (3, 'Medication', 'Prescribed medication');

-- Insert data into Hospitals table
INSERT INTO Hospitals (Name, Address, PhoneNumber)
VALUES
  ('Eye Hospital', '123 Hospital Dr', '5555555555'),
  ('Vision Clinic', '456 Clinic Dr', NULL);

-- Insert data into HospitalDoctors table
INSERT INTO HospitalDoctors (HospitalID, DoctorID)
VALUES
  (1, 1),
  (1, 2),
  (2, 3);

-- Update data in Patients table
UPDATE Patients
SET PhoneNumber = '5551234567'
WHERE PatientID = 2;

-- Update multiple rows in Appointments table
UPDATE Appointments
SET AppointmentTime = '10:00:00'
WHERE DoctorID = 1;

-- Delete data from Appointments table(It will return error)
DELETE FROM Appointments
WHERE AppointmentID = 3;
--To fix this, you have two options
--Option 1: Delete treatments first(Delete the treatments related to the appointment you're trying to delete. Then, delete the appointment itself.)
DELETE FROM Treatments WHERE AppointmentID = 3;
DELETE FROM Appointments WHERE AppointmentID = 3;
-- Option 2: Use "ON DELETE CASCADE"(You can modify the foreign key constraint in the 'Treatments' table to use "ON DELETE CASCADE". This will automatically delete related records in the 'Treatments' table when a record is deleted from the 'Appointments' table.
ALTER TABLE Treatments
DROP CONSTRAINT FK_Treatments_Appointments;


ALTER TABLE Treatments
ADD CONSTRAINT FK_Treatments_Appointments
FOREIGN KEY (AppointmentID)
REFERENCES Appointments(AppointmentID)
ON DELETE CASCADE;

--With this modification, when you delete a record from the 'Appointments' table, the related records in the 'Treatments' table will be automatically deleted.
DELETE FROM Appointments
WHERE AppointmentID = 3;


-- Test NULL handling
SELECT *
FROM Patients
WHERE PhoneNumber IS NULL;

-- Test inserting partial values
INSERT INTO Patients (Name, Email)
VALUES
  ('Mike Brown', 'mike.brown@example.com');

SELECT * FROM Patients;

-- Test inserting values using SELECT
INSERT INTO HospitalDoctors (HospitalID, DoctorID)
SELECT HospitalID, DoctorID
FROM HospitalDoctors
WHERE HospitalID = 1;

SELECT * FROM HospitalDoctors;

