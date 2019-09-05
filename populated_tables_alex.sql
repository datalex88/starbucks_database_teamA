USE summer_starbucks_teamA
GO

-- Adding values to tblShippingStatus --
-- 2019/09/04 Alex
-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO [dbo].[tblCoffeeContainerType]
( -- Columns to insert data into
 [CoffeeContainerTypeName], [CoffeeContainerTypeDesc]
)
VALUES
( -- First row: values for the columns in the list above
 'GrainPro Bag', 'A hermetic, protective bag'
),
( -- Second row: values for the columns in the list above
 'Jute Bag', 'Standard bag'
),
( -- Second row: values for the columns in the list above
 'Vacuum bag', 'Vacuum sealed bag'
)
GO
SELECT * FROM tblFarm
SELECT * FROM tblCoffeeContainerType
SELECT * FROM tblCoffeeContainer
SELECT * FROM tblShippingContainer
GO
SELECT RAND()*(61-59)+59;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[davis_WRAPPER_uspNewCoffeeContainer]
@RUN INT
AS

DECLARE @cofftypeid INT
DECLARE @frmid      INT
DECLARE @wei NUMERIC(8,2) -- Grainpro 15, jute 60, and vacuum sealed 20
DECLARE @vol NUMERIC(8,2)

DECLARE @Count_farID  INT = (SELECT COUNT(*) FROM tblFarm)

DECLARE @fid INT
DECLARE @Rand INT

WHILE @RUN > 0
BEGIN

SET @fid = (SELECT FLOOR(1000 * RAND()) + 1390)

IF @fid < 1 
	BEGIN
		SET @fid = 2
	END
SET @frmid = (SELECT FarmID FROM tblFarm WHERE FarmID = @fid)
SET @cofftypeid = (43)
SET @vol = (0)
SET @wei = (SELECT RAND()*(61-59)+59)

EXEC uspInsertCoffeeContainer
    @CoffeeContainerTypeID  = @cofftypeid,
    @FarmID                 = @frmid,
    @wt                     = @wei,
    @vol                    = @vol

SET @RUN = @RUN -1
END

GO
DECLARE @RC int
DECLARE @RUN int

EXECUTE @RC = [dbo].[davis_WRAPPER_uspNewCoffeeContainer] 
   @RUN = 4000000
GO