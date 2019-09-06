USE summer_starbucks_teamA
GO

-- Adding values to tblCoffeeContainerType --
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

/*
Wrapper to populate the table CoffeeContainer
Alex
2019/09/05

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[davis_WRAPPER_uspNewCoffeeContainer]
@RUN INT
AS

DECLARE @cofftypeid INT
DECLARE @frmid      INT
DECLARE @wei NUMERIC(8,2) -- Grainpro 25, jute 60, and vacuum sealed 20
DECLARE @vol NUMERIC(8,2)

DECLARE @Count_farID  INT = (SELECT COUNT(*) FROM tblFarm WHERE FarmCountryID = 8) --YOU WILL NEED TO CHANGE THIS TO 13 AFTER RUNNING THE ETHEOPIAN FARMS

DECLARE @fid INT
DECLARE @Rand INT

WHILE @RUN > 0
BEGIN

SET @fid = (SELECT FLOOR(RAND() * (2889-2391+1)) + 2391) -- Change the first number when you move to vietnam as the biggest FarmID and the second as the smallest FarmID

IF @fid < 1 
	BEGIN
		SET @fid = 2
	END
SET @frmid = (SELECT * FROM tblFarm 
                WHERE FarmCountryID = 8 --YOU WILL NEED TO CHANGE THIS TO 13 AFTER RUNNING THE ETHEOPIAN FARMS
                AND FarmID = @fid)
SET @cofftypeid = (43) -- Change this to 42 for the GrainPro Bag
SET @vol = (0)
SET @wei = (SELECT RAND()*(61-59)+59) -- CHANGE THIS TO BE A RANDOM NUMBER BETWEEN 24 & 26

EXEC uspInsertCoffeeContainer
    @CoffeeContainerTypeID  = @cofftypeid,
    @FarmID                 = @frmid,
    @wt                     = @wei,
    @vol                    = @vol

SET @RUN = @RUN -1
END
-- Execute wrapper
GO
DECLARE @RC int
DECLARE @RUN int

EXECUTE @RC = [dbo].[davis_WRAPPER_uspNewCoffeeContainer] 
   @RUN = 150000
GO
*/

