/* 
Create Database and schemas
-------------------------------------------------------------------------------------------
script purpose:
 This script creates a newdatabase named datawarehouse. Additionally the script setups three schemas
 within in the database: 'bronze'.'silver','gold'.

*/

Use master;
go
--- Create datawarehouse database
create database datawarehouse;

use datawarehouse;

create schema bronze;
go
create schema silver;
go
create schema gold;
go
