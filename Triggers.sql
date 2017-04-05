USE `DTUGRP16`;

DROP TRIGGER IF EXISTS client_before_insert;

DELIMITER //
CREATE TRIGGER client_before_insert
	BEFORE INSERT ON Client FOR EACH ROW
    BEGIN
		DECLARE ID INTEGER;
		SET ID = (SELECT CAST(SUBSTRING(clientID, 1, 8) AS UNSIGNED) FROM Client ORDER BY clientID DESC LIMIT 1);
        IF ID > 0 THEN
			SET ID = ID + 1;
			SET New.clientID = RPAD(LPAD(ID, 8, '0'), 9, 'C');
		ELSE
			SET New.clientID = '00000001C';
		END IF;
	END; //
DELIMITER ;      

DROP TRIGGER IF EXISTS client_before_insert;

DELIMITER //
CREATE TRIGGER banker_before_insert
	BEFORE INSERT ON Banker FOR EACH ROW
    BEGIN
		DECLARE ID INTEGER;
		SET ID = (SELECT CAST(SUBSTRING(clientID, 1, 6) AS UNSIGNED) FROM Client ORDER BY clientID DESC LIMIT 1);
        IF ID > 0 THEN
			SET ID = ID + 1;
			SET New.bankerID = RPAD(LPAD(ID, 6, '0'), 7, 'B');
		ELSE
			SET New.bankerID = '000001B';
		END IF;
	END; //
DELIMITER ;    
