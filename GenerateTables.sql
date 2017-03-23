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
-- Table `DTUGRP16`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`User` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`User` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(45) NOT NULL,
  `type` ENUM('Banker', 'Client') NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE INDEX `UserID_UNIQUE` (`userID` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Place`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Place` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Place` (
  `postal` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`postal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Banker`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Banker` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Banker` (
  `bankerID` INT NOT NULL,
  `banker_name` VARCHAR(45) NOT NULL,
  `postal` INT NOT NULL,
  PRIMARY KEY (`bankerID`),
  INDEX `fk_postal_idx` (`postal` ASC),
  CONSTRAINT `fk_userID_banker`
    FOREIGN KEY (`bankerID`)
    REFERENCES `DTUGRP16`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postal_banker`
    FOREIGN KEY (`postal`)
    REFERENCES `DTUGRP16`.`Place` (`postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Client` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Client` (
  `clientID` INT NOT NULL,
  `cpr` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `banker` INT NOT NULL,
  `email` VARCHAR(45) NULL,
  `mobile` VARCHAR(45) NULL,
  `postal` INT NOT NULL,
  `street` VARCHAR(45) NULL,
  `street_no` VARCHAR(45) NULL,
  PRIMARY KEY (`clientID`),
  INDEX `fk_banker_idx` (`banker` ASC),
  INDEX `fk_city_idx` (`postal` ASC),
  CONSTRAINT `fk_userID_client`
    FOREIGN KEY (`clientID`)
    REFERENCES `DTUGRP16`.`User` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_banker`
    FOREIGN KEY (`banker`)
    REFERENCES `DTUGRP16`.`Banker` (`bankerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_postal_client`
    FOREIGN KEY (`postal`)
    REFERENCES `DTUGRP16`.`Place` (`postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`RegNo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`RegNo` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`RegNo` (
  `reg_no` INT NOT NULL,
  `bank_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`reg_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Account` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Account` (
  `account_number` INT NOT NULL,
  `reg_no` INT NOT NULL,
  `clientID` INT NOT NULL,
  `balance` DECIMAL(5,2) ZEROFILL NULL,
  `interest_rate` DECIMAL(5,2) ZEROFILL NULL,
  PRIMARY KEY (`account_number`, `clientID`, `reg_no`),
  INDEX `fk_clientID_idx` (`clientID` ASC),
  INDEX `fk_reg_no_idx` (`reg_no` ASC),
  CONSTRAINT `fk_reg_no`
    FOREIGN KEY (`reg_no`)
    REFERENCES `DTUGRP16`.`RegNo` (`reg_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientID`
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
  `valuta` VARCHAR(45) NOT NULL,
  `currency` DECIMAL(5,2) ZEROFILL NULL,
  PRIMARY KEY (`valuta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DTUGRP16`.`Transaction`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Transaction` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Transaction` (
  `transactionID` INT NOT NULL AUTO_INCREMENT,
  `account_number` INT NOT NULL,
  `clientID` INT NOT NULL,
  `date_of_transaction` DATE,
  `recieve_account` VARCHAR(45) NOT NULL,
  `value` DECIMAL(5,2) NOT NULL,
  `valuta` VARCHAR(45) NOT NULL,
  `note` MEDIUMTEXT NULL,
  PRIMARY KEY (`transactionID`, `account_number`),
  INDEX `fk_clientID_idx` (`clientID` ASC),
  INDEX `fk_account_number_idx` (`account_number` ASC),
  INDEX `fk_valuta_idx` (`valuta` ASC),
  CONSTRAINT `fk_account_number`
    FOREIGN KEY (`account_number`)
    REFERENCES `DTUGRP16`.`Account` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientID_transaction`
    FOREIGN KEY (`clientID`)
    REFERENCES `DTUGRP16`.`Client` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_valuta`
    FOREIGN KEY (`valuta`)
    REFERENCES `DTUGRP16`.`Valuta` (`valuta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DTUGRP16`.`Interests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DTUGRP16`.`Interests` ;

CREATE TABLE IF NOT EXISTS `DTUGRP16`.`Interests` (
  `account_type` VARCHAR(45) NOT NULL,
  `interest_rate` DECIMAL(5,2) NULL,
  PRIMARY KEY (`account_type`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
