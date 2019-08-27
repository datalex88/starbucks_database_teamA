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
Description: A SPROC to insert info into tblShippingContainer
Change Log: When,Who,What**
< DATE >,< WHO >,Created Sproc.*/
CREATE PROCEDURE uspInsert_ShippingContainer (
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
  -- Body
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