--*************************************************************************--
-- Title: Starbucks database for tracking transportation and packaging
-- Desc: This is the file to create the stored Proceedures for the database
-- Change Log: When,Who,What
-- 2019-08-24,Davisa88,Created File
--**************************************************************************--
USE summer_starbucks_teamA
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

/* Author: Joey
Description: Insert into tblInspector
Change Log: When,Who,What**
2019-08-17, Joey, Created Sproc.*/
CREATE PROCEDURE uspINSERT_tblInspector (
@InspectorFname NVARCHAR(30),
@InspectorLname NVARCHAR(30),
@InspectorCompany NVARCHAR(50)
)
AS
  BEGIN -- Body
  DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRAN
        INSERT INTO tblInspector (InspectorFname, InspectorLname, InspectorCompany)
        VALUES (@InspectorFname, @InspectorLname, @InspectorCompany)
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

/* Author: Joey
Description: Insert into tblBroker
Change Log: When,Who,What**
2019-08-17, Joey, Created Sproc.*/
CREATE PROCEDURE uspINSERT_tblBroker (
@BrokerFname NVARCHAR(30),
@BrokerLname NVARCHAR(30),
@BrokerCompany NVARCHAR(50)
)
AS
  BEGIN -- Body
  DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRAN
        INSERT INTO tblBroker (BrokerFname, BrokerLname, BrokerCompany)
        VALUES (@BrokerFname, @BrokerLname, @BrokerCompany)
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

/* Author: Joey
Description: Insert into tblShippingContainerType
Change Log: When,Who,What**
2019-08-17, Joey, Created Sproc.*/
CREATE PROCEDURE uspINSERT_tblShippingContainerType (
@ShippingContainerName NVARCHAR(50),
@ShippingContainerDescr NVARCHAR(50),
@ShippingContainerBrand NVARCHAR(50),
@ShippingContainerLength NUMERIC(8,2),
@ShippingContainerWidth NUMERIC(8,2),
@ShippingContainerHeight NUMERIC(8,2)
)
AS
  BEGIN -- Body
  DECLARE @RC int = 0;
    BEGIN TRY
      BEGIN TRAN
        INSERT INTO tblShippingContainerType (ShippingContainerName,
          ShippingContainerDescr, ShippingContainerBrand,
          ShippingContainerLength, ShippingContainerWidth,
          ShippingContainerHeight)
        VALUES (@ShippingContainerName, @ShippingContainerDescr,
          @ShippingContainerBrand, @ShippingContainerLength,
          @ShippingContainerWidth, @ShippingContainerHeight)
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

/* Author: Joey
Description: Insert into tblCoffeeContainer
Change Log: When,Who,What**
2019-08-26, Joey, Created Sproc.*/
CREATE PROCEDURE uspINSERT_tblCoffeeContainer (
@FarmName NVARCHAR(35),
@CoffeeContainerTypeName NVARCHAR(35),
@Weight NUMERIC(8,2),
@Volume NUMERIC(8,2)
)
AS
  BEGIN -- Body
  DECLARE @RC int = 0;
  
  DECLARE @F_ID INT = (SELECT FarmID FROM tblFarm WHERE FarmName = @FarmName)
  DECLARE @CCT_ID INT = (SELECT CoffeeContainerTypeID FROM tblCoffeeContainerType WHERE CoffeeContainerTypeName = @CoffeeContainerTypeName)

    BEGIN TRY
      BEGIN TRAN
        INSERT INTO tblCoffeeContainer (CoffeeContainerTypeID, FarmID, [Weight], [Volume])
        VALUES (@CCT_ID, @F_ID, @Weight, @Volume)
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

/* Author: Austin Quach
Description: Insert into tblTrip
Change Log: When,Who,What**
2019-08-26, Austin, Created Sproc.*/
CREATE PROCEDURE uspINSERT_tblTrip (
-- add any parameters here
@TransportName NVARCHAR(35),
@ShippingContainerName NVARCHAR(35),
@OriginShippingPort NVARCHAR(100),
@DestinationShippingPort NVARCHAR(100),
@DepartureTime DateTime,
@ArrivalTime DateTime
)
AS
BEGIN
  -- Body
  DECLARE @RC int = 0;

  DECLARE @TRANSPORT_ID INT = (SELECT TransportID FROM tblTransport WHERE TransportName = @TransportName)
  DECLARE @SC_ID INT = (SELECT ShippingContainerID FROM tblShippingContainer WHERE ShippingContainerName = @ShippingContainerName)

  BEGIN TRY
      BEGIN TRAN
      -- Transaction Code --
        INSERT INTO tblTrip (TransportID, ShippingContainerID, [OriginShippingPort], [DestinationShippingPort], [DepartureTime], [ArrivalTime])
        VALUES (@TRANSPORT_ID, @SC_ID, @OriginShippingPort, @DestinationShippingPort, @DepartureTime, @ArrivalTime)
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

/* Author: Alex
Description: A SPROC to insert info into tblShippingContainer
Change Log: When,Who,What**
< DATE >,< WHO >,Created Sproc.*/
CREATE PROCEDURE uspINSERT_tblShippingContainer (
@Capacity        NUMERIC(5,2),
@Volume          NUMERIC(5,2),
@ShipConTypeName NVARCHAR(50),
@Coff_Cont_ID    INTEGER,
@InspectFname    NVARCHAR(30),
@InspectLname    NVARCHAR(30),
@TripID          INTEGER
)
AS
BEGIN
  DECLARE @RC int = 0,
  -- Look up ID's from appropriate tables -- 
  @Coff_Cont_ID INTEGER, 
  @Inspect_ID   INTEGER,
  @Ship_Con_ID  INTEGER,
  @Trip_ID      INTEGER;
  BEGIN TRY
      BEGIN TRAN

      SET @Inspect_ID = (SELECT InspectionID -- Information for finding InspectorID
                         FROM   tblInspection INS
                         JOIN   tblInspector IOR ON INS.InspectorID = IOR.InspectorID
                         WHERE  InspectorFName = @InspectFname
                         AND    InspectorLName = @InspectLname
      )
      SET @Ship_Con_ID = (SELECT ShippingContainerTypeID -- For finding the shippingcontainerTypeID
                          FROM tblShippingContainerType
                          WHERE ShippingContainerTypeName = @ShipConTypeName
      )
      -- Transaction Code --
      INSERT INTO tblShippingContainer(
          CoffeeContainerID,
          InspectionID,
          ShippingContainerID,
          TripID,
          ShippingContainerName,
          Capacity,
          Volume
      )
      VALUES(
          @Coff_Cont_ID,
          @Inspect_ID,
          @Ship_Con_ID,
          @TripID,
          @ShipConName,
          @Capacity,
          @Volume
      )
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

/* Author: Maxwell
Description: Insert into tblPurchaseOrder
Change Log: When,Who,What**
2019-08-30, Maxwell, Created Sproc.*/
CREATE PROCEDURE uspINSERT_tblPurchaseOrder (
@BrokerFname NVARCHAR(30),
@BrokerLname NVARCHAR(30),
@BrokerCompany NVARCHAR(50),
@PODate Date
)
AS
  BEGIN -- Body
  DECLARE @RC int = 0;
  DECLARE @B_ID INT = (SELECT BrokerID 
					   FROM tblBroker 
					   WHERE BrokerFname = @BrokerFname
					   And BrokerLname = @BrokerLname
					   And BrokerCompany = @BrokerCompany)
    BEGIN TRY
      BEGIN TRAN
        INSERT INTO tblPurchaseOrder(BrokerID, PODate)
        VALUES (@B_ID, @PODate)
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

