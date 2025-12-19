-- 1. categories table:
---- index on category_name for faster lookups.
create index if not exists idx_category_name on public.categories (category_name);

-- 2. customers table:
---- index on customer_name for faster lookups.
create index if not exists idx_customer_name on public.customers (customer_name);

-- 3. employees table:
---- composite index on last_name and first_name for faster lookups.
create index if not exists idx_employee_name on public.employees (last_name, first_name);

-- 4. orders table: 
---- index on cus_id for faster joins with the customers table. 
---- index on emp_id for faster joins with the employees table. 
---- index on shp_id for faster joins with the shippers table.
create index if not exists idx_orders_cus_id on public.orders (cus_id);
create index if not exists idx_orders_emp_id on public.orders (emp_id);
create index if not exists idx_orders_shp_id on public.orders (shp_id);

-- 5. products table:
---- index on cat_id for faster joins with the categories table.
---- index on sup_id for faster joins with the suppliers table.
create index if not exists idx_products_cat_id on public.products (cat_id);
create index if not exists idx_products_sup_id on public.products (sup_id);

-- 6. order_details table:
---- index on ord_id for faster joins with the orders table.
---- index on prd_id for faster joins with the products table.
create index if not exists idx_order_details_ord_id on public.order_details (ord_id);
create index if not exists idx_order_details_prd_id on public.order_details (prd_id);