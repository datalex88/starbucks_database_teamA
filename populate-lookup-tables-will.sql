INSERT INTO [dbo].[tblLOCATION_TYPE] (LocationTypeName, LocationTypeDesc)
VALUES ('Airport', 'Allows arrival and departure of airplanes'), ('Seaport', 'Allows arrival and departure of ships'), ('Train Station', 'Allows arrival and departure of trains.')

INSERT INTO [dbo].[tblREGION] (RegionName, RegionDesc)
VALUES ('North America', 'Common destination of coffee beans'), ('South America', 'Large producer of coffee beans'), ('Africa', 'Producer of coffee beans'), ('Asia', 'Producer of coffee beans')

INSERT INTO [dbo].[tblCOUNTRY] (RegionID, CountryName, CountryDesc)
VALUES ((SELECT RegionID FROM [dbo].[tblREGION] WHERE RegionName = 'North America'), 'USA', 'Home of the free!'),
((SELECT RegionID FROM [dbo].[tblREGION] WHERE RegionName = 'South America'), 'Colombia', 'We grow beans.'),
((SELECT RegionID FROM [dbo].[tblREGION] WHERE RegionName = 'Africa'), 'Ethiopia', 'We also grow beans.'),
((SELECT RegionID FROM [dbo].[tblREGION] WHERE RegionName = 'Asia'), 'Vietnam', 'Hey we grow beans too!')

INSERT INTO [dbo].[tblLOCATION] (CountryID, LocationTypeID, LocationName, LocationDesc)
VALUES ((SELECT CountryID FROM [dbo].[tblCOUNTRY] WHERE CountryName = 'USA'), (SELECT LocationTypeID FROM [dbo].[tblLOCATION_TYPE] WHERE LocationTypeName = 'Seaport'), 'Seattle', 'Home of Starbucks'),
((SELECT CountryID FROM [dbo].[tblCOUNTRY] WHERE CountryName = 'Colombia'), (SELECT LocationTypeID FROM [dbo].[tblLOCATION_TYPE] WHERE LocationTypeName = 'Airport'), 'Bogota', 'We ship beans'),
((SELECT CountryID FROM [dbo].[tblCOUNTRY] WHERE CountryName = 'Ethiopia'), (SELECT LocationTypeID FROM [dbo].[tblLOCATION_TYPE] WHERE LocationTypeName = 'Train Station'), 'Addis Ababa', 'We also ship beans'),
((SELECT CountryID FROM [dbo].[tblCOUNTRY] WHERE CountryName = 'Vietnam'), (SELECT LocationTypeID FROM [dbo].[tblLOCATION_TYPE] WHERE LocationTypeName = 'Seaport'), 'Ha Noi', 'We ship beans')