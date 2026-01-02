@echo off
REM Database Setup Helper Script
REM This script helps set up the MySQL database

echo.
echo ========================================
echo   MySQL Database Setup
echo   Student Management System
echo ========================================
echo.

echo This script will help you set up the database.
echo.
echo Prerequisites:
echo   - MySQL Server must be installed and running
echo   - You need to know your MySQL root password
echo.

set /p continue="Continue with setup? (Y/N): "
if /i not "%continue%"=="Y" (
    echo Setup cancelled.
    pause
    exit /b 0
)

echo.
echo ----------------------------------------
echo Step 1: MySQL Login
echo ----------------------------------------
echo.

set /p mysql_user="Enter MySQL username (default: root): "
if "%mysql_user%"=="" set mysql_user=root

echo.
echo Connecting to MySQL as '%mysql_user%'...
echo You will be prompted for your MySQL password.
echo.
echo After logging in, run this command:
echo   source %~dp0database\schema.sql
echo.
echo Or execute:
echo   mysql -u %mysql_user% -p ^< "%~dp0database\schema.sql"
echo.

pause
echo.
echo Opening MySQL...
mysql -u %mysql_user% -p

echo.
echo ----------------------------------------
echo Step 2: Verify Database Creation
echo ----------------------------------------
echo.

echo Run these commands in MySQL to verify:
echo.
echo   SHOW DATABASES;
echo   USE student_ms;
echo   SHOW TABLES;
echo   SELECT * FROM students;
echo.

pause

echo.
echo ----------------------------------------
echo Step 3: Update Application Password
echo ----------------------------------------
echo.

echo Now update the password in Java code:
echo.
echo File: src\main\java\com\college\sms\util\DBConnection.java
echo Line 14: private static final String PASSWORD = "your_password_here";
echo.

pause

echo.
echo ========================================
echo   Setup Complete!
echo ========================================
echo.
echo Next steps:
echo   1. Update password in DBConnection.java
echo   2. Run: run.bat
echo   OR
echo   3. Run: mvn exec:java -Dexec.mainClass="com.college.sms.Main"
echo.

pause
