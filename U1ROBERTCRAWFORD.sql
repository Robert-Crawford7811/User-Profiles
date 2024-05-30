--Create a table
CREATE TABLE PERSONAL_INFO(
PID INT PRIMARY KEY,
Birthdate DATE,
SUBJECT VARCHAR(50),
CREDITS INT
);

--Insert information into Personal Info
INSERT INTO PERSONAL_INFO(PID, Birthdate, SUBJECT, CREDITS) VALUES (1, TO_DATE('2001-05-15','YYYY-MM-DD'), 'ART', 90);
INSERT INTO PERSONAL_INFO(PID, Birthdate, SUBJECT, CREDITS) VALUES (2, TO_DATE('2002-07-02', 'YYYY-MM-DD'), 'MATH', 80);
INSERT INTO PERSONAL_INFO(PID, Birthdate, SUBJECT, CREDITS) VALUES (3, TO_DATE('2031-01-11','YYYY-MM-DD'), 'ART', 90);

--Display the table
SELECT * FROM PERSONAL_INFO;

--Display User 2's Table
SELECT * FROM PERSONAL_INFO_02;

--Insert Data into User 1 Data tables and display the information
INSERT INTO USER1DATA(UserID, Column1, Column2, Column3) VALUES (4, 'Data4', 53, TO_DATE('2020-01-11','YYYY-MM-DD'));
INSERT INTO USER1DATA(UserID, Column1, Column2, Column3) VALUES (5, 'Data5', 54, TO_DATE('2020-01-12','YYYY-MM-DD'));
INSERT INTO USER1DATA(UserID, Column1, Column2, Column3) VALUES (6, 'Data6', 55, TO_DATE('2020-01-13','YYYY-MM-DD'));

--Display user1data table
SELECT * FROM USER1DATA;

-- Display User2Data Table
SELECT * FROM USER2DATA;