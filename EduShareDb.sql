CREATE DATABASE EduShare_db;
GO

USE EduShare_db;
GO

CREATE TABLE Users(
	User_ID INT PRIMARY KEY IDENTITY(100,1),
	FullName VARCHAR(100) NOT NULL, 
	Email VARCHAR(100),
	Password VARCHAR(255) NOT NULL,
	StartDate DATE,
	ReturnDate DATE
);
 

-- Textbooks Table
CREATE TABLE Textbooks(
	Textbook_ID INT PRIMARY KEY IDENTITY(100,1),
	Title VARCHAR(100) NOT NULL,
	Author VARCHAR(100) NOT NULL,
	ISBN CHAR(13)NOT NULL UNIQUE,
	Condition VARCHAR(20)NOT NULL,
	Price DECIMAL(10,2) NOT NULL,
	Campus VARCHAR (100) NOT NULL,
	Image VARBINARY(MAX) NULL,
	User_ID INT
	CONSTRAINT FK_Textbooks_Users FOREIGN KEY (User_ID)
	REFERENCES Users(User_ID)
	ON DELETE CASCADE
	ON UPDATE NO ACTION
);

-- Wanted Ads Table
CREATE TABLE Wanted_Ads(
	Wanted_Ads_ID INT PRIMARY KEY IDENTITY(100,1),
	Textbook_ID INT,
	CONSTRAINT FK_Wanted_Ads_Textbooks FOREIGN KEY (Textbook_ID) REFERENCES Textbooks(Textbook_ID)
	ON DELETE CASCADE
	ON UPDATE SET DEFAULT
);

-- Offers Table
CREATE TABLE Offers(
	Offer_ID INT PRIMARY KEY IDENTITY(120,2),
	Textbook_ID INT,
	Wanted_Ad_ID INT,
	CONSTRAINT FK_Offers_Textbooks FOREIGN KEY (Textbook_ID) REFERENCES Textbooks(Textbook_ID)
	ON DELETE CASCADE
	ON UPDATE SET DEFAULT
);
-- Transactions Table
CREATE TABLE Transactions(
	Transaction_ID INT PRIMARY KEY IDENTITY(100,1),
	User_ID INT,
	Textbook_ID INT,
	CONSTRAINT FK_Transactions_Users FOREIGN KEY (User_ID)  REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT FK_Transactions_Textbooks FOREIGN KEY (Textbook_ID) REFERENCES Textbooks(Textbook_ID) ON DELETE CASCADE ON UPDATE NO ACTION
);

-- Currencies Table
CREATE TABLE Currencies(
    Currency_ID INT PRIMARY KEY IDENTITY(100,1),
	CurrencyCode CHAR(3) NOT NULL UNIQUE,
	CurrencyName  VARCHAR(50) NOT NULL,
	Symbol VARCHAR(10)NOT NULL,
	ExchangeRate DECIMAL(20,5) NOT NULL,
    User_ID INT,
    Textbook_ID INT,
    Transaction_ID INT,
    CONSTRAINT FK_Currencies_Users FOREIGN KEY (User_ID)  REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE NO ACTION,
    CONSTRAINT FK_Currencies_Textbooks FOREIGN KEY (Textbook_ID)   REFERENCES Textbooks(Textbook_ID)  ON DELETE CASCADE  ON UPDATE NO ACTION,
    CONSTRAINT FK_Currencies_Transactions FOREIGN KEY (Transaction_ID)   REFERENCES Transactions(Transaction_ID) ON DELETE CASCADE  ON UPDATE NO ACTION
);

-- Reviews Table
CREATE TABLE Reviews(
	Review_ID INT PRIMARY KEY IDENTITY(100,1),
	User_ID INT,
	Textbook_ID INT,
	CONSTRAINT FK_Reviews_Users FOREIGN KEY (User_ID)  REFERENCES Users(User_ID) ON DELETE CASCADE ON UPDATE NO ACTION,
	CONSTRAINT FK_Reviews_Textbooks FOREIGN KEY (Textbook_ID) REFERENCES Textbooks(Textbook_ID) ON DELETE CASCADE ON UPDATE NO ACTION
);


SET IDENTITY_INSERT USERS ON;

INSERT INTO Users(FullName, Email, Password, StartDate, ReturnDate)
VALUES
('John  Conners', '25302276@stadio.ac.za','*********', '2024-02-18', '2024-06-21'),
('Sanele Ndlovu', '25302276@stadio.ac.za', '*********', '2024-01-21', ' 2024-12-12'),
('Pholile Sambo', '25302276@stadio.ac.za', '*********', '2024-01-21', '2025-01-21'),
('Kgalalelo  Leburu','25302276@stadio.ac.za' , '*********', '2024-01-21', '2025-06-16'),
('Isla Moore', '25302276@stadio.ac.za', '*********',  '2024-01-26', '2024-07-05');


SET IDENTITY_INSERT USERS OFF;

SET IDENTITY_INSERT TEXTBOOKS ON;

