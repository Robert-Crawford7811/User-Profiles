--Create a table
CREATE TABLE PERSONAL_INFO_02(
PID INT PRIMARY KEY,
Birthdate DATE,
SUBJECT VARCHAR(50),
CREDITS INT
);

--Insert information into Personal Info
INSERT INTO PERSONAL_INFO_02(PID, Birthdate, SUBJECT, CREDITS) VALUES (1, TO_DATE('2001-05-15','YYYY-MM-DD'), 'ART', 90);
INSERT INTO PERSONAL_INFO_02(PID, Birthdate, SUBJECT, CREDITS) VALUES (2, TO_DATE('2002-07-02', 'YYYY-MM-DD'), 'MATH', 80);
INSERT INTO PERSONAL_INFO_02(PID, Birthdate, SUBJECT, CREDITS) VALUES (3, TO_DATE('2031-01-11','YYYY-MM-DD'), 'ART', 90);

--Query for the table
SELECT * FROM PERSONAL_INFO_02;

-- Display User1Data Table
SELECT * FROM USER1DATA;
