
-- Insert data into Branch
INSERT INTO Branch (BranchName, ContactEmail, ContactNumber, BranchAddress, OpeningHours, FacilitiesAvailable)
VALUES
('Downtown Gym', 'contact@downtowngym.com', '1234567890', '123 Main St', '6am - 10pm', 'Pool, Sauna, Weight Room'),
('Eastside Fitness', 'info@eastsidefitness.com', '1234567891', '456 East St', '5am - 11pm', 'Cardio Room, Weight Room'),
('Westend Wellness', 'support@westendwellness.com', '1234567892', '789 West St', '7am - 9pm', 'Pool, Yoga Room'),
('Central Gym', 'contact@centralgym.com', '1234567893', '101 Central Ave', '24 Hours', 'Cardio Room, Weight Room'),
('Northside Fitness', 'info@northsidefitness.com', '1234567894', '202 North St', '6am - 10pm', 'Sauna, Weight Room'),
('South Gym', 'support@southgym.com', '1234567895', '303 South St', '5am - 11pm', 'Pool, Cardio Room'),
('Fit Hub', 'contact@fithub.com', '1234567896', '404 Hub Rd', '6am - 10pm', 'Yoga Room, Weight Room'),
('Active Zone', 'info@activezone.com', '1234567897', '505 Active Ln', '5am - 11pm', 'Cardio Room, Sauna'),
('Prime Fitness', 'support@primefitness.com', '1234567898', '606 Prime Ave', '24 Hours', 'Pool, Cardio Room'),
('Elite Gym', 'contact@elitegym.com', '1234567899', '707 Elite Blvd', '6am - 9pm', 'Weight Room, Pool');

-- Insert data into Person
INSERT INTO Person (BranchID, PersonName, PersonEmail, PersonContact, PersonAddress, PersonType)
VALUES
(1, 'John Doe', 'john.doe@example.com', '9876543210', '123 Main St', 'Customer'),
(1, 'Jane Smith', 'jane.smith@example.com', '9876543211', '456 Oak St', 'Trainer'),
(2, 'Bob Brown', 'bob.brown@example.com', '9876543212', '789 Pine St', 'Customer'),
(2, 'Alice Johnson', 'alice.johnson@example.com', '9876543213', '101 Maple St', 'Trainer'),
(3, 'Mike Davis', 'mike.davis@example.com', '9876543214', '202 Elm St', 'Customer'),
(3, 'Emily Wilson', 'emily.wilson@example.com', '9876543215', '303 Cedar St', 'Trainer'),
(4, 'Tom Clark', 'tom.clark@example.com', '9876543216', '404 Walnut St', 'Customer'),
(4, 'Lucy Martinez', 'lucy.martinez@example.com', '9876543217', '505 Birch St', 'Trainer'),
(5, 'Dan White', 'dan.white@example.com', '9876543218', '606 Willow St', 'Customer'),
(5, 'Sara Evans', 'sara.evans@example.com', '9876543219', '707 Hickory St', 'Trainer');

-- Insert data into Customer
INSERT INTO Customer (CPersonID, MembershipID, EndDate, MembershipPeriod)
VALUES
(1, 1, '2025-12-31', 12),
(3, 2, '2026-06-30', 6),
(5, 3, '2025-03-31', 3),
(7, 4, '2026-01-31', 1),
(9, 5, '2025-09-30', 9),
(6, 6, '2026-04-30', 6),
(8, 7, '2025-10-31', 10),
(10, 8, '2025-11-30', 11),
(2, 9, '2025-08-31', 8),
(4, 10, '2026-05-31', 5);

-- Insert data into Trainer
INSERT INTO Trainer (TPersonID, TrainerType)
VALUES
(2, 'Personal'),       
(4, 'Group'),         
(6, 'Specialist'),    
(8, 'Personal'),      
(10, 'Group');         

