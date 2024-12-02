IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'SimpleList')
BEGIN
    CREATE DATABASE SimpleList
END
GO

USE SimpleList
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'Podcast') AND type in (N'U'))
BEGIN
CREATE TABLE Podcast (
                         id UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(),
                         Title VARCHAR(100) NOT NULL
)
END
GO

IF NOT EXISTS (SELECT 1 FROM Podcast)
BEGIN
INSERT INTO Podcast (Title)
VALUES
    ('.NET EP 01'),
    ('LINQ - DO and Donts'),
    ('SQL - Server 101'),
    ('Docker 101')
END
GO
    
       