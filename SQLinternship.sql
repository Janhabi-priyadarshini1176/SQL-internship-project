CREATE DATABASE EyeHospitalDB;

USE EyeHospitalDB;

CREATE TABLE Patients (
  PatientID INT IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255) UNIQUE,
  PhoneNumber VARCHAR(20),
  Address VARCHAR(255)
);

CREATE TABLE Doctors (
  DoctorID INT IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(255),
  Email VARCHAR(255) UNIQUE,
  Specialty VARCHAR(100),
  PhoneNumber VARCHAR(20)
);

CREATE TABLE Appointments (
  AppointmentID INT IDENTITY(1,1) PRIMARY KEY,
  PatientID INT,
  DoctorID INT,
  AppointmentDate DATE,
  AppointmentTime TIME,
  FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
  FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Treatments (
  TreatmentID INT IDENTITY(1,1) PRIMARY KEY,
  AppointmentID INT,
  TreatmentType VARCHAR(100),
  Description TEXT,
  FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);

CREATE TABLE Hospitals (
  HospitalID INT IDENTITY(1,1) PRIMARY KEY,
  Name VARCHAR(255),
  Address VARCHAR(255),
  PhoneNumber VARCHAR(20)
);

CREATE TABLE HospitalDoctors (
  HospitalID INT,
  DoctorID INT,
  FOREIGN KEY (HospitalID) REFERENCES Hospitals(HospitalID),
  FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
