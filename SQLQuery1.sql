ALTER TABLE Users
ADD Textbooks INT;

INSERT INTO EduShare_db(UserID, FullName, Email)
SELECT StudentID, FullName, Email
FROM Users
WHERE GraduationYear < 2024;

UPDATE Students
SET Age = Age + 1
WHERE Birthday = CAST(GETDATE() AS DATE);

BEGIN TRANSACTION;
-- migration SQL here
COMMIT;

ROLLBACK;