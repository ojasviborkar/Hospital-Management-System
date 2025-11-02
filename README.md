# 🏥 Hospital Management System

## 📘 Introduction
The **Hospital Management System (HMS)** is designed to efficiently manage hospital operations such as patient registration, doctor appointments, billing, and record maintenance. It ensures smooth communication between patients, doctors, and administrative staff through a centralized database.

---

## 🚀 Need for Database Management System
In hospitals, manual record keeping is inefficient and error-prone. A **Database Management System (DBMS)** helps in:
- Storing patient, doctor, and staff data securely
- Avoiding duplication of records
- Enabling quick data retrieval and updates
- Maintaining data consistency and integrity

---

## 🏗️ System Architecture
The HMS follows a **3-tier architecture**:

1. **Presentation Layer (Frontend):**  
   - Interface for patients, doctors, and staff.  
   - Built using HTML, CSS, JavaScript.

2. **Application Layer (Backend):**  
   - Handles logic for login, registration, appointments, billing, etc.  
   - Developed using PHP / Python / Java (based on your implementation).

3. **Database Layer:**  
   - Stores all hospital-related data.  
   - Implemented using **MySQL / PostgreSQL**.

---

## 🗃️ Database Design
The database consists of multiple interconnected tables:

### **Main Entities:**
- **Patient** (`patient_id`, `name`, `age`, `gender`, `contact`, `address`)
- **Doctor** (`doctor_id`, `name`, `specialization`, `contact`, `availability`)
- **Appointment** (`appointment_id`, `patient_id`, `doctor_id`, `date`, `time`, `status`)
- **Billing** (`bill_id`, `patient_id`, `amount`, `date`, `payment_status`)
- **Staff** (`staff_id`, `name`, `designation`, `contact`)

### **ER Diagram Overview:**
- A **patient** can book multiple **appointments**.  
- Each **appointment** is associated with one **doctor**.  
- **Billing** is linked to **patients** after consultations.

---

## ⚙️ Features
✅ Patient registration and management  
✅ Doctor scheduling and specialization tracking  
✅ Appointment booking and updates  
✅ Billing and report generation  
✅ Secure login for admin, doctor, and staff  
✅ Search and filter functionality  

---

## 🧩 Normalization
The database is normalized to **3rd Normal Form (3NF)** to:
- Eliminate redundancy  
- Ensure data integrity  
- Simplify maintenance and updates  

---

## 🧠 Future Enhancements
- Integration of AI-based diagnosis suggestions  
- Cloud database for scalability  
- Real-time notifications and SMS updates  
- Data analytics dashboard for hospital insights  

---

## 👥 Team Members
| **Member** | **Role** | **Main Responsibility** | **Deliverables** |
|:------------|:----------|:-------------------------|:------------------|
| **Ojasvi Borkar** | Project Lead & Integrator | Final Integration, ER + EER Diagram, SQL database creation, Report compilation | Final ER/EER Diagram, SQL setup, coordinated report |
| **Sharwari Dhopte** | Schema & Normalization Expert | Normalization (1NF → 4NF), Functional Dependencies, Minimal Cover | Normalization report + clean relational schema |
| **Sushant Dhawanjewar** | SQL & PL/SQL Developer | Writing SQL queries, joins, aggregate, triggers, procedures, functions | 10 SQL queries + 2 triggers + 2 procedures + 1 function |
| **Piyush Dhane** | Advanced DBMS + Documentation Expert | Transaction management, indexing, NoSQL, Data warehousing, final write-up | ACID, indexing examples, NoSQL/OLAP-OLTP explanation |

## 🧾 References
- Database System Concepts – Silberschatz, Korth  
- MySQL Documentation  
- W3Schools & GeeksforGeeks  

---

> 💡 *This Hospital Management System aims to simplify hospital workflows and create a reliable, secure digital healthcare environment.*
