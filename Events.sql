USE `DTUGRP16`;

SET GLOBAL event_scheduler = 1;

CREATE EVENT updateTransactionDays
ON SCHEDULE EVERY 1 DAY
DO UPDATE Transaction SET DaysSince = daysSinceTransaction((SELECT DateOfTransaction FROM Transaction));