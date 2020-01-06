USE retention_area;

INSERT INTO ra_customer(customer_id,company,name,city,state,country)
SELECT id,company,(concat(first_name,' ',last_name)),city,state_province,country_region
FROM northwind.customers;

SELECT * FROM ra_customer;

INSERT INTO ra_shipper(shipper_id,company)
SELECT id,company
FROM northwind.shippers;

SELECT * FROM ra_shipper;

INSERT INTO ra_order_status(order_status_id,status)
SELECT id,status_name
FROM northwind.orders_status;

SELECT * FROM ra_order_status;

INSERT INTO ra_purchase_status
SELECT id,status
FROM northwind.purchase_order_status;

SELECT * FROM retention_area.ra_purchase_status;

INSERT INTO ra_supplier(supplier_id,company,name)
SELECT id,company,(concat(first_name,' ',last_name))
FROM northwind.suppliers;

SELECT * FROM ra_supplier;

INSERT INTO ra_employee(employee_id,company,name)
SELECT id, company, (concat(first_name,' ',last_name))
FROM northwind.employees;

SELECT * FROM ra_employee;

INSERT INTO ra_category(description)
SELECT DISTINCT category
FROM northwind.products;

SELECT * FROM ra_category;

INSERT INTO ra_product(product_id,product_code,product_name,standard_cost,list_price,reorder_level,target_level,dim_category)
SELECT p.id,p.product_code,p.product_name,p.standard_cost,p.list_price,p.reorder_level,p.target_level, c.category_id
FROM northwind.products p, retention_area.ra_category c
WHERE p.category = c.description;

SELECT * FROM ra_product;

INSERT INTO ra_payment_method(method)
SELECT DISTINCT payment_type
FROM northwind.orders
WHERE payment_type IS NOT NULL;

SELECT * FROM ra_payment_method;

INSERT INTO ra_time(value,day,month,year,day_of_the_week,week_year)
SELECT result, day(CONVERT(result,DATETIME)), month(CONVERT(result,DATETIME)), year(CONVERT(result,DATETIME)), dayofweek(CONVERT(result,DATETIME)), week(CONVERT(result,DATETIME)) FROM ( SELECT submitted_date as result FROM northwind.purchase_orders UNION DISTINCT SELECT creation_date FROM northwind.purchase_orders UNION DISTINCT SELECT expected_date FROM northwind.purchase_orders UNION DISTINCT SELECT payment_date FROM northwind.purchase_orders UNION DISTINCT SELECT approved_date FROM northwind.purchase_orders UNION DISTINCT SELECT order_date FROM northwind.orders UNION DISTINCT SELECT shipped_Date FROM northwind.orders UNION DISTINCT SELECT paid_date FROM northwind.orders ) as x WHERE result IS NOT NULL;

SELECT * FROM ra_time;

INSERT INTO ra_purchase_orders(purchase_order_id,payment_amount,quantity,posted_to_inventory,supplier_id,status_id,created_by,
							  submitted_date,creation_date,expected_date,payment_date,approved_date,product,data_received)
SELECT p.id, (d.quantity*d.unit_cost), d.quantity, d.posted_to_inventory, p.supplier_id, p.status_id, p.created_by,
if(p.submitted_date is not null, getData(p.submitted_date), NULL),
if(p.creation_date is not null, getData(p.creation_date), NULL),
if(p.expected_date is not null, getData(p.expected_date), NULL), 
if(p.payment_date is not null, getData(p.payment_date), NULL), 
if(p.approved_date is not null, getData(p.approved_date), NULL), 
d.product_id, 
if(d.date_received is not null, getData(d.date_received), NULL)
FROM northwind.purchase_orders p, northwind.purchase_order_details d
WHERE p.id = d.purchase_order_id;
      
SELECT * FROM ra_purchase_orders;

SELECT * FROM northwind.orders;

INSERT INTO ra_order(order_id,quantity,unit_price,shipping_fee,taxes,employee_id,customer_id,
					order_date,shipped_date,shipper_id,paid_date,order_status_id,product,payment_method)
SELECT o.id, d.quantity, d.unit_price, o.shipping_fee, o.taxes, o.employee_id, o.customer_id,
if(o.order_date is not null, getData(o.order_date), NULL),
if(o.shipped_date is not null, getData(o.shipped_date),NULL),
o.shipper_id,
if(o.paid_date is not null, getData(o.paid_date),NULL),
o.status_id, d.product_id,
if(o.payment_type is not null, getType(o.payment_type),NULL)
FROM northwind.orders o, northwind.order_details d
WHERE o.id = d.order_id;

SELECT * FROM retention_area.ra_order;