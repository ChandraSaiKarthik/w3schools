create sequence if not exists public.categories_category_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.categories
(
    category_id   int not null default nextval('public.categories_category_id_seq'::regclass),
    category_name varchar(50) null,
    description   varchar(100) null,
    created_at    timestamp null default now(),
    created_by    varchar(50) null default user,
    updated_at    timestamp null,
    updated_by    varchar(50) null,
    constraint pk_category_id primary key (category_id),
    constraint uk_category_name unique (category_name)
); /*LVL:0*/

create sequence if not exists public.customers_customer_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.customers
(
    customer_id   int not null default nextval('public.customers_customer_id_seq'::regclass),
    customer_name varchar(50) null,
    contact_name  varchar(50) null,
    address       varchar(50) null,
    city          varchar(50) null,
    postal_code   varchar(50) null,
    country       varchar(50) null,
    created_at    timestamp null default now(),
    created_by    varchar(50) null default user,
    updated_at    timestamp null,
    updated_by    varchar(50) null,
    constraint pk_customer_id primary key (customer_id),
    constraint uk_customer_name unique (customer_name)
); /*LVL:0*/

create sequence if not exists public.employees_employee_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.employees
(
    employee_id int not null default nextval('public.employees_employee_id_seq'::regclass),
    last_name   varchar(50) null,
    first_name  varchar(50) null,
    birth_date  date null,
    photo       varchar(50) null,
    notes       varchar(4000) null,
    created_at  timestamp null default now(),
    created_by  varchar(50) null default user,
    updated_at  timestamp null,
    updated_by  varchar(50) null,
    constraint pk_employee_id primary key (employee_id),
    constraint uk_employee_name unique (first_name, last_name)
); /*LVL:0*/

create sequence if not exists public.shippers_shipper_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.shippers
(
    shipper_id   int not null default nextval('public.shippers_shipper_id_seq'::regclass),
    shipper_name varchar(50) null,
    phone        varchar(15) null,
    created_at   timestamp null default now(),
    created_by   varchar(50) null default user,
    updated_at   timestamp null,
    updated_by   varchar(50) null,
    constraint pk_shipper_id primary key (shipper_id),
    constraint uk_shipper_name unique (shipper_name)
); /*LVL:0*/

create sequence if not exists public.suppliers_supplier_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.suppliers
(
    supplier_id   int not null default nextval('public.suppliers_supplier_id_seq'::regclass),
    supplier_name varchar(50) null,
    contact_name  varchar(50) null,
    address       varchar(50) null,
    city          varchar(50) null,
    postal_code   varchar(50) null,
    country       varchar(50) null,
    created_at    timestamp null default now(),
    created_by    varchar(50) null default user,
    updated_at    timestamp null,
    updated_by    varchar(50) null,
    constraint pk_supplier_id primary key (supplier_id),
    constraint uk_supplier_name unique (supplier_name)
); /*LVL:0*/

create sequence if not exists public.orders_order_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.orders
(
    order_id   int not null default nextval('public.orders_order_id_seq'::regclass),
    cus_id     int null,
    emp_id     int null,
    order_date date null,
    shp_id     int null,
    created_at timestamp null default now(),
    created_by varchar(50) null default user,
    updated_at timestamp null,
    updated_by varchar(50) null,
    constraint pk_order_id primary key (order_id),
    constraint fk_orders_customer_id foreign key (cus_id) references public.customers (customer_id) on update cascade on delete cascade,
    constraint fk_orders_employee_id foreign key (emp_id) references public.employees (employee_id) on update cascade on delete cascade,
    constraint fk_orders_shipper_id foreign key (shp_id) references public.shippers (shipper_id) on update cascade on delete cascade
); /*LVL:1*/

create sequence if not exists public.products_product_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.products
(
    product_id   int not null default nextval('public.products_product_id_seq'::regclass),
    product_name varchar(50) null,
    sup_id       int null,
    cat_id       int null,
    unit         varchar(50) null,
    price        decimal(18,2) null,
    created_at   timestamp null default now(),
    created_by   varchar(50) null default user,
    updated_at   timestamp null,
    updated_by   varchar(50) null,
    constraint pk_product_id primary key (product_id),
    constraint uk_product_name unique (product_name),
    constraint fk_products_category_id foreign key (cat_id) references public.categories (category_id) on update cascade on delete cascade,
    constraint fk_products_supplier_id foreign key (sup_id) references public.suppliers (supplier_id) on update cascade on delete cascade
); /*LVL:1*/

create sequence if not exists public.order_details_order_detail_id_seq start with 1 increment by 1 no minvalue no maxvalue cache 1;
create table if not exists public.order_details
(
    order_detail_id int not null default nextval('public.order_details_order_detail_id_seq'::regclass),
    ord_id          int null,
    prd_id          int null,
    quantity        int null,
    created_at      timestamp null default now(),
    created_by      varchar(50) null default user,
    updated_at      timestamp null,
    updated_by      varchar(50) null,
    constraint pk_order_detail_id primary key (order_detail_id),
    constraint fk_order_details_order_id foreign key (ord_id) references public.orders (order_id) on update cascade on delete cascade,
    constraint fk_order_details_product_id foreign key (prd_id) references public.products (product_id) on update cascade on delete cascade
); /*LVL:2*/