INSERT INTO Textbooks(Title, Author, ISBN, Condition, Price, Campus, Image, User_ID)
VALUES
 ('Computer Science', 'Douglas Crockford', '979-8-886-45174-0' , 'Good', ('2009.99'), 'South Campus','Null', '100'),
 ('Medicine', 'Noam Nisan', '979-8-886-35173-2' ,' New', ('1250.95'), 'Main Campus','Null','100'),
 ('MechanicalEngineering', 'Andrew Hunt', '979-8-688-45174-1' ,'Poor', ('879.90'), 'Main Campus','Null','100'),
 ('Commerce', 'carol Tavris', '979-8-886-43194-0','Good', ('1275.95'), 'South Campus','Null','100'),
 ('Law', 'Andrew Hunt', '979-8-698-45174-1' ,'Poor', ('839.90'), 'Main Campus','Null','100'),
 ('Bcom', 'carol Tavris', '979-8-806-43194-0','Good', ('1475.95'), 'South Campus','Null','100'),
 ('Interior Design', 'Alain de Botton', '979-8-186-589147-0',' New',('2450.90'), 'North Campus','Null', '100'),
 ('Applied Science', 'Alain de Botton', '979-8-286-589147-0',' New',('1550.90'), 'North Campus','Null', '100');
 


 SET IDENTITY_INSERT TEXTBOOKS OFF;

 SET IDENTITY_INSERT CURRENCIES ON;

 INSERT INTO Currencies(CurrencyCode, CurrencyName, Symbol, ExchangeRate)
VALUES
('ZAR', 'South African Rand','R', '01.00', '2024-06-21'),
('NGN', 'Nigerian Naira', '₦', '82.64', ' 2024-12-12'),
('KES', 'Kenyan Shilling', 'KSh', '7,74', '2025-01-21'),
('GHS','Ghana Cedi' , '₵', '0,67', '2025-06-16'),
('EGP', 'Egyptian Pound', 'E£GHS',  '3,21', '2024-07-05');

SET IDENTITY_INSERT Currencies OFF;


SELECT * FROM Textbooks WHERE Title = 'Computer Science';


SELECT * FROM Textbooks WHERE Author = 'Douglas Crockford';


SELECT * FROM Textbooks WHERE ISBN = '979-8-886-45174-0';


SELECT * FROM Textbooks WHERE Campus = 'South Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'Good';



SELECT * FROM Textbooks WHERE Title = 'Medicine';


SELECT * FROM Textbooks WHERE Author = 'Noam Nisan';


SELECT * FROM Textbooks WHERE ISBN = '979-8-886-35173-2';


SELECT * FROM Textbooks WHERE Campus = 'Main Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'New';



SELECT * FROM Textbooks WHERE Title = 'Engineering';


SELECT * FROM Textbooks WHERE Author = 'Andrew Hunt';


SELECT * FROM Textbooks WHERE ISBN = '979-8-688-45174-1';


SELECT * FROM Textbooks WHERE Campus = 'Main Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'Poor';



SELECT * FROM Textbooks WHERE Title = 'Commerce';


SELECT * FROM Textbooks WHERE Author = 'carol Tavris';


SELECT * FROM Textbooks WHERE ISBN = '979-8-886-43194-0';


SELECT * FROM Textbooks WHERE Campus = 'South Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'Good';



SELECT * FROM Textbooks WHERE Title = 'Law';


SELECT * FROM Textbooks WHERE Author = 'Alain de Botton';


SELECT * FROM Textbooks WHERE ISBN = '979-8-886-589147-0';


SELECT * FROM Textbooks WHERE Campus = 'North Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'New';



SELECT * FROM Textbooks WHERE Title = 'Bcom';


SELECT * FROM Textbooks WHERE Author = 'Alain de Botton';


SELECT * FROM Textbooks WHERE ISBN = '979-8-886-589147-0';


SELECT * FROM Textbooks WHERE Campus = 'South Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'Good';



SELECT * FROM Textbooks WHERE Title = 'Interior Design';


SELECT * FROM Textbooks WHERE Author = 'Alain de Botton';


SELECT * FROM Textbooks WHERE ISBN = '979-8-886-589147-0';


SELECT * FROM Textbooks WHERE Campus = 'North Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'New';


SELECT * FROM Textbooks WHERE Title = 'Applied Science';


SELECT * FROM Textbooks WHERE Author = 'Alain de Botton';


SELECT * FROM Textbooks WHERE ISBN = '979-8-286-589147-0';


SELECT * FROM Textbooks WHERE Campus = 'North Campus'; 


SELECT * FROM Textbooks WHERE Condition = 'New';

SELECT *
FROM Users;

IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Users_Get')
    DROP PROCEDURE Users_Get;
GO

CREATE PROCEDURE Users_Get
    @User_ID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @User_ID IS NULL
        SELECT * FROM Users ORDER BY FullName;
    ELSE
        SELECT * FROM Users WHERE User_ID = @User_ID;
END;
GO

-- Update Users
IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Users_Update')
    DROP PROCEDURE Users_Update;
GO

