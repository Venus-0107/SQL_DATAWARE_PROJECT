/*
===============================================================================
DDL Script: Create Gold Views
===============================================================================
*/



create view gold.dim_customer as

select 
row_number() over (order by cst_id) as customer_key,
ci.cst_id as customer_id,
ci.cst_key as customer_number,
ci.cst_firstname as first_name,
ci.cst_lastname as last_name,
la.cntry as country,
ci.cst_material_status as martial_status,
case when ci.cst_gndr!= 'n/a' then ci.cst_gndr
else coalesce(ca.gen,'n/a')
end as gender,
ci.cst_create_date as created_date,
ca.bdate as create_date
from silver.crm_cust_info ci
left join silver.erp_cust_az12 ca
on ci.cst_key= ca.cid
left join silver.erp_loc_a101 la
on ci.cst_key=la.cid

go

  create view gold.dim_prdoucts as 
select 
row_number() over (order by pn.prd_start_dt,pn.prd_key)as prdouct_key,
pn.prd_id as prdouct_id,
pn.prd_key as product_number,
pn.prd_nm as product_name,
pn.cat_id as category_id,
pc.cat as category,
pc.subcate as subcategory,
pc.maintenance as maintenance,
pn.prd_cost as cost,
pn.prd_line as product_line,
pn.prd_start_dt as start_date
from silver.crm_prd_info pn
left join silver.erp_px_cat_g1v2 pc on 
pn.cat_id=pc.id
where prd_end_dt is null
go
create view gold.fact_sales as

SELECT
sd.sls_ord_num as order_number,
pr.prdouct_key as product_key,
cu.customer_key as customer_key,
sd.sls_order_dt as order_date,
sd.sls_ship_dt as shipping_date,
sd.sls_due_dt as due_date,
sd.sls_sales as sales_amount,
sd.sls_quantity as quantity,
sd.sls_price as price
from silver.crm_sales_details sd
left join gold.dim_prdoucts pr
ON sd.sls_prd_key = pr.product_number
left join gold.dim_customer cu
on sd.sls_cust_id = cu.customer_id;
go
