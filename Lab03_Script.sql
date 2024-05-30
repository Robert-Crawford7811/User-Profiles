-- Creating the profile that allows user to make a connection within password and session limitations
CREATE PROFILE ROBERTCRAWFORD
    LIMIT   
        FAILED_LOGIN_ATTEMPTS 4
        PASSWORD_LIFE_TIME 120
        PASSWORD_LOCK_TIME 1/24
        PASSWORD_REUSE_MAX 3
        PASSWORD_VERIFY_FUNCTION ora12c_verify_function
        SESSIONS_PER_USER 3;

-- Query check to verify the profile has been created
SELECT * FROM DBA_PROFILES WHERE PROFILE = 'ROBERTCRAWFORD';

-- Creating user 1 using the "ROBERTCRAWFORD" profile
CREATE USER U1ROBERTCRAWFORD
    IDENTIFIED BY password_01
    DEFAULT TABLESPACE Users
    TEMPORARY TABLESPACE temp
    QUOTA 30M ON Users
    PROFILE ROBERTCRAWFORD
    ACCOUNT LOCK
    PASSWORD EXPIRE;
    
-- Creating user 2 using the "ROBERTCRAWFORD" profile
CREATE USER U2ROBERTCRAWFORD
    IDENTIFIED BY password_02
    DEFAULT TABLESPACE Users
    TEMPORARY TABLESPACE temp
    QUOTA 30M ON Users
    PROFILE ROBERTCRAWFORD
    ACCOUNT LOCK
    PASSWORD EXPIRE;
    
-- Create role to be able to connect to database and create tables and grant role required permissions
CREATE ROLE R1ROBERTCRAWFORD;
GRANT CREATE SESSION, CREATE TABLE TO R1ROBERTCRAWFORD;

--Give Roles to the users
GRANT R1ROBERTCRAWFORD TO U1ROBERTCRAWFORD,U2ROBERTCRAWFORD;

-- Create User1Data Table
CREATE TABLE USER1DATA(
    UserID INT PRIMARY KEY,
    Column1 VARCHAR(50),
    Column2 INT,
    Column3 DATE
);

--Insert records into User1Data
INSERT INTO USER1DATA(UserID, Column1, Column2, Column3) VALUES (1, 'Data1', 50, TO_DATE('2020-05-15','YYYY-MM-DD'));
INSERT INTO USER1DATA(UserID, Column1, Column2, Column3) VALUES (2, 'Data2', 51, TO_DATE('2019-08-20','YYYY-MM-DD'));
INSERT INTO USER1DATA(UserID, Column1, Column2, Column3) VALUES (3, 'Data3', 52, TO_DATE('2021-08-10','YYYY-MM-DD'));

-- Create User 2 Data Table
CREATE TABLE USER2DATA (
   UserID INT PRIMARY KEY,
    Column1 VARCHAR(50),
    Column2 INT,
    Column3 DATE
);

-- Insert records into User2Data
INSERT INTO USER2DATA(UserID, Column1, Column2, Column3) VALUES (4, 'Data4', 53, TO_DATE('2018-05-12','YYYY-MM-DD'));
INSERT INTO USER2DATA(UserID, Column1, Column2, Column3) VALUES (5, 'Data5', 54, TO_DATE('2017-03-24', 'YYYY-MM-DD'));
INSERT INTO USER2DATA(UserID, Column1, Column2, Column3) VALUES (6, 'Data6', 55, TO_DATE('2019-06-25','YYYY-MM-DD')); 

-- Grant select and insert privileges of User1Data to User1
GRANT SELECT, INSERT ON USER1DATA TO U1ROBERTCRAWFORD;

-- Grant select privileges on User1Data and User2Data to User2
GRANT SELECT, INSERT ON USER1DATA TO U2ROBERTCRAWFORD;
GRANT SELECT, INSERT ON USER2DATA TO U2ROBERTCRAWFORD;

