USE data_warehouse;

INSERT INTO dim_customer(customer_id,company,name,city,state,country)
SELECT * FROM retention_area.ra_customer r
ON DUPLICATE KEY
UPDATE
	company = r.company,
    name = r.name,
    city = r.city,
    state = r.state,
    country = r.country;

SELECT * FROM dim_customer;

INSERT INTO dim_shipper(shipper_id,company)
SELECT * FROM retention_area.ra_shipper r
ON DUPLICATE KEY
UPDATE
	company = r.company;

SELECT * FROM dim_shipper;

INSERT INTO dim_order_status(order_status_id,status)
SELECT * FROM retention_area.ra_order_status r
ON DUPLICATE KEY
UPDATE
	status = r.status;

SELECT * FROM dim_order_status;

INSERT INTO dim_purchase_status(purchase_status_id,status)
SELECT * FROM retention_area.ra_purchase_status r
ON DUPLICATE KEY
UPDATE
	status = r.status;
    
SELECT * FROM dim_purchase_status;

INSERT INTO dim_supplier(supplier_id,company,name)
SELECT * FROM retention_area.ra_supplier r
ON DUPLICATE KEY
UPDATE
	company = r.company,
    name = r.name;
    
SELECT * FROM dim_supplier;

INSERT INTO dim_employee(employee_id,company,name)
SELECT * FROM retention_area.ra_employee r
ON DUPLICATE KEY
UPDATE
	company = r.company,
    name = r.name;
    
SELECT * FROM dim_employee;

INSERT INTO dim_category(category_id,description)
SELECT * FROM retention_area.ra_category r
ON DUPLICATE KEY
UPDATE
	description = r.description;

SELECT * FROM dim_category;

INSERT INTO dim_product(product_id,product_code,product_name,standard_cost,list_price,reorder_level,target_level,dim_category_category_id)
SELECT * FROM retention_area.ra_product r
ON DUPLICATE KEY
UPDATE
	product_code = r.product_code,
    product_name = r.product_name,
    standard_cost = r.standard_cost,
    list_price = r.list_price,
    reorder_level = r.reorder_level,
    target_level = r.target_level,
    dim_category_category_id = r.dim_category;

SELECT * FROM dim_product;

INSERT INTO dim_payment_method(payment_method_id,method)
SELECT * FROM retention_area.ra_payment_method r
ON DUPLICATE KEY
UPDATE
	method = r.method;

SELECT * FROM dim_payment_method;

INSERT INTO dim_time(time_id,value,day,month,year,day_of_the_week,week_year) 
SELECT * FROM retention_area.ra_time r
ON DUPLICATE KEY
UPDATE
	value = r.value,
    day = r.day,
    month = r.month,
    year = r.year,
    day_of_the_week = r.day_of_the_week,
    week_year = r.week_year;

SELECT * FROM dim_time;