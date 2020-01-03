USE retention_area;

ALTER TABLE ra_time AUTO_INCREMENT = 1;
ALTER TABLE ra_payment_method AUTO_INCREMENT = 1;
ALTER TABLE ra_category AUTO_INCREMENT = 1;

INSERT INTO ra_order_status VALUES(4,'Unknown');

INSERT INTO ra_shipper VALUES(4,'Unknown');

INSERT INTO ra_payment_method VALUES(4,'Unknown');

INSERT INTO ra_time VALUES(47,'0000-00-00 00:00:00',0,0,0,0,0);

INSERT INTO ra_employee VALUES(10,'Unknown','Unknown');

DROP TRIGGER IF EXISTS nullvaluesonorders;

DELIMITER $$

CREATE TRIGGER nullvaluesonorders
BEFORE INSERT ON ra_order FOR EACH ROW
BEGIN

	IF(NEW.shipped_date IS NULL)
    THEN SET NEW.shipped_date = 47;
    END IF;
    
    IF(NEW.shipper_id IS NULL)
    THEN SET NEW.shipper_id = 4;
    END IF;
    
    IF(NEW.paid_date IS NULL)
    THEN SET NEW.paid_date = 47;
    END IF;
    
    IF(NEW.payment_method IS NULL)
    THEN SET NEW.payment_method = 4;
    END IF;
END$$

DELIMITER ;

DROP TRIGGER IF EXISTS nullvaluesonpurchaseorders;

DELIMITER $$

CREATE TRIGGER nullvaluesonpurchaseorders
BEFORE INSERT ON ra_purchase_orders FOR EACH ROW
BEGIN

	IF(NEW.created_by IS NULL) THEN 
		SET NEW.created_by = 10;
    END IF;
    
    IF(NEW.expected_date IS NULL)
    THEN SET NEW.expected_date = 47;
    END IF;
    
    IF(NEW.payment_date IS NULL)
    THEN SET NEW.payment_date = 47;
    END IF;
    
    IF(NEW.approved_date IS NULL)
    THEN SET NEW.approved_date = 47;
    END IF;
    
    IF(NEW.data_received IS NULL)
    THEN SET NEW.data_received = 47;
    END IF;
END$$

DELIMITER ;