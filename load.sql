USE data_warehouse;

INSERT INTO dim_customer(customer_id,company,name,city,state,country)
SELECT * FROM retention_area.ra_customer;

SELECT * FROM dim_customer;

INSERT INTO dim_shipper(shipper_id,company)
SELECT * FROM retention_area.ra_shipper;

SELECT * FROM dim_shipper;

INSERT INTO dim_order_status(order_status_id,status)
SELECT * FROM retention_area.ra_order_status;

SELECT * FROM dim_order_status;

INSERT INTO dim_purchase_status
SELECT * FROM retention_area.ra_purchase_status;

SELECT * FROM dim_purchase_status;

INSERT INTO dim_supplier
SELECT * FROM retention_area.ra_supplier;

SELECT * FROM dim_supplier;

INSERT INTO dim_employee
SELECT * FROM retention_area.ra_employee;

SELECT * FROM dim_employee;

INSERT INTO dim_category
SELECT * FROM retention_area.ra_category;

SELECT * FROM dim_category;

INSERT INTO dim_product
SELECT * FROM retention_area.ra_product;

SELECT * FROM dim_product;

INSERT INTO dim_payment_method
SELECT * FROM retention_area.ra_payment_method;

SELECT * FROM dim_payment_method;

INSERT INTO dim_time 
SELECT * FROM retention_area.ra_time;

SELECT * FROM dim_time;

ALTER TABLE fact_purchase_orders MODIFY purchase_order_key INT(11) auto_increment;

INSERT INTO fact_purchase_orders(purchase_order_id,payment_amount,quantity,posted_to_inventory,supplier_id,
status_id,created_by,submitted_date,creation_date,expected_date,payment_date,approved_date,product,
data_received)
SELECT * FROM retention_area.ra_purchase_orders;

SELECT * FROM fact_purchase_orders;

ALTER TABLE fact_order MODIFY order_key INT(11) auto_increment;

INSERT INTO fact_order(order_id,quantity,unit_price,shipping_fee,taxes,employee_id
,customer_id,order_date,shipped_date,shipper_id,paid_date,order_status_id,product,payment_method)
SELECT * FROM retention_area.ra_order;

SELECT * FROM fact_order;