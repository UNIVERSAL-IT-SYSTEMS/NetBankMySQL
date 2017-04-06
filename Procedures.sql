USE `DTUGRP16`;

DROP PROCEDURE IF EXISTS Transfer;

DELIMITER //
CREATE PROCEDURE Transfer(
	IN accountOut INT, accountIn INT, amount DECIMAL(9,2), OUT status VARCHAR(45))
    BEGIN
		DECLARE oldBalanceOut, newBalanceOut, oldBalanceIn, newBalanceIn DECIMAL(10,2) DEFAULT 0;
        START TRANSACTION;
			SET oldBalanceOut = (SELECT Balance FROM Account WHERE AccountNo = accountOut);
            SET newBalanceOut = oldBalanceOut - amount;
            IF newBalanceOut < 0 THEN
				SET newBalanceOut = oldBalanceOut;
			END IF;
UPDATE Account 
SET 
    Balance = newBalanceOut
WHERE
    AccountNo = accountOut;
            
			SET oldBalanceIn = (SELECT Balance FROM Account WHERE AccountNo = accountIn);
            SET newBalanceIn = oldBalanceIn + amount;
UPDATE Account 
SET 
    Balance = newBalanceIn
WHERE
    AccountNo = accountIn;
            
            IF (oldBalanceOut + oldBalanceIn) = (newBalanceOut + newBalanceIn) THEN
				SET status = "Transferred Succesfully";
                COMMIT;
			ELSE
				ROLLBACK;
			END IF;
	END //
DELIMITER ;
        