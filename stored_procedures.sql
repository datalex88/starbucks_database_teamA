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

/* Author: Alex
Description: A SPROC for a new Purchase Order
Change Log: When,Who,What**
< DATE >,< WHO >,Created Sproc.*/
CREATE PROCEDURE uspShippingContainer (
@Capacity            NUMERIC(5,2),
@Volume              NUMERIC(5,2),
@ShipConName         NVARCHAR(50),
@CoffeeContainerType NVARCHAR(50),
@TransportTypeName   NVARCHAR(50),
@Origin              NVARCHAR(50),
@Destination         NVARCHAR(50),
@InspectFname        NVARCHAR(50),
@InspectLname        NVARCHAR(50),
@Farmname            NVARCHAR(50)
)
AS
BEGIN
  -- Body
  DECLARE @RC int = 0,
  -- Look up ID's from appropriate tables -- 
  @Coff_Cont_ID INTEGER, 
  @Inspect_ID   INTEGER,
  @Ship_Con_ID  INTEGER,
  @Trip_ID      INTEGER;
  BEGIN TRY
      BEGIN TRAN
      SET @Coff_Cont_ID = (SELECT CoffeeContainerID
                           FROM tblCoffeeContainer
                           WHERE  
      )
      SET @Inspect_ID = (SELECT InspectionID
                         FROM   tblInspection INS
                         JOIN   tblInspector IOR ON INS.InspectorID = IOR.InspectorID
                         WHERE  InspectorFName = @InspectFname
                         AND    InspectorLName = @InspectLname
      )
      SET @Ship_Con_ID = (SELECT ShippingContainerID
                          FROM tblShippingContainerID

      )
      SET @Trip_ID = (SELECT TripID
                      FROM tblTrip

      )
      -- Transaction Code --
      INSERT INTO tblShippingContainer(
          CoffeeContainerID,
          InspectionID,
          ShippingContainerID,
          TripID,
          Capacity,
          Volume
      )
      VALUES(
          @Coff_Cont_ID,
          @Inspect_ID,
          @Ship_Con_ID,
          @Trip_ID
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