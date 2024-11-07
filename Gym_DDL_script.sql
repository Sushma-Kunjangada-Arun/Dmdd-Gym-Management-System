-- iF DATABASE EXISTS, DROP
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'GYM_Management_System')
    DROP DATABASE GYM_Management_System

CREATE DATABASE [GYM_Management_System];
GO
USE [GYM_Management_System];
GO

CREATE TABLE Branch (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName VARCHAR(100) NOT NULL,
    ContactEmail VARCHAR(100) NOT NULL UNIQUE,
    ContactNumber VARCHAR(15) NOT NULL CHECK (LEN(ContactNumber) = 10),
    BranchAddress VARCHAR(255) NOT NULL,
    OpeningHours VARCHAR(50),
    FacilitiesAvailable VARCHAR(50)
);

CREATE TABLE Person (
    PersonID INT PRIMARY KEY IDENTITY(1,1),
    BranchID INT NOT NULL,
    PersonName VARCHAR(100) NOT NULL,
    PersonEmail VARCHAR(100) NOT NULL,
    PersonContact VARCHAR(15) NOT NULL CHECK (LEN(PersonContact) = 10),
    PersonAddress VARCHAR(200),
    PersonType VARCHAR(50) CHECK (PersonType IN ('Customer', 'Trainer')),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID)
);

CREATE TABLE Customer (
    CPersonID INT PRIMARY KEY,
    MembershipID INT NOT NULL,
    EndDate DATE NOT NULL,
    MembershipPeriod INT CHECK (MembershipPeriod > 0),
    FOREIGN KEY (CPersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Trainer (
    TPersonID INT PRIMARY KEY,
    TrainerType VARCHAR(50) NOT NULL CHECK (TrainerType IN ('Personal', 'Group', 'Specialist')),
    FOREIGN KEY (TPersonID) REFERENCES Person(PersonID)
);

CREATE TABLE Membership (
    MembershipID INT PRIMARY KEY IDENTITY(1,1),
    MembershipType VARCHAR(50) NOT NULL,
    Description VARCHAR(100),
    Price DECIMAL(10, 2) CHECK (Price >= 0)
);

CREATE TABLE Schedule (
    ScheduleID INT PRIMARY KEY IDENTITY(1,1),
    CPersonID INT NOT NULL,
    TPersonID INT NOT NULL,
    Date DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Type VARCHAR(50),
    CHECK (EndTime > StartTime),
    FOREIGN KEY (CPersonID) REFERENCES Customer(CPersonID),
    FOREIGN KEY (TPersonID) REFERENCES Trainer(TPersonID)
);

CREATE TABLE ExerciseProgram (
    ProgramID INT PRIMARY KEY IDENTITY(1,1),
    TPersonID INT NOT NULL,
    ProgramName VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    Duration INT CHECK (Duration > 0),
    Level VARCHAR(50) CHECK (Level IN ('Beginner', 'Intermediate', 'Advanced')),
    Goal VARCHAR(100),
    FOREIGN KEY (TPersonID) REFERENCES Trainer(TPersonID)
);

CREATE TABLE Customer_Program (
    CPersonID INT NOT NULL,
    ProgramID INT NOT NULL,
    ProgramType VARCHAR(50),
    PRIMARY KEY (CPersonID, ProgramID),
    FOREIGN KEY (CPersonID) REFERENCES Customer(CPersonID),
    FOREIGN KEY (ProgramID) REFERENCES ExerciseProgram(ProgramID)
);

CREATE TABLE Exercise (
    ExerciseID INT PRIMARY KEY IDENTITY(1,1),
    ExerciseName VARCHAR(100) NOT NULL,
    EquipmentRequired VARCHAR(50),
    Level VARCHAR(50) CHECK (Level IN ('Easy', 'Medium', 'Hard')),
    Description VARCHAR(500)
);

CREATE TABLE FitnessRoutine (
    ProgramID INT NOT NULL,
    ExerciseID INT NOT NULL,
    Sets INT CHECK (Sets > 0),
    Reps INT CHECK (Reps > 0),
    Duration INT CHECK (Duration >= 0),
    PRIMARY KEY (ProgramID, ExerciseID),
    FOREIGN KEY (ProgramID) REFERENCES ExerciseProgram(ProgramID),
    FOREIGN KEY (ExerciseID) REFERENCES Exercise(ExerciseID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    PaymentMode VARCHAR(50) CHECK (PaymentMode IN ('Cash', 'Card', 'Online')),
    Amount DECIMAL(10, 2) NOT NULL CHECK (Amount > 0),
    PaymentDate DATE NOT NULL
);

CREATE TABLE Item (
    ItemID INT PRIMARY KEY IDENTITY(1,1),
    ItemName VARCHAR(100) NOT NULL,
    ItemPrice DECIMAL(10, 2) NOT NULL CHECK (ItemPrice > 0),
    ItemType VARCHAR(50) CHECK (ItemType IN ('Equipment', 'Product')),
    ItemWeight DECIMAL(10, 2) CHECK (ItemWeight >= 0)
);

CREATE TABLE Owns_Item (
    BranchID INT NOT NULL,
    ItemID INT NOT NULL,
    Status VARCHAR(50),
    PRIMARY KEY (BranchID, ItemID),
    FOREIGN KEY (BranchID) REFERENCES Branch(BranchID),
    FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
);

CREATE TABLE Equipment (
    EItemID INT PRIMARY KEY,
    ServiceDate DATE NOT NULL,
    FOREIGN KEY (EItemID) REFERENCES Item(ItemID)
);

CREATE TABLE Product (
    PItemID INT PRIMARY KEY,
    Colors VARCHAR(100),
    FOREIGN KEY (PItemID) REFERENCES Item(ItemID)
);

CREATE TABLE OrderTable (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CPersonID INT NOT NULL,
    PaymentID INT NOT NULL,
    PItemID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    FOREIGN KEY (CPersonID) REFERENCES Customer(CPersonID),
    FOREIGN KEY (PaymentID) REFERENCES Payment(PaymentID),
    FOREIGN KEY (PItemID) REFERENCES Product(PItemID)
);