-- Insert data into Membership
INSERT INTO Membership (MembershipType, Description, Price)
VALUES
('Monthly', 'Access to all facilities, valid for one month', 50.00),
('Quarterly', 'Access to all facilities, valid for three months', 140.00),
('Semi-Annual', 'Access to all facilities, valid for six months', 270.00),
('Annual', 'Access to all facilities, valid for one year', 500.00),
('Personal Training', 'Includes 10 personal training sessions', 300.00),
('Group Classes', 'Access to group classes', 100.00),
('Swimming Pool', 'Access to swimming pool', 80.00),
('Yoga Classes', 'Access to yoga classes', 60.00),
('Gym Only', 'Access to gym equipment only', 40.00),
('Student Discount', 'Discounted annual membership for students', 400.00);

-- Insert data into Schedule
INSERT INTO Schedule (CPersonID, TPersonID, Date, StartTime, EndTime, Type)
VALUES
(1, 2, '2024-11-06', '09:00', '10:00', 'Personal Training'),
(3, 4, '2024-11-07', '10:00', '11:00', 'Group Class'),
(5, 6, '2024-11-08', '11:00', '12:00', 'Specialist Training'),
(7, 8, '2024-11-09', '08:00', '09:00', 'Personal Training'),
(9, 10, '2024-11-10', '07:00', '08:00', 'Group Class'),
(6, 2, '2024-11-11', '09:00', '10:00', 'Specialist Training'),
(8, 4, '2024-11-12', '10:00', '11:00', 'Group Class'),
(10, 6, '2024-11-13', '11:00', '12:00', 'Personal Training'),
(2, 8, '2024-11-14', '08:00', '09:00', 'Specialist Training'),
(4, 10, '2024-11-15', '07:00', '08:00', 'Group Class');

-- Insert data into ExerciseProgram
INSERT INTO ExerciseProgram (TPersonID, ProgramName, Description, Duration, Level, Goal)
VALUES
(2, 'Weight Loss Program', 'A program focused on reducing body weight', 90, 'Intermediate', 'Weight Loss'),
(4, 'Strength Building', 'A program focused on building muscle strength', 60, 'Advanced', 'Muscle Strength'),
(6, 'Cardio Blast', 'High-intensity cardio exercises', 45, 'Beginner', 'Cardiovascular Health'),
(8, 'Yoga Basics', 'Introductory yoga sessions', 30, 'Beginner', 'Flexibility'),
(10, 'Pilates Core', 'Strengthening core muscles through pilates', 60, 'Intermediate', 'Core Strength'),
(2, 'HIIT', 'High-intensity interval training for fitness', 45, 'Advanced', 'Cardio and Strength'),
(4, 'Bodybuilding', 'A program focused on muscle growth', 120, 'Advanced', 'Muscle Mass'),
(6, 'Endurance Training', 'Improves stamina and endurance', 90, 'Intermediate', 'Endurance'),
(8, 'Posture Correction', 'Exercises for better posture', 30, 'Beginner', 'Posture'),
(10, 'Functional Fitness', 'Functional exercises for daily movements', 60, 'Intermediate', 'General Fitness');

-- Insert data into Customer_Program
INSERT INTO Customer_Program (CPersonID, ProgramID, ProgramType)
VALUES
(1, 1, 'Weight Loss'),
(3, 2, 'Strength Building'),
(5, 3, 'Cardio'),
(7, 4, 'Yoga'),
(9, 5, 'Pilates'),
(6, 6, 'HIIT'),
(8, 7, 'Bodybuilding'),
(10, 8, 'Endurance'),
(2, 9, 'Posture Correction'),
(4, 10, 'Functional Fitness');

-- Insert data into Exercise
INSERT INTO Exercise (ExerciseName, EquipmentRequired, Level, Description)
VALUES
('Push-up', 'None', 'Medium', 'A basic bodyweight exercise for upper body strength'),
('Squat', 'None', 'Medium', 'A lower body exercise targeting thighs and glutes'),
('Bench Press', 'Bench', 'Hard', 'An upper body exercise targeting the chest'),
('Deadlift', 'Barbell', 'Hard', 'A compound exercise targeting lower body'),
('Bicep Curl', 'Dumbbell', 'Easy', 'An isolation exercise for biceps'),
('Lunges', 'None', 'Medium', 'A lower body exercise targeting legs and glutes'),
('Pull-up', 'Pull-up Bar', 'Hard', 'An upper body exercise for back and arms'),
('Plank', 'None', 'Easy', 'A core exercise for stability'),
('Leg Press', 'Leg Press Machine', 'Medium', 'A lower body machine exercise'),
('Lat Pulldown', 'Lat Pulldown Machine', 'Medium', 'An upper body exercise for back');

