--*************************************************************************--
-- Title: Starbucks database for tracking transportation and packaging
-- Desc: This is the file to create the tables for the database
-- Change Log: When,Who,What
-- 2019-07-30,Davisa88,Created File
--**************************************************************************--

Begin Try
	Use Master;
	If Exists(Select Name
From SysDatabases
Where Name = 'summer_starbucks_teamA')
	 Begin
  Alter Database [summer_starbucks_teamA] set Single_user With Rollback Immediate;
  Drop Database summer_starbucks_teamA;
End
	Create Database summer_starbucks_teamA;
End Try
Begin Catch
	Print Error_Number();
End Catch
go
Use summer_starbucks_teamA;

-- Conventions: Pleae copy and paste the following tables to use as conventions

--*************************************************************************--
-- Create Table: 
-- Description:
-- Change Log: When,Who,What
-- 2019-07-30, WHO ,Created Table
--**************************************************************************--
-- Create a new table called '[TableName]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[TableName]', 'U') IS NOT NULL
DROP TABLE [dbo].[TableName]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[TableName]
(
  [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [ColumnName2] NVARCHAR(50) NOT NULL,
  [ColumnName3] NVARCHAR(50) NOT NULL
  -- Specify more columns here
);
GO

/* Author: 
Description: 
Change Log: When,Who,What** 
< DATE >,< WHO >,Created Sproc.*/
CREATE PROCEDURE uspStoredProcedure (
-- add any parameters here
)
AS
BEGIN
  -- Body
  DECLARE @RC int = 0;
  BEGIN TRY   
      BEGIN TRAN    
      -- Transaction Code --
      COMMIT TRAN 
      SET @RC = +1;
    END TRY  
  BEGIN CATCH   
    IF(@@Trancount > 0) 
      ROLLBACK TRAN;   
      PRINT Error_Message();
      SET @RC = -1; 
  END CATCH
  RETURN @RC;
END -- Body
GO

--*************************************************************************--
-- Create Table: tblShippingStatus
-- Description:
-- Change Log: When,Who,What
-- 2019-08-09, Austin ,Created Table
--**************************************************************************--
-- Create a new table called '[tblShippingStatus]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblShippingStatus]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblShippingStatus]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblShippingStatus]
(
  [ShippingStatusID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [ShippingStatusName] NVARCHAR(35) NOT NULL,
  [ShippingStatusDesc] NVARCHAR(100) NOT NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblTransportType
-- Description:
-- Change Log: When,Who,What
-- 2019-08-09, Austin ,Created Table
--**************************************************************************--
-- Create a new table called '[tblTransportType]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblTransportType]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblTransportType]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblTransportType]
(
  [TransportTypeID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [TransportTypeName] NVARCHAR(35) NOT NULL,
  [TransportTypeDesc] NVARCHAR(100) NOT NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblTransport
-- Description:
-- Change Log: When,Who,What
-- 2019-08-09, Austin ,Created Table
--**************************************************************************--
-- Create a new table called '[tblTransport]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblTransport]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblTransport]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblTransport]
(
  [TransportID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [TransportTypeID] INT NOT NULL,
  [Capacity] INT NOT NULL,
  [Range] INT NULL,
  [Speed] INT NULL,
  [Beam] INT NULL,
  [Length] INT NULL
  -- Specify more columns here
);
GO