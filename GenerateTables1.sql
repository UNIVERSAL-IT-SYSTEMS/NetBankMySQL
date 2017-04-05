-- MySQL Script generated by MySQL Workbench
-- Wed Apr  5 22:14:29 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema DTUGRP16
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DTUGRP16
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DTUGRP16` DEFAULT CHARACTER SET utf8 ;
USE `DTUGRP16` ;

-- -----------------------------------------------------
-- Table `DTUGRP16`.`Place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Place` (
  `Postal` INT NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Postal`, `Country`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Bank`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Bank` (
  `RegNo` INT NOT NULL,
  `BankName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`RegNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Branch` (
  `RegNo` INT NOT NULL,
  `Postal` INT NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Street` VARCHAR(45) NOT NULL,
  `Telefon` INT NULL,
  PRIMARY KEY (`RegNo`, `Postal`, `Country`),
  INDEX `fk_Branch_Bank_idx` (`RegNo` ASC),
  CONSTRAINT `fk_Branch_Place`
    FOREIGN KEY (`Postal` , `Country`)
    REFERENCES `DTUGRP16`.`Place` (`Postal` , `Country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Branch_Bank`
    FOREIGN KEY (`RegNo`)
    REFERENCES `DTUGRP16`.`Bank` (`RegNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Banker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Banker` (
  `BankerID` INT NOT NULL,
  `BankerName` VARCHAR(45) NOT NULL,
  `Mobile` INT NULL,
  `Postal` INT NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `RegNo` INT NOT NULL,
  PRIMARY KEY (`BankerID`),
  INDEX `fk_Banker_Branch_idx` (`Postal` ASC, `Country` ASC, `RegNo` ASC),
  CONSTRAINT `fk_Banker_Branch`
    FOREIGN KEY (`Postal` , `Country` , `RegNo`)
    REFERENCES `DTUGRP16`.`Branch` (`Postal` , `Country` , `RegNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Client` (
  `ClientID` CHAR(9) NOT NULL,
  `CPR` CHAR(10) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `Banker` INT NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Mobile` VARCHAR(45) NULL,
  `Street` VARCHAR(45) NULL,
  `Postal` INT NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ClientID`),
  INDEX `fk_Client_Banker_idx` (`Banker` ASC),
  INDEX `fk_Client_Place_idx` (`Postal` ASC, `Country` ASC),
  CONSTRAINT `fk_Client_Banker`
    FOREIGN KEY (`Banker`)
    REFERENCES `DTUGRP16`.`Banker` (`BankerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Place`
    FOREIGN KEY (`Postal` , `Country`)
    REFERENCES `DTUGRP16`.`Place` (`Postal` , `Country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Currency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Currency` (
  `Country` VARCHAR(45) NOT NULL,
  `Value` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`Country`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Account Type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Account Type` (
  `AccountType` VARCHAR(45) NOT NULL,
  `RegNo` INT NOT NULL,
  `InterestRate` DECIMAL(5,2) NULL,
  PRIMARY KEY (`AccountType`, `RegNo`),
  INDEX `fk_AccountType_Bank_idx` (`RegNo` ASC),
  CONSTRAINT `fk_Interests_Bank`
    FOREIGN KEY (`RegNo`)
    REFERENCES `DTUGRP16`.`Bank` (`RegNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Account` (
  `AccountNumber` INT NOT NULL,
  `RegNo` INT NOT NULL,
  `ClientID` CHAR(9) NOT NULL,
  `Balance` DECIMAL(10,2) NOT NULL,
  `AccountType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AccountNumber`, `RegNo`),
  INDEX `fk_Account_Client_idx` (`ClientID` ASC),
  INDEX `fk_Account_AccountType_idx` (`AccountType` ASC),
  INDEX `fk_Account_Bank_idx` (`RegNo` ASC),
  CONSTRAINT `fk_Account_Client`
    FOREIGN KEY (`ClientID`)
    REFERENCES `DTUGRP16`.`Client` (`ClientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_AccountType`
    FOREIGN KEY (`AccountType`)
    REFERENCES `DTUGRP16`.`Account Type` (`AccountType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Account_Bank`
    FOREIGN KEY (`RegNo`)
    REFERENCES `DTUGRP16`.`Bank` (`RegNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Transaction` (
  `TransactionID` INT NOT NULL AUTO_INCREMENT,
  `AccountNumber` INT NOT NULL,
  `RegNo` INT NOT NULL,
  `DateOfTransaction` DATE NOT NULL,
  `DaysSince` INT NULL,
  `RecieveAccount` VARCHAR(45) NOT NULL,
  `Value` DECIMAL(9,2) NOT NULL,
  `Note` MEDIUMTEXT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TransactionID`, `AccountNumber`, `RegNo`),
  INDEX `fk_Transaction_Currency_idx` (`Country` ASC),
  INDEX `fk_Transaction_Account_idx` (`AccountNumber` ASC, `RegNo` ASC),
  CONSTRAINT `fk_Transaction_Currency`
    FOREIGN KEY (`Country`)
    REFERENCES `DTUGRP16`.`Currency` (`Country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_Account`
    FOREIGN KEY (`AccountNumber` , `RegNo`)
    REFERENCES `DTUGRP16`.`Account` (`AccountNumber` , `RegNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `DTUGRP16`;

DELIMITER $$
USE `DTUGRP16`$$
CREATE DEFINER = CURRENT_USER TRIGGER `DTUGRP16`.`Client_BEFORE_INSERT` BEFORE INSERT ON `Client` FOR EACH ROW
BEGIN

END
$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
