-- MySQL Script generated by MySQL Workbench
-- Wed Dec 27 22:14:35 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`accounting_firm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`accounting_firm` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `accounting_firm_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `zip_code` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `accounting_firm_id1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `accounting_firm_id1`),
  INDEX `fk_client_accounting_firm1_idx` (`accounting_firm_id1` ASC),
  CONSTRAINT `fk_client_accounting_firm`
    FOREIGN KEY (`accounting_firm_id1`)
    REFERENCES `mydb`.`accounting_firm` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`incoming_invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`incoming_invoices` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clients_id` INT UNSIGNED NOT NULL,
  `clients_accounting_firm_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  `price_vat` DECIMAL NOT NULL,
  PRIMARY KEY (`id`, `clients_id`, `clients_accounting_firm_id`),
  INDEX `fk_incoming_invoices_clients1_idx` (`clients_id` ASC, `clients_accounting_firm_id` ASC),
  CONSTRAINT `fk_incoming_invoices_clients1`
    FOREIGN KEY (`clients_id` , `clients_accounting_firm_id`)
    REFERENCES `mydb`.`client` (`id` , `accounting_firm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cost` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `accounting_firm_id` INT UNSIGNED NOT NULL,
  `client_id` INT UNSIGNED NOT NULL,
  `client_accounting_firm_id1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `accounting_firm_id`, `client_id`, `client_accounting_firm_id1`),
  INDEX `fk_cost_accounting_firm1_idx` (`accounting_firm_id` ASC),
  INDEX `fk_cost_client1_idx` (`client_id` ASC, `client_accounting_firm_id1` ASC),
  CONSTRAINT `fk_cost_accounting_firm1`
    FOREIGN KEY (`accounting_firm_id`)
    REFERENCES `mydb`.`accounting_firm` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cost_client1`
    FOREIGN KEY (`client_id` , `client_accounting_firm_id1`)
    REFERENCES `mydb`.`client` (`id` , `accounting_firm_id1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`outgoing_invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`outgoing_invoices` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clients_id` INT UNSIGNED NOT NULL,
  `clients_accounting_firm_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  `price_vat` DECIMAL NOT NULL,
  PRIMARY KEY (`id`, `clients_id`, `clients_accounting_firm_id`),
  INDEX `fk_incoming_invoices_clients1_idx` (`clients_id` ASC, `clients_accounting_firm_id` ASC),
  CONSTRAINT `fk_incoming_invoices_clients10`
    FOREIGN KEY (`clients_id` , `clients_accounting_firm_id`)
    REFERENCES `mydb`.`client` (`id` , `accounting_firm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`incoming_receipts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`incoming_receipts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clients_id` INT UNSIGNED NOT NULL,
  `clients_accounting_firm_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  `price_vat` DECIMAL NOT NULL,
  `accounting_firm_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `clients_id`, `clients_accounting_firm_id`, `accounting_firm_id`),
  INDEX `fk_incoming_invoices_clients1_idx` (`clients_id` ASC, `clients_accounting_firm_id` ASC),
  INDEX `fk_incoming_receipts_accounting_firm1_idx` (`accounting_firm_id` ASC),
  CONSTRAINT `fk_incoming_invoices_clients11`
    FOREIGN KEY (`clients_id` , `clients_accounting_firm_id`)
    REFERENCES `mydb`.`client` (`id` , `accounting_firm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_incoming_receipts_accounting_firm1`
    FOREIGN KEY (`accounting_firm_id`)
    REFERENCES `mydb`.`accounting_firm` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`outgoing_receipts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`outgoing_receipts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `clients_id` INT UNSIGNED NOT NULL,
  `clients_accounting_firm_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `date` DATETIME NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `price` DECIMAL NOT NULL,
  `price_vat` DECIMAL NOT NULL,
  `accounting_firm_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `clients_id`, `clients_accounting_firm_id`, `accounting_firm_id`),
  INDEX `fk_incoming_invoices_clients1_idx` (`clients_id` ASC, `clients_accounting_firm_id` ASC),
  INDEX `fk_outgoing_receipts_accounting_firm1_idx` (`accounting_firm_id` ASC),
  CONSTRAINT `fk_incoming_invoices_clients100`
    FOREIGN KEY (`clients_id` , `clients_accounting_firm_id`)
    REFERENCES `mydb`.`client` (`id` , `accounting_firm_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_outgoing_receipts_accounting_firm1`
    FOREIGN KEY (`accounting_firm_id`)
    REFERENCES `mydb`.`accounting_firm` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;