-- Insert data into FitnessRoutine
INSERT INTO FitnessRoutine (ProgramID, ExerciseID, Sets, Reps, Duration)
VALUES
(1, 1, 3, 15, 0),
(2, 2, 4, 12, 0),
(3, 3, 4, 10, 0),
(4, 4, 3, 8, 0),
(5, 5, 3, 15, 0),
(6, 6, 4, 12, 0),
(7, 7, 4, 8, 0),
(8, 8, 3, 10, 30), 
(9, 9, 4, 10, 0),
(10, 10, 4, 12, 0);

-- Insert data into Payment
INSERT INTO Payment (PaymentMode, Amount, PaymentDate)
VALUES
('Card', 100.00, '2024-11-01'),
('Cash', 50.00, '2024-11-02'),
('Online', 120.00, '2024-11-03'),
('Card', 200.00, '2024-11-04'),
('Cash', 75.00, '2024-11-05'),
('Online', 300.00, '2024-11-06'),
('Card', 150.00, '2024-11-07'),
('Cash', 80.00, '2024-11-08'),
('Online', 60.00, '2024-11-09'),
('Card', 90.00, '2024-11-10');

-- Insert data into Item
INSERT INTO Item (ItemName, ItemPrice, ItemType, ItemWeight)
VALUES
('Treadmill', 1500.00, 'Equipment', 200.00),
('Dumbbell Set', 200.00, 'Equipment', 30.00),
('Yoga Mat', 20.00, 'Product', 1.50),
('Kettlebell', 50.00, 'Equipment', 20.00),
('Resistance Band', 15.00, 'Product', 0.50),
('Bench Press', 1000.00, 'Equipment', 80.00),
('Pull-up Bar', 100.00, 'Equipment', 10.00),
('Protein Shake', 30.00, 'Product', 1.00),
('Foam Roller', 25.00, 'Product', 0.75),
('Skipping Rope', 10.00, 'Product', 0.20);

-- Insert data into Owns_Item
INSERT INTO Owns_Item (BranchID, ItemID, Status)
VALUES
(1, 1, 'Available'),
(2, 2, 'In Use'),
(3, 3, 'Available'),
(4, 4, 'In Use'),
(5, 5, 'Available'),
(1, 6, 'Available'),
(2, 7, 'In Use'),
(3, 8, 'Available'),
(4, 9, 'In Use'),
(5, 10, 'Available');

-- Insert data into Equipment
INSERT INTO Equipment (EItemID, ServiceDate)
VALUES
(1, '2024-10-01'),
(2, '2024-10-05'),
(4, '2024-10-10'),
(6, '2024-10-15'),
(7, '2024-10-20'),
(3, '2024-10-25'), 
(5, '2024-10-30'),  
(8, '2024-11-01'),  
(9, '2024-11-05'),  
(10, '2024-11-10');

-- Insert data into Product
INSERT INTO Product (PItemID, Colors)
VALUES
(3, 'Blue, Black'),      
(5, 'Red, Yellow'),       
(8, 'Chocolate, Vanilla'),
(9, 'Green'),             
(10, 'Yellow'); 

-- Insert data into OrderTable
INSERT INTO OrderTable (CPersonID, PaymentID, PItemID, OrderDate, Quantity)
VALUES
(1, 1, 3, '2024-11-01', 2),
(3, 2, 5, '2024-11-02', 1),
(5, 3, 8, '2024-11-03', 1),
(7, 4, 9, '2024-11-04', 3),
(9, 5, 10, '2024-11-05', 2),
(6, 6, 3, '2024-11-06', 4),
(8, 7, 5, '2024-11-07', 1),
(10, 8, 8, '2024-11-08', 3),
(2, 9, 9, '2024-11-09', 2),
(4, 10, 10, '2024-11-10', 1);

