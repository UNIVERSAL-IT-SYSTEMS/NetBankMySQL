-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Place`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Place` (`Postal`, `Country`, `City`) VALUES (2077, 'Australia', 'Hornsby');
INSERT INTO `DTUGRP16`.`Place` (`Postal`, `Country`, `City`) VALUES (8600, 'Denmark', 'Silkeborg');
INSERT INTO `DTUGRP16`.`Place` (`Postal`, `Country`, `City`) VALUES (2750, 'Denmark', 'Ballerup');
INSERT INTO `DTUGRP16`.`Place` (`Postal`, `Country`, `City`) VALUES (2800, 'Denmark', 'Kgs. Lyngby');
INSERT INTO `DTUGRP16`.`Place` (`Postal`, `Country`, `City`) VALUES (4760, 'Denmark', 'Vordingborg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Branch`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Branch` (`RegNo`, `BankName`, `Postal`, `Country`, `Street`, `Telefon`) VALUES (7170, 'Jyske Bank', 8600, 'Denmark', 'Vestergade 8', NULL);
INSERT INTO `DTUGRP16`.`Branch` (`RegNo`, `BankName`, `Postal`, `Country`, `Street`, `Telefon`) VALUES (0400, 'Lån og Spar', 2800, 'Denmark', 'Hovedkontoret', NULL);
INSERT INTO `DTUGRP16`.`Branch` (`RegNo`, `BankName`, `Postal`, `Country`, `Street`, `Telefon`) VALUES (6220, 'Lollans Bank', 4760, 'Denmark', 'Ulvestien 6', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Banker`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Banker` (`BankerID`, `BankerName`, `Mobile`, `RegNo`) VALUES (NULL, 'Alexander', NULL, 6220);
INSERT INTO `DTUGRP16`.`Banker` (`BankerID`, `BankerName`, `Mobile`, `RegNo`) VALUES (NULL, 'Emilie', 30143783, 7170);
INSERT INTO `DTUGRP16`.`Banker` (`BankerID`, `BankerName`, `Mobile`, `RegNo`) VALUES (NULL, 'Simon', NULL, 0400);

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Client`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Client` (`ClientID`, `CPR`, `FirstName`, `LastName`, `Email`, `Mobile`, `Street`, `BankerID`, `Postal`, `Country`) VALUES ('00000000C', '1304881115', 'Allan', 'Allansen', 'allall@DTU.dk', '25555266', 'Australia Way', '000002B', 2077, 'Australia');
INSERT INTO `DTUGRP16`.`Client` (`ClientID`, `CPR`, `FirstName`, `LastName`, `Email`, `Mobile`, `Street`, `BankerID`, `Postal`, `Country`) VALUES (NULL, '1212459999', 'Børge', 'Børgesen', 'børbør@DTU.dk', '22666677', 'Sydney Avenue', '000002B', 2077, 'Australia');
INSERT INTO `DTUGRP16`.`Client` (`ClientID`, `CPR`, `FirstName`, `LastName`, `Email`, `Mobile`, `Street`, `BankerID`, `Postal`, `Country`) VALUES (NULL, '1111944225', 'Carsten', 'Carstensen', 'carcar@DTU.dk', '22227777', 'Silkeborg Alle', '000002B', 8600, 'Denmark');
INSERT INTO `DTUGRP16`.`Client` (`ClientID`, `CPR`, `FirstName`, `LastName`, `Email`, `Mobile`, `Street`, `BankerID`, `Postal`, `Country`) VALUES (NULL, '0202900291', 'Danny', 'Dansen', 'dandan@DTU.dk', '32666699', 'Randersvej', '000001B', 4760, 'Denmark');
INSERT INTO `DTUGRP16`.`Client` (`ClientID`, `CPR`, `FirstName`, `LastName`, `Email`, `Mobile`, `Street`, `BankerID`, `Postal`, `Country`) VALUES (NULL, '0511898242', 'Emma', 'Emmalius', 'emmemm@DTU.dk', '33662336', 'Ballevej', '000003B', 2750, 'Denmark');
INSERT INTO `DTUGRP16`.`Client` (`ClientID`, `CPR`, `FirstName`, `LastName`, `Email`, `Mobile`, `Street`, `BankerID`, `Postal`, `Country`) VALUES (NULL, '1601930834', 'Freya', 'Freybar', 'frefre@DTU.dk', '33377733', 'Hovedgaden', '000001B', 2800, 'Denmark');

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Currency`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Currency` (`Currency`, `ExchangeRate`) VALUES ('Danish Krone', 7.44);
INSERT INTO `DTUGRP16`.`Currency` (`Currency`, `ExchangeRate`) VALUES ('Amerikan Dollor', 1.07);
INSERT INTO `DTUGRP16`.`Currency` (`Currency`, `ExchangeRate`) VALUES ('Australian Dollor', 1.41);
INSERT INTO `DTUGRP16`.`Currency` (`Currency`, `ExchangeRate`) VALUES ('Euro', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Account Type`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Savings', 7170, 1.01);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Student', 7170, 1.025);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Deposit', 7170, 1);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Pension', 6220, 1.055);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Children\'s Savings', 0400, 1.07);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Savings', 6220, 1.035);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Student', 6220, 1.03);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Savings', 0400, 1.03);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Deposit', 6220, 1);
INSERT INTO `DTUGRP16`.`Account Type` (`AccountType`, `RegNo`, `InterestRate`) VALUES ('Deposit', 0400, 1.001);

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Account`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Account` (`AccountNumber`, `RegNo`, `AccountType`, `ClientID`, `Balance`) VALUES ('0004567899', 7170, 'Student', '00000001C', 1572.56);
INSERT INTO `DTUGRP16`.`Account` (`AccountNumber`, `RegNo`, `AccountType`, `ClientID`, `Balance`) VALUES ('0004567898', 7170, 'Savings', '00000001C', 30401);
INSERT INTO `DTUGRP16`.`Account` (`AccountNumber`, `RegNo`, `AccountType`, `ClientID`, `Balance`) VALUES ('0003232312', 0400, 'Children\'s Savings', '00000002C', 55765.2);
INSERT INTO `DTUGRP16`.`Account` (`AccountNumber`, `RegNo`, `AccountType`, `ClientID`, `Balance`) VALUES ('0000567199', 0400, 'Savings', '00000004C', 8500);
INSERT INTO `DTUGRP16`.`Account` (`AccountNumber`, `RegNo`, `AccountType`, `ClientID`, `Balance`) VALUES ('0000561399', 6220, 'Deposit', '00000005C', 520.5);
INSERT INTO `DTUGRP16`.`Account` (`AccountNumber`, `RegNo`, `AccountType`, `ClientID`, `Balance`) VALUES ('0000123433', 6220, 'Student', '00000004C', 862.82);
INSERT INTO `DTUGRP16`.`Account` (`AccountNumber`, `RegNo`, `AccountType`, `ClientID`, `Balance`) VALUES ('0000124534', 6220, 'Pension', '00000003C', 95000);

COMMIT;


-- -----------------------------------------------------
-- Data for table `DTUGRP16`.`Transaction`
-- -----------------------------------------------------
START TRANSACTION;
USE `DTUGRP16`;
INSERT INTO `DTUGRP16`.`Transaction` (`TransactionID`, `AccountNumber`, `RegNo`, `DateOfTransaction`, `DaysSince`, `RecieveAccount`, `RecieveRegNo`, `Value`, `Currency`, `Note`) VALUES (DEFAULT, '0004567899', 7170, '2017-01-01', NULL, 0000567199, 0400, 995, 'Danish Krone', 'Det blev en dyr nytårsaften!');
INSERT INTO `DTUGRP16`.`Transaction` (`TransactionID`, `AccountNumber`, `RegNo`, `DateOfTransaction`, `DaysSince`, `RecieveAccount`, `RecieveRegNo`, `Value`, `Currency`, `Note`) VALUES (DEFAULT, '0000567199', 0400, '2017-02-03', NULL, 0000123433, 0400, 5000, 'Danish Krone', 'Så bliver der råd til den nye seng alligevel');

COMMIT;