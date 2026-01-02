# 🎓 Student Management System

A comprehensive console-based **Student Information Management System** built using **Java**, **JDBC**, **MySQL**, and **Maven**. This project demonstrates core CRUD operations with a clean architecture using the DAO pattern.

[![Java](https://img.shields.io/badge/Java-8+-orange.svg)](https://www.oracle.com/java/)
[![Maven](https://img.shields.io/badge/Maven-3.6+-blue.svg)](https://maven.apache.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-Educational-green.svg)]()

---

## 📋 Table of Contents

- [Features](#-features)
- [Technologies Used](#-technologies-used)
- [Prerequisites](#-prerequisites)
- [Installation & Setup](#-installation--setup)
- [Project Structure](#-project-structure)
- [Database Schema](#-database-schema)
- [Usage](#-usage)
- [Maven Commands](#-maven-commands)
- [Viva Preparation](#-viva-preparation)
- [Future Enhancements](#-future-enhancements)
- [Contributing](#-contributing)
- [Author](#-author)
- [License](#-license)

---

## ✨ Features

- ✅ **Add New Student** - Register students with complete details
- ✅ **View All Students** - Display all students in a formatted table
- ✅ **Search Student** - Find students by roll number
- ✅ **Update Student** - Modify student information
- ✅ **Delete Student** - Remove student records with confirmation
- ✅ **View Statistics** - Display system statistics and recent additions
- ✅ **Database-driven** - All data stored in MySQL database
- ✅ **CRUD Operations** - Complete Create, Read, Update, Delete functionality
- ✅ **DAO Pattern** - Clean separation of concerns
- ✅ **Input Validation** - Robust error handling
- ✅ **User-Friendly Interface** - Intuitive console-based menu

---

## 🛠️ Technologies Used

| Technology | Version | Purpose                                  |
| ---------- | ------- | ---------------------------------------- |
| **Java**   | 8+      | Core Programming Language                |
| **MySQL**  | 8.0+    | Database Management                      |
| **JDBC**   | 8.0.33  | Database Connectivity                    |
| **Maven**  | 3.6+    | Build Automation & Dependency Management |
| **Git**    | 2.0+    | Version Control                          |

### Design Patterns & Concepts:

- **DAO (Data Access Object)** Pattern
- **MVC** Architecture (Model-View-Controller inspired)
- **Singleton** Pattern for Database Connection
- **JDBC** for Database Operations
- **PreparedStatement** for SQL Injection Prevention

---

## 📦 Prerequisites

Before running this project, ensure you have the following installed:

1. **Java JDK** (version 8 or higher)

   ```bash
   java -version
   ```

2. **Apache Maven** (version 3.6 or higher)

   ```bash
   mvn -version
   ```

3. **MySQL Server** (version 8.0 or higher)

   ```bash
   mysql --version
   ```

4. **Git** (for version control)
   ```bash
   git --version
   ```

---

## 🚀 Installation & Setup

### Step 1: Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/student-management-system.git
cd student-management-system
```

### Step 2: Create MySQL Database

Open MySQL command line or MySQL Workbench and run:

```bash
# Login to MySQL
mysql -u root -p

# Run the schema script
source database/schema.sql

# Or manually execute:
mysql -u root -p < database/schema.sql
```

This will:

- Create the `student_ms` database
- Create all required tables (students, courses, enrollments, users)
- Insert sample data for testing

### Step 3: Configure Database Connection

Open [src/main/java/com/college/sms/util/DBConnection.java](src/main/java/com/college/sms/util/DBConnection.java) and update:

```java
private static final String URL = "jdbc:mysql://localhost:3306/student_ms";
private static final String USER = "root";
private static final String PASSWORD = "your_mysql_password"; // ⚠️ CHANGE THIS
```

### Step 4: Build the Project

```bash
# Clean and install dependencies
mvn clean install
```

This will:

- Download MySQL Connector dependency
- Compile all Java files
- Run tests (if any)
- Package the application

### Step 5: Test Database Connection

```bash
# Test if database connection works
mvn exec:java -Dexec.mainClass="com.college.sms.util.DBConnection"
```

You should see: `✅ Database Connected Successfully!`

### Step 6: Run the Application

```bash
mvn exec:java -Dexec.mainClass="com.college.sms.Main"
```

---

## 📁 Project Structure

```
student-management-system/
│
├── src/
│   ├── main/
│   │   └── java/com/college/sms/
│   │       ├── model/              # Entity classes
│   │       │   └── Student.java    # Student entity
│   │       │
│   │       ├── dao/                # Data Access Objects
│   │       │   └── StudentDAO.java # Student database operations
│   │       │
│   │       ├── util/               # Utility classes
│   │       │   └── DBConnection.java # Database connection manager
│   │       │
│   │       └── Main.java           # Application entry point
│   │
│   └── test/                       # Unit tests (optional)
│       └── java/com/college/sms/
│           └── AppTest.java
│
├── database/
│   └── schema.sql                  # Database schema & sample data
│
├── pom.xml                         # Maven configuration
├── .gitignore                      # Git ignore rules
└── README.md                       # This file
```

---

## 🗄️ Database Schema

### Students Table

```sql
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    roll_no VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(15),
    dob DATE,
    department VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Courses Table

```sql
CREATE TABLE courses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    department VARCHAR(50)
);
```

### Enrollments Table (Many-to-Many Relationship)

```sql
CREATE TABLE enrollments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    semester VARCHAR(10),
    enroll_date DATE,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE
);
```

---

## 💻 Usage

### Main Menu Options

```
════════════════ MAIN MENU ════════════════
  1. ➕ Add New Student
  2. 📋 View All Students
  3. 🔍 Search Student by Roll No
  4. ✏️  Update Student Details
  5. 🗑️  Delete Student
  6. 📊 View Statistics
  7. 🚪 Exit
═══════════════════════════════════════════
```

### Example Operations

#### Adding a Student

```
Enter Roll Number: CS2025001
Enter Name: John Doe
Enter Email: john.doe@college.edu
Enter Phone: 9876543210
Enter Date of Birth (YYYY-MM-DD): 2003-08-15
Enter Department: Computer Science

✅ Student added successfully!
```

#### Searching a Student

```
🔍 Enter Roll Number to search: CS2025001

✅ Student Found:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  ID          : 5
  Roll No     : CS2025001
  Name        : John Doe
  Email       : john.doe@college.edu
  Phone       : 9876543210
  DOB         : 2003-08-15
  Department  : Computer Science
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 📦 Maven Commands

### Essential Commands

```bash
# Clean the project (remove target/ folder)
mvn clean

# Compile the source code
mvn compile

# Run tests
mvn test

# Package into JAR file
mvn package

# Install to local Maven repository
mvn install

# Clean and compile
mvn clean compile

# Clean and install
mvn clean install

# Run the application
mvn exec:java -Dexec.mainClass="com.college.sms.Main"

# Run tests only
mvn test

# Skip tests during build
mvn clean install -DskipTests

# Generate project documentation
mvn site

# Check for dependency updates
mvn versions:display-dependency-updates
```

### Creating Executable JAR

```bash
# Package the application
mvn clean package

# Run the generated JAR
java -jar target/student-management-system-1.0-SNAPSHOT.jar
```

---

## 🎓 Viva Preparation

### Frequently Asked Questions

#### 1. **Why did you use Maven?**

**Answer:** Maven automates the build process, manages dependencies (like MySQL Connector), provides a standard project structure, and simplifies project lifecycle management. It eliminates the need to manually download and configure libraries.

#### 2. **What is JDBC and why is it important?**

**Answer:** JDBC (Java Database Connectivity) is a standard Java API that provides methods to connect Java applications with databases. It allows us to execute SQL queries, retrieve results, and perform database operations in a platform-independent way.

#### 3. **Explain the DAO Pattern used in your project.**

**Answer:** DAO (Data Access Object) pattern separates business logic from database operations. In our project:

- **Model** (Student.java) - Represents data
- **DAO** (StudentDAO.java) - Handles database operations
- **Main** (Main.java) - Handles user interaction

This makes code more maintainable, testable, and follows separation of concerns.

#### 4. **What is the difference between Statement and PreparedStatement?**

**Answer:**

- **Statement**: Used for static SQL, vulnerable to SQL injection
- **PreparedStatement**: Precompiled, prevents SQL injection, better performance for repeated queries, supports parameterized queries

Example:

```java
// Vulnerable to SQL injection
Statement stmt = conn.createStatement();
stmt.executeQuery("SELECT * FROM students WHERE roll_no = '" + rollNo + "'");

// Safe from SQL injection
PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM students WHERE roll_no = ?");
pstmt.setString(1, rollNo);
```

#### 5. **What does pom.xml contain?**

**Answer:** pom.xml (Project Object Model) is Maven's configuration file. It contains:

- Project metadata (groupId, artifactId, version)
- Dependencies (MySQL connector)
- Plugins (compiler, build tools)
- Build configurations
- Java version settings

#### 6. **Explain your project workflow.**

**Answer:**

1. User selects option from console menu (Main.java)
2. Input is captured and validated
3. Student object is created from the input
4. DAO method is called with the Student object
5. DAO uses JDBC to connect to database via DBConnection
6. SQL query is executed using PreparedStatement
7. Results are returned to Main.java
8. Results are formatted and displayed to user

#### 7. **What is a Foreign Key and why did you use it?**

**Answer:** A Foreign Key establishes a relationship between two tables. In the enrollments table, `student_id` and `course_id` are foreign keys that reference the students and courses tables. This ensures referential integrity - we can't enroll a student who doesn't exist.

#### 8. **How do you prevent SQL Injection?**

**Answer:** By using PreparedStatement instead of Statement. PreparedStatement uses parameterized queries where user input is treated as data, not executable code.

#### 9. **What is Connection Pooling? (Advanced)**

**Answer:** Connection Pooling maintains a cache of database connections that can be reused. Instead of creating a new connection for each request, we reuse existing ones, improving performance. (Note: This project doesn't implement it, but it's a good topic to mention for enhancement.)

#### 10. **What challenges did you face?**

**Answer:**

- Setting up database connection initially
- Handling date format conversions between Java (LocalDate) and SQL (Date)
- Implementing proper error handling
- Ensuring proper resource cleanup (using try-with-resources)

---

## 🚀 Future Enhancements

- [ ] **Course Management Module** - Add CRUD operations for courses
- [ ] **Enrollment Management** - Link students to courses
- [ ] **User Authentication** - Login system with role-based access
- [ ] **Report Generation** - Generate PDF/Excel reports
- [ ] **GUI Interface** - JavaFX or Swing interface
- [ ] **Input Validation** - Email format, phone number validation
- [ ] **Search Filters** - Search by name, department, date range
- [ ] **Pagination** - For large datasets
- [ ] **RESTful API** - Convert to Spring Boot REST API
- [ ] **Unit Testing** - JUnit test cases for DAO methods
- [ ] **Connection Pooling** - Using HikariCP or Apache DBCP
- [ ] **Password Hashing** - Using BCrypt for secure passwords
- [ ] **Logging** - Using Log4j or SLF4J
- [ ] **Docker Support** - Containerize the application

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 👨‍💻 Author

**Your Name**

- Roll No: YOUR_ROLL_NO
- Department: Computer Science Engineering
- College: YOUR_COLLEGE_NAME
- Email: your.email@college.edu
- GitHub: [@YOUR_USERNAME](https://github.com/YOUR_USERNAME)
- LinkedIn: [Your Name](https://linkedin.com/in/yourprofile)

---

## 📄 License

This project is created for **educational purposes** as part of college curriculum.

---

## 🙏 Acknowledgments

- Thanks to my college professors for guidance
- MySQL documentation
- Maven documentation
- Stack Overflow community

---

## 📞 Support

For support, email your.email@college.edu or create an issue in this repository.

---

## ⭐ Show your support

Give a ⭐️ if this project helped you!

---

**Made with ❤️ and ☕ by [Your Name]**
