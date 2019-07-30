--*************************************************************************--
-- Title: Starbucks database for tracking transportation and packaging
-- Desc: This is the file to create the tables for the database
-- Change Log: When,Who,What
-- 2019-07-30,Davisa88,Created File
--**************************************************************************--

Begin Try
	Use Master;
	If Exists(Select Name From SysDatabases Where Name = 'starbucks_teamA')
	 Begin 
	  Alter Database [starbucks_teamA] set Single_user With Rollback Immediate;
	  Drop Database starbucks_teamA;
	 End
	Create Database starbucks_teamA;
End Try
Begin Catch
	Print Error_Number();
End Catch
go
Use starbucks_teamA;