CREATE PROCEDURE Users_Update
    @User_ID INT,
    @FullName VARCHAR(100),
    @Email VARCHAR(100),
    @Password VARCHAR(255),
    @StartDate DATE,
    @ReturnDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Users
    SET FullName = @FullName,
        Email = @Email,
        Password = @Password,
        StartDate = @StartDate,
        ReturnDate = @ReturnDate
    WHERE User_ID = @User_ID;

    PRINT 'User updated successfully.';
END;
GO


IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Textbooks_Get')
    DROP PROCEDURE Textbooks_Get;
GO

CREATE PROCEDURE Textbooks_Get
    @Textbook_ID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Textbook_ID IS NULL
        SELECT t.Textbook_ID, t.Title, t.Author, t.ISBN, t.Condition, t.Price, t.Campus,
               u.FullName AS OwnerName
        FROM Textbooks t
        LEFT JOIN Users u ON t.User_ID = u.User_ID
        ORDER BY t.Title;
    ELSE
        SELECT t.Textbook_ID, t.Title, t.Author, t.ISBN, t.Condition, t.Price, t.Campus,
               u.FullName AS OwnerName
        FROM Textbooks t
        LEFT JOIN Users u ON t.User_ID = u.User_ID
        WHERE t.Textbook_ID = @Textbook_ID;
END;
GO

-- Get Transactions
IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Transactions_Get')
    DROP PROCEDURE Transactions_Get;
GO

CREATE PROCEDURE Transactions_Get
    @Transaction_ID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Transaction_ID IS NULL
        SELECT tr.Transaction_ID, u.FullName AS UserName, t.Title AS TextbookTitle
        FROM Transactions tr
        LEFT JOIN Users u ON tr.User_ID = u.User_ID
        LEFT JOIN Textbooks t ON tr.Textbook_ID = t.Textbook_ID
        ORDER BY tr.Transaction_ID;
    ELSE
        SELECT tr.Transaction_ID, u.FullName AS UserName, t.Title AS TextbookTitle
        FROM Transactions tr
        LEFT JOIN Users u ON tr.User_ID = u.User_ID
        LEFT JOIN Textbooks t ON tr.Textbook_ID = t.Textbook_ID
        WHERE tr.Transaction_ID = @Transaction_ID;
END;
GO
 

IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Currencies_Get')
    DROP PROCEDURE Currencies_Get;
GO

CREATE PROCEDURE Currencies_Get
    @Currency_ID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Currency_ID IS NULL
        SELECT c.Currency_ID, c.CurrencyCode, c.CurrencyName, c.Symbol, c.ExchangeRate,
               u.FullName AS UserName,
               t.Title AS TextbookTitle,
               tr.Transaction_ID
        FROM Currencies c
        LEFT JOIN Users u ON c.User_ID = u.User_ID
        LEFT JOIN Textbooks t ON c.Textbook_ID = t.Textbook_ID
        LEFT JOIN Transactions tr ON c.Transaction_ID = tr.Transaction_ID
        ORDER BY c.CurrencyName;
    ELSE
        SELECT c.Currency_ID, c.CurrencyCode, c.CurrencyName, c.Symbol, c.ExchangeRate,
               u.FullName AS UserName,
               t.Title AS TextbookTitle,
               tr.Transaction_ID
        FROM Currencies c
        LEFT JOIN Users u ON c.User_ID = u.User_ID
        LEFT JOIN Textbooks t ON c.Textbook_ID = t.Textbook_ID
        LEFT JOIN Transactions tr ON c.Transaction_ID = tr.Transaction_ID
        WHERE c.Currency_ID = @Currency_ID;
END;
GO
IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Currencies_Get')
    DROP PROCEDURE Currencies_Get;
GO

CREATE PROCEDURE Currencies_Get
    @Currency_ID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @Currency_ID IS NULL
        SELECT * FROM Currencies ORDER BY CurrencyName;
    ELSE
        SELECT * FROM Currencies WHERE Currency_ID = @Currency_ID;
END;
GO


--UPDATE Stored Procedure
IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Currencies_Update')
    DROP PROCEDURE Currencies_Update;
GO

CREATE PROCEDURE Currencies_Update
    @Currency_ID INT,
    @CurrencyCode CHAR(3),
    @CurrencyName VARCHAR(50),
    @Symbol VARCHAR(10) = NULL,
    @ExchangeRate DECIMAL(20,5) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Currencies WHERE Currency_ID = @Currency_ID)
        BEGIN
            RAISERROR('Currency not found.', 16, 1);
            RETURN;
        END

        UPDATE Currencies
        SET CurrencyCode = UPPER(@CurrencyCode),
            CurrencyName = @CurrencyName,
            Symbol = @Symbol,
            ExchangeRate = @ExchangeRate
        WHERE Currency_ID = @Currency_ID;

        PRINT 'Currency updated successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO


--DELETE Stored Procedure
IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'Currencies_Delete')
    DROP PROCEDURE Currencies_Delete;
GO

CREATE PROCEDURE Currencies_Delete
    @Currency_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Currencies WHERE Currency_ID = @Currency_ID)
        BEGIN
            RAISERROR('Currency not found.', 16, 1);
            RETURN;
        END

        DELETE FROM Currencies WHERE Currency_ID = @Currency_ID;
        PRINT 'Currency deleted successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'Error: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
