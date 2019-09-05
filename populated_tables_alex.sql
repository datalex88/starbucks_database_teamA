USE summer_starbucks_teamA
GO

-- Adding values to tblShippingStatus --
-- 2019/09/04 Alex
-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO [dbo].[tblShippingStatus]
( -- Columns to insert data into
 [ShippingStatusName], [ShippingStatusDesc]
)
VALUES
( -- First row: values for the columns in the list above
 'On Time', 'Shipment is on time'
),
( -- Second row: values for the columns in the list above
 'Delayed', 'Shipment is delayed'
),
( -- Second row: values for the columns in the list above
 'Canceled', 'Shipment has been canceled'
)
GO


