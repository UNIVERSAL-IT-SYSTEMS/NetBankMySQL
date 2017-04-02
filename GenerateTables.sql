-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema DTUGRP16
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DTUGRP16` DEFAULT CHARACTER SET utf8 ;
USE `DTUGRP16` ;

-- -----------------------------------------------------
-- Table `DTUGRP16`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Client` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Client` (
  `clientID` INT NOT NULL,
  `cpr` CHAR(10) NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(30) NOT NULL,
  `banker` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `mobile` VARCHAR(16) NULL,
  `postal` INT NOT NULL,
  `street` VARCHAR(45) NULL,
  PRIMARY KEY (`clientID`),
  INDEX `fk_banker_idx` (`banker` ASC),
  INDEX `fk_place_client_idx` (`postal` ASC, `street` ASC),
  CONSTRAINT `fk_banker_client`
    FOREIGN KEY (`banker`)
    REFERENCES `DTUGRP16`.`Banker` (`bankerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_place_client`
    FOREIGN KEY (`postal` , `street`)
    REFERENCES `DTUGRP16`.`Place` (`postal` , `street`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Place`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Place` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Place` (
  `postal` INT NOT NULL,
  `city` VARCHAR(20) NOT NULL,
  `country` VARCHAR(20) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `ID` INT NOT NULL,
  PRIMARY KEY (`postal`, `street`, `ID`),
  INDEX `fk_ID_idx` (`ID` ASC),
  CONSTRAINT `fk_client_place`
    FOREIGN KEY (`ID`)
    REFERENCES `DTUGRP16`.`Client` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_branch_place`
    FOREIGN KEY (`ID`)
    REFERENCES `DTUGRP16`.`Branch` (`reg_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Bank` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Bank` (
  `reg_no` INT NOT NULL,
  `bank_name` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`reg_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Branch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Branch` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Branch` (
  `reg_no` INT NOT NULL,
  `Postal` INT NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `StreetNo` INT NOT NULL,
  `Telefon` INT NULL,
  PRIMARY KEY (`reg_no`, `Postal`),
  INDEX `fk_Bank_Place1_idx` (`Postal` ASC),
  INDEX `fk_BankInfo_RegNo1_idx` (`reg_no` ASC),
  CONSTRAINT `fk_place_branch`
    FOREIGN KEY (`Postal`)
    REFERENCES `DTUGRP16`.`Place` (`postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bank_branch`
    FOREIGN KEY (`reg_no`)
    REFERENCES `DTUGRP16`.`Bank` (`reg_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Banker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Banker` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Banker` (
  `bankerID` INT NOT NULL,
  `banker_name` VARCHAR(45) NOT NULL,
  `mobile` INT NULL,
  `postal` INT NOT NULL,
  `reg_no` INT NOT NULL,
  PRIMARY KEY (`bankerID`),
  INDEX `fk_Banker_BankInfo1_idx` (`postal` ASC, `reg_no` ASC),
  CONSTRAINT `fk_branch_banker`
    FOREIGN KEY (`postal` , `reg_no`)
    REFERENCES `DTUGRP16`.`Branch` (`Postal` , `reg_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Account Type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Account Type` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Account Type` (
  `account_type` VARCHAR(20) NOT NULL,
  `reg_no` INT NOT NULL,
  `interest_rate` DECIMAL(5,2) NULL,
  PRIMARY KEY (`account_type`, `reg_no`),
  INDEX `fk_Interests_RegNo1_idx` (`reg_no` ASC),
  CONSTRAINT `fk_bank_account_type`
    FOREIGN KEY (`reg_no`)
    REFERENCES `DTUGRP16`.`Bank` (`reg_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Account` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Account` (
  `account_number` INT NOT NULL,
  `reg_no` INT NOT NULL,
  `clientID` INT NOT NULL,
  `balance` DECIMAL(5,2) NOT NULL,
  `account_type` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`account_number`, `reg_no`, `clientID`),
  INDEX `fk_reg_no_idx` (`reg_no` ASC),
  INDEX `fk_account_type_idx` (`account_type` ASC),
  INDEX `fk_Account_Client1_idx` (`clientID` ASC),
  CONSTRAINT `fk_bank_account`
    FOREIGN KEY (`reg_no`)
    REFERENCES `DTUGRP16`.`Bank` (`reg_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_account_type_account`
    FOREIGN KEY (`account_type`)
    REFERENCES `DTUGRP16`.`Account Type` (`account_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_account`
    FOREIGN KEY (`clientID`)
    REFERENCES `DTUGRP16`.`Client` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Valuta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Valuta` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Valuta` (
  `Country` VARCHAR(20) NOT NULL,
  `currency` DECIMAL(5,2) NULL,
  PRIMARY KEY (`Country`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Transaction` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Transaction` (
  `transactionID` INT NOT NULL AUTO_INCREMENT,
  `account_number` INT NOT NULL,
  `date_of_transaction` DATE NOT NULL,
  `recieve_account` VARCHAR(20) NOT NULL,
  `value` DECIMAL(5,2) NOT NULL,
  `valuta` VARCHAR(20) NOT NULL,
  `note` MEDIUMTEXT NULL,
  PRIMARY KEY (`transactionID`, `account_number`),
  INDEX `fk_account_number_idx` (`account_number` ASC),
  INDEX `fk_valuta_idx` (`valuta` ASC),
  CONSTRAINT `fk_account_number`
    FOREIGN KEY (`account_number`)
    REFERENCES `DTUGRP16`.`Account` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_valuta`
    FOREIGN KEY (`valuta`)
    REFERENCES `DTUGRP16`.`Valuta` (`Country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;