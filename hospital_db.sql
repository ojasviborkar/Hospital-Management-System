-- -----------------------------------------------------
-- HOSPITAL MANAGEMENT SYSTEM DATABASE
-- ----------------------------------

-- -----------------------------------------------------
-- 1️⃣ DATABASE CREATION
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS hospital_management;
USE hospital_management;

-- -----------------------------------------------------
-- 2️⃣ PATIENTS TABLE
-- -----------------------------------------------------
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0),
    gender ENUM('Male', 'Female', 'Other'),
    contact VARCHAR(15) UNIQUE,
    address VARCHAR(255),
    date_of_admission DATE
);

-- Sample Data
INSERT INTO patients (name, age, gender, contact, address, date_of_admission)
VALUES 
('Ravi Sharma', 45, 'Male', '9876543210', 'Pune', '2025-11-01'),
('Aarav Patel', 32, 'Male', '9876501234', 'Mumbai', '2025-11-02'),
('Sneha Iyer', 29, 'Female', '9998877665', 'Nashik', '2025-11-03');

-- -----------------------------------------------------
-- 3️⃣ DOCTORS TABLE
-- -----------------------------------------------------
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    contact VARCHAR(15) UNIQUE,
    experience INT CHECK (experience >= 0),
    salary DECIMAL(10,2) CHECK (salary > 0)
);

-- Sample Data
INSERT INTO doctors (name, specialization, contact, experience, salary)
VALUES
('Dr. Priya Nair', 'Cardiologist', '9812345678', 10, 80000.00),
('Dr. Rohan Mehta', 'Dermatologist', '9876504321', 5, 55000.00),
('Dr. Kavita Joshi', 'Pathologist', '9823456712', 8, 60000.00);

-- -----------------------------------------------------
-- 4️⃣ APPOINTMENTS TABLE
-- -----------------------------------------------------
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    reason VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id) ON DELETE CASCADE
);

-- Sample Data
INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason)
VALUES
(1, 1, '2025-11-02', 'Routine Checkup'),
(2, 2, '2025-11-03', 'Skin Allergy'),
(3, 3, '2025-11-04', 'Blood Test');

-- -----------------------------------------------------
-- 5️⃣ BILLING TABLE
-- -----------------------------------------------------
CREATE TABLE billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    total_amount DECIMAL(10,2) CHECK (total_amount > 0),
    payment_status ENUM('Pending', 'Paid', 'Partially Paid') DEFAULT 'Pending',
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE
);

-- Sample Data
INSERT INTO billing (patient_id, total_amount, payment_status, payment_date)
VALUES
(1, 5000.00, 'Paid', '2025-11-03'),
(2, 3500.00, 'Partially Paid', '2025-11-03'),
(3, 2000.00, 'Pending', NULL);

-- -----------------------------------------------------
-- 6️⃣ STAFF TABLE
-- -----------------------------------------------------
CREATE TABLE staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role ENUM('Nurse', 'Receptionist', 'Technician', 'Pharmacist', 'Cleaner', 'Other') NOT NULL,
    contact VARCHAR(15) UNIQUE,
    shift_time ENUM('Morning', 'Evening', 'Night') NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0)
);

-- Sample Data
INSERT INTO staff (name, role, contact, shift_time, salary)
VALUES
('Riya Sen', 'Nurse', '9823456789', 'Morning', 25000.00),
('Amit Deshmukh', 'Technician', '9876543211', 'Evening', 30000.00),
('Sneha Patil', 'Receptionist', '9988776644', 'Morning', 22000.00);

-- -----------------------------------------------------
-- 7️⃣ LAB TESTS TABLE
-- -----------------------------------------------------
CREATE TABLE lab_tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    test_name VARCHAR(100) NOT NULL,
    test_cost DECIMAL(10,2) CHECK (test_cost > 0),
    normal_range VARCHAR(50),
    unit VARCHAR(20)
);

-- Sample Data
INSERT INTO lab_tests (test_name, test_cost, normal_range, unit)
VALUES
('Blood Sugar', 150.00, '70-110', 'mg/dL'),
('Hemoglobin', 200.00, '12-16', 'g/dL'),
('Cholesterol', 300.00, '<200', 'mg/dL');

-- -----------------------------------------------------
-- 8️⃣ LAB REPORTS TABLE
-- -----------------------------------------------------
CREATE TABLE lab_reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    test_id INT,
    test_date DATE,
    result_value DECIMAL(10,2),
    remarks VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (test_id) REFERENCES lab_tests(test_id) ON DELETE CASCADE
);

-- Sample Data
INSERT INTO lab_reports (patient_id, test_id, test_date, result_value, remarks)
VALUES
(1, 1, '2025-11-03', 95.00, 'Normal'),
(2, 2, '2025-11-03', 13.50, 'Slightly low'),
(3, 3, '2025-11-03', 180.00, 'Normal');

-- -----------------------------------------------------
-- 9️⃣ LAB SUMMARY VIEW
-- -----------------------------------------------------
CREATE OR REPLACE VIEW lab_summary AS
SELECT 
    p.name AS Patient,
    l.test_name AS Test,
    lr.test_date,
    lr.result_value,
    l.unit,
    lr.remarks
FROM lab_reports lr
JOIN patients p ON lr.patient_id = p.patient_id
JOIN lab_tests l ON lr.test_id = l.test_id;

-- -----------------------------------------------------
-- 🔟 SAMPLE QUERY TO TEST VIEW
-- -----------------------------------------------------
SELECT * FROM lab_summary;

-- -----------------------------------------------------
-- ✅ END OF SCRIPT
-- -----------------------------------------------------
