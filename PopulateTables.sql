USE DTUGRP16;

-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`User`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Banker');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Client');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Banker');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Client');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Client');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Client');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Client');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Banker');
INSERT INTO `DTUGRP16`.`User` (`userID`, `password`, `type`) VALUES (DEFAULT, '123abc', 'Client');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Place`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Place` (`postal`, `city`, `country`) VALUES (2077, 'Hornsby', 'Australia');
INSERT INTO `DTUGRP16`.`Place` (`postal`, `city`, `country`) VALUES (8600, 'Silkeborg', 'Denmark');
INSERT INTO `DTUGRP16`.`Place` (`postal`, `city`, `country`) VALUES (2750, 'Ballerup', 'Denmark');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Banker`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Banker` (`bankerID`, `banker_name`, `postal`) VALUES (1, 'Alexander', 2077);
INSERT INTO `DTUGRP16`.`Banker` (`bankerID`, `banker_name`, `postal`) VALUES (3, 'Emilie', 8600);
INSERT INTO `DTUGRP16`.`Banker` (`bankerID`, `banker_name`, `postal`) VALUES (8, 'Simon', 2750);

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Client`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Client` (`clientID`, `cpr`, `first_name`, `last_name`, `banker`, `email`, `mobile`, `postal`, `street`, `street_no`) VALUES (2, '1304881115', 'Allan', 'Allansen', 1, 'allall@DTU.dk', '25555266', 2077, 'Australia Way', '323');
INSERT INTO `DTUGRP16`.`Client` (`clientID`, `cpr`, `first_name`, `last_name`, `banker`, `email`, `mobile`, `postal`, `street`, `street_no`) VALUES (4, '1212459999', 'Børge', 'Børgesen', 1, 'børbør@DTU.dk', '22666677', 2077, 'Sydney Avenue', '45');
INSERT INTO `DTUGRP16`.`Client` (`clientID`, `cpr`, `first_name`, `last_name`, `banker`, `email`, `mobile`, `postal`, `street`, `street_no`) VALUES (5, '1111944225', 'Carsten', 'Carstensen', 3, 'carcar@DTU.dk', '22227777', 8600, 'Silkeborg Alle', '12');
INSERT INTO `DTUGRP16`.`Client` (`clientID`, `cpr`, `first_name`, `last_name`, `banker`, `email`, `mobile`, `postal`, `street`, `street_no`) VALUES (6, '0202900291', 'Danny', 'Dansen', 3, 'dandan@DTU.dk', '32666699', 8600, 'Randersvej', '2');
INSERT INTO `DTUGRP16`.`Client` (`clientID`, `cpr`, `first_name`, `last_name`, `banker`, `email`, `mobile`, `postal`, `street`, `street_no`) VALUES (7, '0511898242', 'Emma', 'Emmalius', 8, 'emmemm@DTU.dk', '33662336', 2750, 'Ballevej', '9');
INSERT INTO `DTUGRP16`.`Client` (`clientID`, `cpr`, `first_name`, `last_name`, `banker`, `email`, `mobile`, `postal`, `street`, `street_no`) VALUES (9, '1601930834', 'Freya', 'Freybar', 8, 'frefre@DTU.dk', '33377733', 2750, 'Hovedgaden', '128');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Interests`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Interests` (`account_type`, `interest_rate`) VALUES ('Opsparing', NULL);
INSERT INTO `DTUGRP16`.`Interests` (`account_type`, `interest_rate`) VALUES ('Studie', NULL);
INSERT INTO `DTUGRP16`.`Interests` (`account_type`, `interest_rate`) VALUES ('Indlån', NULL);
INSERT INTO `DTUGRP16`.`Interests` (`account_type`, `interest_rate`) VALUES ('Pensions', NULL);
INSERT INTO `DTUGRP16`.`Interests` (`account_type`, `interest_rate`) VALUES ('Børne', NULL);
INSERT INTO `DTUGRP16`.`Interests` (`account_type`, `interest_rate`) VALUES ('SuperRente', 100);
INSERT INTO `DTUGRP16`.`Interests` (`account_type`, `interest_rate`) VALUES ('Ekstra', NULL);

COMMIT;
