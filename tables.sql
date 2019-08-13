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
<<<<<<< HEAD
-- Create Table: tblInspector
-- Description: A table with information on inspectors.
-- Change Log: When,Who,What
-- 2019-08-09, Joey, Created Table
--**************************************************************************--
-- Create a new table called '[tblInspector]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblInspector]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblInspector]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblInspector]
(
	[InspectorID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[InspectorFname] NVARCHAR(30) NOT NULL,
	[InspectorLname] NVARCHAR(30) NOT NULL,
	[InspectorCompany] NVARCHAR(50) NOT NULL
);
GO

--*************************************************************************--
-- Create Table: tblBroker
-- Description: A table with information on brokers.
-- Change Log: When,Who,What
-- 2019-08-09, Joey, Created Table
--**************************************************************************--
-- Create a new table called '[tblBroker]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblBroker]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblBroker]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblBroker]
(
	[BrokerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[BrokerFname] NVARCHAR(30) NOT NULL,
	[BrokerLname] NVARCHAR(30) NOT NULL,
	[BrokerCompany] NVARCHAR(50) NOT NULL
);
GO

--*************************************************************************--
-- Create Table: tblShippingContainerType
-- Description: A table with information on shipping containers.
-- Change Log: When,Who,What
-- 2019-08-09, Joey, Created Table
--**************************************************************************--
-- Create a new table called '[tblShippingContainerType]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblShippingContainerType]', 'U') IS NOT NULL
DROP TABLE [dbo].[tblShippingContainerType]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[tblShippingContainerType]
(
	[ShippingContainerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ShippingContainerName] NVARCHAR(50) NOT NULL,
	[ShippingContainerDescr] NVARCHAR(50) NOT NULL,
	[ShippingContainerBrand] NVARCHAR(50) NOT NULL,
  [ShippingContainerLength] NUMERIC(8,2) NOT NULL,
  [ShippingContainerWidth] NUMERIC(8, 2) NOT NULL,
  [ShippingContainerHeight] NUMERIC(8, 2) NOT NULL
=======
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
	[WasteId]        INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[InspectorID]    FOREIGN KEY REFERENCES tblINspector (InspectorID) NOT NULL,
  [WasteAmmount]   NVARCHAR(50)  NOT NULL,
	[ReasonForWaste] NVARCHAR(500) NOT NULL
	-- Specify more columns here
>>>>>>> alex_branch
);
GO
