--*************************************************************************--
-- Title: Starbucks database for tracking transportation and packaging
-- Desc: This is the file to create the tables for the database
-- Change Log: When,Who,What
-- 2019-07-30,Davisa88,Created File
--**************************************************************************--

Begin Try
	Use Master;
	If Exists(Select Name From SysDatabases Where Name = 'summer_starbucks_teamA')
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
  BEGIN -- Body
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
-- Create Table: Waste 
-- Description: This will track the waste for each shipment
-- Change Log: When,Who,What
-- 2019-08-09, Alex ,Created Table
--**************************************************************************--
-- Create a new table called '[tblWaste]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblWaste]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblWaste]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblWaste]
(
	[WasteId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ColumnName2] NVARCHAR(50) NOT NULL,
	[ColumnName3] NVARCHAR(50) NOT NULL
	-- Specify more columns here
);
GO
