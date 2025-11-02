# 🏥 Hospital Management System  

![Python](https://img.shields.io/badge/Python-3.x-blue)  
![MySQL](https://img.shields.io/badge/Database-MySQL-orange)  
![DBMS](https://img.shields.io/badge/Concepts-ER%20Model%2C%20Normalization%2C%20Codd's%20Rules-green)  
![Status](https://img.shields.io/badge/Project-Academic-lightgrey)  

> A structured mini-project built to demonstrate **Database Management System (DBMS)** and **MySQL** concepts through a real-world hospital management scenario.

---

## 📘 Overview  

The **Hospital Management System (HMS)** is a database-backed mini project designed to simplify hospital data management and demonstrate key **DBMS** and **MySQL** concepts.  
It efficiently handles **patient records**, **doctor details**, **appointments**, **prescriptions**, and **billing** through a centralized system.  

> 🎯 *Goal:* To provide an easy-to-manage database-driven solution that reflects real-world healthcare operations and helps understand relational database principles.

---

## ✨ Features  

- 👨‍⚕️ Doctor & Patient Registration  
- 📅 Appointment Scheduling  
- 💊 Prescription & Medicine Management  
- 💰 Billing & Payment Tracking  
- 🗄️ Centralized MySQL Database  
- 🔐 Role-Based Access *(optional extension)*  

---

## 🧰 Tech Stack  

| Layer | Technology Used |
|:------|:----------------|
| **Frontend** | HTML, CSS *(optional)* |
| **Backend** | Python *(Flask / Tkinter / CLI)* |
| **Database** | MySQL |
| **Concepts Used** | ER Model, Normalization, Relational Model, Codd’s Rules |

---

## 🧱 System Architecture

```mermaid
graph TD
    UI[User Interface (Frontend)]
    APP[Application Layer (Python Backend)]
    DB[Database Layer (MySQL)]
    AUTH[Auth & Validation]
    MODS[Modules: Appointments, Billing, Patients]

    UI --> APP
    APP --> AUTH
    APP --> MODS
    APP --> DB
🧩 Database Design
The database follows 3NF normalization and referential integrity principles to ensure data consistency and minimal redundancy.

Key Tables:
patients – stores patient details

doctors – maintains doctor profiles and specializations

appointments – tracks appointment scheduling and timing

prescriptions – links medicines with patient treatment

billing – records payments, costs, and receipts

Concepts Implemented:
✅ ER Modeling
✅ Primary & Foreign Keys
✅ Normalization (up to 3NF)
✅ SQL Joins and Constraints

🧠 Sample ER Diagram
mermaid
Copy code
erDiagram
    PATIENT ||--o{ APPOINTMENT : books
    DOCTOR ||--o{ APPOINTMENT : attends
    PATIENT ||--o{ PRESCRIPTION : receives
    PRESCRIPTION ||--|{ MEDICINE : includes
    PATIENT ||--o{ BILLING : billed

    PATIENT {
        int patient_id PK
        string name
        string contact
        string gender
    }

    DOCTOR {
        int doctor_id PK
        string name
        string specialization
    }

    APPOINTMENT {
        int appointment_id PK
        int doctor_id FK
        int patient_id FK
        date appointment_date
    }

    PRESCRIPTION {
        int prescription_id PK
        int patient_id FK
        string diagnosis
    }

    BILLING {
        int bill_id PK
        int patient_id FK
        float total_amount
    }
🚀 How to Run
1️⃣ Clone the Repository
bash
Copy code
git clone https://github.com/ojasviborkar/Hospital-Management-System.git
cd Hospital-Management-System
2️⃣ Set Up the Database
Open MySQL Workbench or Command Line.

Create a database named hospital_db.

Import your SQL schema file (if available):

sql
Copy code
SOURCE hospital_db.sql;
3️⃣ Install Dependencies
bash
Copy code
pip install mysql-connector-python
pip install flask
4️⃣ Run the Application
bash
Copy code
python app.py
5️⃣ Access the System
Open your browser and visit:
👉 http://localhost:5000

👨‍💻 Team Members
Name	Role
Ojasvi Borkar	Database Design & Documentation
Piyush Dhane	Backend Development
Sushant Dhawanjewar	Frontend / Integration
Sharwari Dhopte	Testing & Validation

🌟 Future Enhancements
Integration with QR-based patient ID

Login authentication system for doctors & admin

Email/SMS appointment reminders

Data visualization dashboard using Python libraries

🧾 License
This project is created for academic learning purposes.
Feel free to modify, enhance, and extend it for educational or research use.