/* 
==============================================================
stored procedur= loads bronze layer (source--->bronze)

Usage example = exec bronze.load_bronze
===============================================================
*/
Create or alter procedure bronze.load_bronze as 
begin
declare @start_time datetime, @end_time datetime, @batch_start_time datetime, @batch_end_time datetime;
set @batch_start_time = getdate();
print  '========================================================================';
print  'loading bronze layer';
print  '========================================================================';


print  '------------------------------------------------------------------------';
Print  'Loading the crm tables';
print  '------------------------------------------------------------------------';


set @start_time = getdate();
print  '>> Truncating the table: bronze.crm_cust_info';
Truncate table bronze.crm_cust_info;
Print '>> Inserting data into : bronze.crm_cust_info';
bulk insert bronze.crm_cust_info
from 'C:\Users\leela\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
with (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK
);
set @end_time = getdate();
print '>>load duration time: ' + cast(datediff(second,@start_time, @end_time) as nvarchar)
print '-----------------------------------';




set @start_time = getdate();
print  '>> Truncating the table: bronze.crm_prd_info';
Truncate table bronze.crm_prd_info;
Print '>> Inserting data into : bronze.crm_prd_info';
bulk insert bronze.crm_prd_info
from 'C:\Users\leela\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
with (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK
);
set @end_time = getdate();
print '>>load duration time: ' + cast(datediff(second,@start_time, @end_time) as nvarchar)
print '-----------------------------------';



set @start_time = getdate();
print  '>> Truncating the table: bronze.crm_sales_details';
Truncate table bronze.crm_sales_details;
Print '>> Inserting data into : bronze.crm_sales_details';
bulk insert bronze.crm_sales_details
from 'C:\Users\leela\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
with (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK
);
set @end_time = getdate();
print '>>load duration time: ' + cast(datediff(second,@start_time, @end_time) as nvarchar)
print '-----------------------------------'




print  '------------------------------------------------------------------------';
Print  'Loading the erp tables';
print  '------------------------------------------------------------------------';

set @start_time = getdate();
print  '>> Truncating the table: bronze.erp_cust_az12';
Truncate table bronze.erp_cust_az12;
Print '>> Inserting data into : bronze.erp_cust_az12';
bulk insert bronze.erp_cust_az12
from 'C:\Users\leela\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
with (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK
);
set @end_time = getdate();
print '>>load duration time: ' + cast(datediff(second,@start_time, @end_time) as nvarchar)
print '-----------------------------------'




set @start_time = getdate();
print  '>> Truncating the table: bronze.erp_loc_a101';
Truncate table bronze.erp_loc_a101;
Print '>> Inserting data into : bronze.erp_loc_a101';
bulk insert bronze.erp_loc_a101
from 'C:\Users\leela\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
with (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK
);
set @end_time = getdate();
print '>>load duration time: ' + cast(datediff(second,@start_time, @end_time) as nvarchar)
print '-----------------------------------'




set @start_time = getdate();
print  '>> Truncating the table: bronze.erp_px_cat_g1v2';
Truncate table bronze.erp_px_cat_g1v2;
Print '>> Inserting data into : bronze.erp_px_cat_g1v2';
bulk insert bronze.erp_px_cat_g1v2
from 'C:\Users\leela\OneDrive\Desktop\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
with (
 FIRSTROW = 2,
 FIELDTERMINATOR = ',',
 TABLOCK
);
set @end_time = getdate();
print '>>load duration time: ' + cast(datediff(second,@start_time, @end_time) as nvarchar)
print '-----------------------------------'

set @batch_end_time = getdate();
print '>>Total Batch duration time: ' + cast(datediff(second,@batch_start_time, @batch_end_time) as nvarchar)
print '-----------------------------------'
end
