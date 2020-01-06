USE northwind;

UPDATE customers
SET city = 'Braga', state_province = 'BRA', country_region = 'PT'
WHERE id = 1;

-- REVERT #1
UPDATE customers
SET city = 'Seattle', state_province = 'WA', country_region = 'USA'
WHERE id = 1;

SELECT * FROM customers;

INSERT INTO orders(employee_id,customer_id,order_date,shipped_date,shipper_id,ship_name
,ship_address,ship_city,ship_state_province,ship_zip_postal_code,ship_country_region,shipping_fee
,taxes,payment_type,paid_date,notes,tax_rate,tax_status_id,status_id)
VALUES(3,2,'2019-12-01 16:27:00','2020-01-04 16:27:00',2,'Ricardo Milhazes',
		'Rua Padre Antonio Vieira','Braga','BRA','4715','PT',
	   10.0000,0.0000,'Check', '2020-01-04 16:31:00', null, 0, null, 3);
       
-- REVERT #2
DELETE FROM orders WHERE id = 82;
ALTER TABLE orders AUTO_INCREMENT = 81;

SELECT * FROM orders;

INSERT INTO order_details (order_id,product_id,quantity,unit_price,discount,status_id,date_allocated,
purchase_order_id,inventory_id)
VALUES(82,93, 200.0000, 4.0000, 0, 2, null, null, null);

-- REVERT #3
DELETE FROM order_details WHERE id = 92;
ALTER TABLE order_details auto_increment = 91;

SELECT * FROM order_details;
