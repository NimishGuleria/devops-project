# 🚀 Quick Setup Instructions

## ⚠️ IMPORTANT: Before Running the Application

### Step 1: Create MySQL Database

1. **Open MySQL Command Line** or **MySQL Workbench**

2. **Login to MySQL:**

   ```bash
   mysql -u root -p
   ```

   Enter your MySQL root password.

3. **Run the database setup script:**

   ```sql
   source C:/Users/mayan/Downloads/pushkar/student-management-system/database/schema.sql
   ```

   **OR manually execute in MySQL:**

   ```bash
   mysql -u root -p < C:/Users/mayan/Downloads/pushkar/student-management-system/database/schema.sql
   ```

4. **Verify database creation:**
   ```sql
   SHOW DATABASES;
   USE student_ms;
   SHOW TABLES;
   SELECT * FROM students;
   ```

### Step 2: Update Database Password

1. **Open the file:** `src/main/java/com/college/sms/util/DBConnection.java`

2. **Update line 14** with your MySQL password:
   ```java
   private static final String PASSWORD = "your_actual_mysql_password";
   ```

### Step 3: Test Database Connection

```bash
mvn exec:java -Dexec.mainClass="com.college.sms.util.DBConnection"
```

You should see:

```
✅ Database Connected Successfully!
Database: student_ms
Driver: MySQL Connector/J
```

### Step 4: Run the Application

```bash
mvn exec:java -Dexec.mainClass="com.college.sms.Main"
```

---

## 📋 Quick Commands Reference

```bash
# Navigate to project
cd C:\Users\mayan\Downloads\pushkar\student-management-system

# Compile project
mvn clean compile

# Run application
mvn exec:java -Dexec.mainClass="com.college.sms.Main"

# Test database connection
mvn exec:java -Dexec.mainClass="com.college.sms.util.DBConnection"

# Package as JAR
mvn clean package

# Run packaged JAR
java -cp target/student-management-system-1.0-SNAPSHOT.jar com.college.sms.Main
```

---

## 🎯 Default Login Credentials

- **Username:** admin
- **Password:** admin123
- **Role:** ADMIN

_(Currently stored in users table, not yet implemented in the application)_

---

## 📦 What's Included

✅ Complete Maven project structure  
✅ MySQL database schema with sample data  
✅ CRUD operations (Create, Read, Update, Delete)  
✅ DAO pattern implementation  
✅ Console-based user interface  
✅ Input validation and error handling  
✅ Git repository initialized  
✅ Comprehensive README.md

---

## 🐛 Troubleshooting

### Issue: "Connection Failed" error

**Solution:**

1. Make sure MySQL server is running
2. Update password in `DBConnection.java`
3. Verify database exists: `SHOW DATABASES;`
4. Check MySQL is running on port 3306

### Issue: "mvn command not found"

**Solution:**

- Maven is installed at: `C:\Users\mayan\AppData\Roaming\Code\User\globalStorage\pleiades.java-extension-pack-jdk\maven\latest`
- It should be working from VS Code terminal

### Issue: Compilation errors

**Solution:**

```bash
mvn clean install -U
```

---

## 📤 Sending Project to Friend

### Option 1: ZIP the project

```bash
# Navigate to parent folder
cd C:\Users\mayan\Downloads\pushkar

# Create a zip file (using PowerShell)
Compress-Archive -Path student-management-system -DestinationPath student-management-system.zip
```

### Option 2: Keep Git repository

The project already has Git initialized. Your friend can later:

```bash
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/username/repo.git
git push -u origin main
```

---

## 📞 Need Help?

Check the detailed README.md for:

- Complete feature list
- Database schema details
- Viva preparation questions
- Future enhancements

---

**Project Status:** ✅ Ready to Use!
