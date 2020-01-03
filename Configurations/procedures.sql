USE retention_area;

DELIMITER $$

CREATE FUNCTION getData(date1 DATETIME)
RETURNS INT(11)
DETERMINISTIC
BEGIN
	DECLARE id INT(11);
    
	SELECT t.time_id
    INTO id
    FROM ra_time t
    WHERE date1 >= t.value AND date1 <= t.value;
    
    RETURN id;
    
END $$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION getType(tipo1 VARCHAR(50))
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE tipo VARCHAR(45);
    
	SELECT p.payment_method_id
    INTO tipo
    FROM ra_payment_method p
    WHERE p.method = tipo1;
    
    RETURN tipo;
    
END $$

DELIMITER ;