--*************************************************************************--
-- Create Table: tblLOCATION
-- Description: Tracks locations shipping vessels can leave from / arrive into
-- Change Log: When,Who,What
-- 2019-08-13, Will ,Created Table
--**************************************************************************--
-- Create a new table called '[tblLOCATION]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblLOCATION]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblLOCATION]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblLOCATION]
(
	LocationID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CountryID INT FOREIGN KEY REFERENCES tblCOUNTRY (CountryID) NOT NULL,
    LocationTypeID INT FOREIGN KEY REFERENCES tblLOCATION_TYPE (LocationTypeID) NOT NULL,
    LocationName VARCHAR(100) NOT NULL,
    LocationDesc VARCHAR(200) NULL
);
GO

--*************************************************************************--
-- Create Table: tblLOCATION_TYPE
-- Description: Describes the type of location shipping vessels travel to / from
-- Change Log: When,Who,What
-- 2019-08-13, Will ,Created Table
--**************************************************************************--
-- Create a new table called '[tblLOCATION_TYPE]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblLOCATION_TYPE]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblLOCATION_TYPE]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblLOCATION_TYPE]
(
	LocationTypeID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	LocationTypeName VARCHAR(100) NOT NULL,
    LocationTypeDesc VARCHAR(200) NULL
);
GO

--*************************************************************************--
-- Create Table: tblCOUNTRY
-- Description: Describes the country a location is in
-- Change Log: When,Who,What
-- 2019-08-13, Will ,Created Table
--**************************************************************************--
-- Create a new table called '[tblCOUNTRY]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblCOUNTRY]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblCOUNTRY]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblCOUNTRY]
(
	CountryID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    RegionID INT FOREIGN KEY REFERENCES tblCOUNTRY (CountryID) NOT NULL,
	CountryName VARCHAR(100) NOT NULL,
    CountryDesc VARCHAR(200) NULL
);
GO

--*************************************************************************--
-- Create Table: tblREGION
-- Description: Describes the region a country resides within
-- Change Log: When,Who,What
-- 2019-08-13, Will ,Created Table
--**************************************************************************--
-- Create a new table called '[tblREGION]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblREGION]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblREGION]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblREGION]
(
	RegionID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	RegionName VARCHAR(100) NOT NULL,
    RegionDesc VARCHAR(200) NULL
);
GO