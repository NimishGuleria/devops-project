@echo off
REM Student Management System - Quick Run Script
REM This script makes it easy to run the application

echo.
echo ========================================
echo   Student Management System
echo   Quick Run Script
echo ========================================
echo.

cd /d "%~dp0"

echo [1/3] Checking if project is compiled...
if not exist "target\classes\com\college\sms\Main.class" (
    echo [!] Project not compiled. Compiling now...
    call mvn clean compile
    if errorlevel 1 (
        echo [X] Compilation failed! Please fix errors.
        pause
        exit /b 1
    )
    echo [✓] Compilation successful!
) else (
    echo [✓] Project already compiled!
)

echo.
echo [2/3] Testing database connection...
echo      (If this fails, update password in DBConnection.java)
echo.
call mvn exec:java -Dexec.mainClass="com.college.sms.util.DBConnection" -q
if errorlevel 1 (
    echo.
    echo [!] Database connection failed!
    echo.
    echo Please check:
    echo   1. MySQL server is running
    echo   2. Database 'student_ms' exists (run database/schema.sql)
    echo   3. Password in src/main/java/com/college/sms/util/DBConnection.java is correct
    echo.
    pause
    exit /b 1
)

echo.
echo [3/3] Starting application...
echo.
echo ========================================
echo.

call mvn exec:java -Dexec.mainClass="com.college.sms.Main"

echo.
echo ========================================
echo   Application Closed
echo ========================================
echo.
pause
