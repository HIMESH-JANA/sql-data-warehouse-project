/*

Create Database and Schemas

Script Purpose:
This script creates a new database named 'DataWarehouse' after checking if it already exists.
If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
within the database: 'bronze', 'silver', and 'gold'.

WARNING:

Running this script will drop the entire 'DataWarehouse' database if it exists.
All data in the database will be permanently deleted. Proceed with caution
and ensure you have proper backups before running this script.

*/

USE master
GO

--check if the database already exist,if yes then drops it

IF EXISTS(SELECT 1 FROM sys.databases WHERE name='datawarehouse')
BEGIN
	DROP DATABASE datawarehouse
END
GO

--createing and using the database

CREATE DATABASE datawarehouse
GO 

USE datawarehouse
GO

--creating schemas for data warehouse

CREATE SCHEMA bronze
GO
CREATE SCHEMA silver
GO
CREATE SCHEMA gold
