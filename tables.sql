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
-- Description: A table with information on shipping status.
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

--**************************************************************************--
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
-- Create Table: tblTransportType
-- Description: A table with information on transport type.
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
-- Create Table: tblTransport
-- Description: A table with information on transport.
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
  [TransportTypeID] INT FOREIGN KEY REFERENCES tblTransportType (TransportTypeID) NOT NULL,
  [Capacity] INT NOT NULL,
  [Range] INT NULL,
  [Speed] INT NULL,
  [Beam] INT NULL,
  [Length] INT NULL
  -- Specify more columns here
);
GO

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
);
GO

--**************************************************************************--
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
  [InspectorID] INT FOREIGN KEY REFERENCES tblInspector (InspectorID) NOT NULL,
  [WasteAmmount] NVARCHAR(50) NOT NULL,
  [ReasonForWaste] NVARCHAR(500) NOT NULL
);
GO


--*************************************************************************--
-- Create Table: tblCoffeeContainerType
-- Description: A table with information on the type of container for the coffee beans.
-- Change Log: When,Who,What
-- 2019-08-16, Maxwell/Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblCoffeeContainerType]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblCoffeeContainerType]', 'U') IS NOT NULL
DROP TABLE [dbo].tblCoffeeContainerType
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblCoffeeContainerType
(
  [CoffeeContainerTypeID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [CoffeeContainerTypeName] NVARCHAR(35) NOT NULL,
  [CoffeeContainerTypeDesc] NVARCHAR(100) NOT NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblCoffeeGrower
-- Description: A table with information on the persons growing the coffee plants.
-- Change Log: When,Who,What
-- 2019-08-16, Maxwell/Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblCoffeeGrower]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblCoffeeGrower]', 'U') IS NOT NULL
DROP TABLE [dbo].tblCoffeeGrower
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblCoffeeGrower
(
  [CoffeeGrowerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [CoffeeGrowerFName] NVARCHAR(35) NOT NULL,
  [CoffeeGrowerLName] NVARCHAR(35) NOT NULL,
  [CoffeeGrowerDOB] DATE NOT NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblFarmRegion
-- Description: A table with information on the region the coffee farm is in.
-- Change Log: When,Who,What
-- 2019-08-16, Maxwell/Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblFarmRegion]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblFarmRegion]', 'U') IS NOT NULL
DROP TABLE [dbo].tblFarmRegion
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblFarmRegion
(
  [FarmRegionID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [FarmRegionName] NVARCHAR(35) NOT NULL,
  [FarmRegionDesc] NVARCHAR(100) NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblFarmCountry
-- Description: A table with information on the country the farm is in.
-- Change Log: When,Who,What
-- 2019-08-16, Maxwell/Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblFarmCountry]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblFarmCountry]', 'U') IS NOT NULL
DROP TABLE [dbo].tblFarmCountry
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblFarmCountry
(
  [FarmCountryID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [FarmRegionID] INT FOREIGN KEY REFERENCES tblFarmRegion (FarmRegionID) NOT NULL,
  [FarmCountryName] NVARCHAR(35) NOT NULL,
  [FarmCountryDesc] NVARCHAR(100) NULL
  -- Specify more columns here
);
GO


--*************************************************************************--
-- Create Table: tblFarm
-- Description: A table with information on the farms that the coffee plants grew on.
-- Change Log: When,Who,What
-- 2019-08-16, Maxwell/Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblFarm]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblFarm]', 'U') IS NOT NULL
DROP TABLE [dbo].tblFarm
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblFarm
(
  [FarmID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [CoffeeGrowerID] INT FOREIGN KEY REFERENCES tblCoffeeGrower (CoffeeGrowerID) NOT NULL,
  [FarmCountryID] INT FOREIGN KEY REFERENCES tblFarmCountry (FarmCountryID) NOT NULL,
  [FarmName] NVARCHAR(35) NOT NULL,
  [Address] NVARCHAR(35) NOT NULL,
  [City] NVARCHAR(35) NOT NULL,
  [Latitude] DECIMAL(9,6) NOT NULL,
  [Longitude] DECIMAL(9,6) NOT NULL,
  [Acreage] NUMERIC(8,2) NOT NULL,
  [FarmDesc] NVARCHAR(100) NOT NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblCoffeeContainer
-- Description: A table with information on the container holding the coffee beans.
-- Change Log: When,Who,What
-- 2019-08-16, Maxwell/Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblCoffeeContainer]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblCoffeeContainer]', 'U') IS NOT NULL
DROP TABLE [dbo].tblCoffeeContainer
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblCoffeeContainer
(
  [CoffeeContainerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [FarmID] INT FOREIGN KEY REFERENCES tblFarm (FarmID) NOT NULL,
  [CoffeeContainerTypeID] INT FOREIGN KEY REFERENCES tblCoffeeContainerType (CoffeeContainerTypeID) NOT NULL,
  [Weight] NUMERIC(8,2) NOT NULL,
  [Volume] NUMERIC(8,2) NOT NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblShippingContainer
-- Description: A table with information on the persons growing the coffee plants.
-- Change Log: When,Who,What
-- 2019-08-16, Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblShippingContainer]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblShippingContainer]', 'U') IS NOT NULL
DROP TABLE [dbo].tblShippingContainer
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblShippingContainer
(
  [ShippingContainerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [CoffeeContainerID] INT FOREIGN KEY REFERENCES tblCoffeeContainer (CoffeeContainerID) NOT NULL,
  [InspectionID] INT FOREIGN KEY REFERENCES tblInspection (InspectionID) NOT NULL,
  [ShippingContainerTypeID] INT FOREIGN KEY REFERENCES tblShippingContainer (ShippingContainerID) NOT NULL,
  [TripID] INT FOREIGN KEY REFERENCES tblTrip (TripID) NOT NULL,
  [ShippingContainerName] NVARCHAR(35) NOT NULL,
  [Capacity] NUMERIC(8,2) NOT NULL,
  [Volume] NUMERIC(8,2) NOT NULL
  -- Specify more columns here
);
GO

--*************************************************************************--
-- Create Table: tblInspection
-- Description: A table with information on the persons growing the coffee plants.
-- Change Log: When,Who,What
-- 2019-08-16, Youssof, Created Table
--**************************************************************************--
-- Create a new table called '[tblInspection]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[tblInspection]', 'U') IS NOT NULL
DROP TABLE [dbo].tblInspection
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].tblInspection
(
  [InspectionID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
  [ShippingContainerID] INT FOREIGN KEY REFERENCES tblShippingContainer (ShippingContainerID) NOT NULL,
  [InspectorID] INT FOREIGN KEY REFERENCES tblInspector (InspectorID) NOT NULL,
  [InspectionDateTime] DATETIME NOT NULL
  -- Specify more columns here
);
GO