/* 

DDL : creating bronze tabel
script : this script creates the tables in the 'bronze' schema, dropping existing tables if they are already existing.

*/



If object_id('bronze.crm_cust_info', 'U') is not null
Drop table bronze.crm_cust_info;
create table bronze.crm_cust_info(
cst_id INT,
cst_key nvarchar(50),
cst_firstname nvarchar(50),
cst_lastname nvarchar(50),
cst_material_status nvarchar(50),
cst_gndr nvarchar(50),
cst_create_date DATE
);

If object_id('bronze.crm_prd_info', 'U') is not null
Drop table bronze.crm_prd_info;
create table bronze.crm_prd_info(
prd_id INT,
prd_key nvarchar(50),
prd_nm nvarchar(50),
prd_cost INT,
prd_line nvarchar(50),
prd_start_dt nvarchar(50),
prd_end_dt DATETIME
);

If object_id('bronze.crm_sales_details', 'U') is not null
Drop table bronze.crm_sales_details;
create table bronze.crm_sales_details(
sls_ord_num nvarchar(50),
sls_prd_key nvarchar(50),
sls_cust_id int,
sls_order_dt int,
sls_ship_dt int,
sls_due_dt int,
sls_sales int,
sls_quantity int,
sls_price int
);

If object_id('bronze.erp_loc_a101', 'U') is not null
Drop table bronze.erp_loc_a101;
create table bronze.erp_loc_a101(
cid nvarchar(50),
cntry nvarchar(50),
);

If object_id('bronze.erp_cust_az12', 'U') is not null
Drop table bronze.erp_cust_az12;
create table bronze.erp_cust_az12(
cid nvarchar(50),
bdate Date,
gen nvarchar(50)
);

If object_id('bronze.erp_px_cat_g1v2', 'U') is not null
Drop table bronze.erp_px_cat_g1v2;
create table bronze.erp_px_cat_g1v2(
id nvarchar(50),
cat nvarchar(50),
subcate nvarchar(50),
maintenance nvarchar(50)
);
